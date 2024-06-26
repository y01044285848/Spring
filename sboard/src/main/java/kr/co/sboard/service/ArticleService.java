package kr.co.sboard.service;

import com.querydsl.core.Tuple;
import kr.co.sboard.dto.*;
import kr.co.sboard.entity.Article;
import kr.co.sboard.entity.File;
import kr.co.sboard.entity.User;
import kr.co.sboard.repository.ArticleRepository;
import kr.co.sboard.repository.FileRepository;
import kr.co.sboard.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@RequiredArgsConstructor
@Service
public class ArticleService {

    private final ArticleRepository articleRepository;
    private final UserRepository userRepository;
    private final FileService fileService;
    private final FileRepository fileRepository;

    // RootConfig Bean 생성/등록
    private final ModelMapper modelMapper;

    public PageResponseDTO selectArticles(PageRequestDTO pageRequestDTO){

        Pageable pageable = pageRequestDTO.getPageable("no");

        Page<Tuple> pageArticle = articleRepository.selectArticles(pageRequestDTO, pageable);


        List<ArticleDTO> dtoList = pageArticle.getContent().stream()
                .map(tuple -> {
                    Article article = tuple.get(0, Article.class);
                    String nick = tuple.get(1,String.class);
                    article.setNick(nick);

                    return modelMapper.map(article, ArticleDTO.class);
                }
                )
                .toList();

        for(ArticleDTO article :dtoList){
            Optional<User> optUser = userRepository.findById(article.getWriter());

            /*
            0326 
            articleDTO user에 userDTO 주입 
            */
            UserDTO userDTO = null;
            if(optUser.isPresent()){
                User user = optUser.get();
                userDTO = modelMapper.map(user, UserDTO.class);
            }
            article.setUser(userDTO);

        }

        int total = (int) pageArticle.getTotalElements();

        return PageResponseDTO.builder()
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total(total)
                .build();
    }

    public PageResponseDTO searchArticles(PageRequestDTO pageRequestDTO){

        Pageable pageable = pageRequestDTO.getPageable("no");

        Page<Tuple> pageArticle = articleRepository.searchArticles(pageRequestDTO, pageable);


        List<ArticleDTO> dtoList = pageArticle.getContent().stream()
                .map(tuple -> {
                            Article article = tuple.get(0, Article.class);
                            String nick = tuple.get(1,String.class);
                            article.setNick(nick);

                            return modelMapper.map(article, ArticleDTO.class);
                        }
                )
                .toList();

        for(ArticleDTO article :dtoList){
            Optional<User> optUser = userRepository.findById(article.getWriter());

            /*
            0326
            articleDTO user에 userDTO 주입
            0328
            join 구문 추가로 삭제 예정
            */
            UserDTO userDTO = null;
            if(optUser.isPresent()){
                User user = optUser.get();
                userDTO = modelMapper.map(user, UserDTO.class);
            }
            article.setUser(userDTO);

        }

        int total = (int) pageArticle.getTotalElements();

        return PageResponseDTO.builder()
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total(total)
                .build();
    }

    public ArticleDTO findById(int no){

        Optional<Article> optArticle = articleRepository.findById(no);


        ArticleDTO articleDTO = null;

        if(optArticle.isPresent()){

            Article article = optArticle.get();
            /*
            0326
            article 조회수 추가
            entity setter 이용, 다른 방법 찾아볼것
             */
            article.setHit(article.getHit()+1);
            articleRepository.save(article);
            log.info("findbyid : "+article.toString());
            articleDTO = modelMapper.map(article, ArticleDTO.class);
        }
        log.info("articleDTO : " + articleDTO.toString());

        return articleDTO;
    }


    public void insertArticle(ArticleDTO articleDTO){

        // 파일 첨부 처리
        List<FileDTO> files = fileService.fileUpload(articleDTO);
        log.info("Test" + files);
        // 파일 첨부 갯수 초기화
        articleDTO.setFile(files.size());


        // articleDTO를 articleEntity로 변환
        Article article = modelMapper.map(articleDTO, Article.class);
        log.info(article.toString());

        // 저장 후 저장한 엔티티 객체 반환(사실 JPA sava() 메서드는 default로 저장한 Entity를 반환)
        Article savedArticle = articleRepository.save(article);
        log.info("insertArticle : " + savedArticle);

        // 파일 insert
        for(FileDTO fileDTO : files){

            fileDTO.setAno(savedArticle.getNo());

            // 여기서 에러나는데 RootConfig 파일에 ModelMapper 설정에 이거 추가 -> .setMatchingStrategy(MatchingStrategies.STRICT)
            File file = modelMapper.map(fileDTO, File.class);

            fileRepository.save(file);
        }
    }

    public void deleteArticle(int no){
        List<File> files = fileRepository.findByAno(no);
        for(File file:files){
            String delFile = file.getSName();
            fileService.deleteFile(delFile);
            fileRepository.deleteById(file.getFno());
        }
        articleRepository.deleteById(no);
    }

    /*
    0327 추가
    수정에서 파일 추가될 경우 파일 업로드 처리
    글에 첨부된 파일 개수 동기화
    */
    public void modifyArticle(ArticleDTO articleDTO, int delFileCount){

        // 파일 첨부 처리
        List<FileDTO> files = fileService.fileUpload(articleDTO);
        log.info("Test" + files);
        // 파일 첨부 갯수 초기화
        Optional<Article> optArticle = articleRepository.findById(articleDTO.getNo());
        log.info(optArticle+"oparticle");
        if(optArticle.isPresent()){
            Article article = optArticle.get();
            article.setTitle(articleDTO.getTitle());
            article.setContent(articleDTO.getContent());
            article.setFile(article.getFile() + articleDTO.getFile() - delFileCount);

            Article savedArticle = articleRepository.save(article);
            log.info("upload Test2");
            for(FileDTO fileDTO : files){

                fileDTO.setAno(savedArticle.getNo());

                // 여기서 에러나는데 RootConfig 파일에 ModelMapper 설정에 이거 추가 -> .setMatchingStrategy(MatchingStrategies.STRICT)
                File file = modelMapper.map(fileDTO, File.class);

                fileRepository.save(file);
                log.info("upload Test2");
            }
        }

    }

    public void modifyArticleFile(String[] delFiles){

        /*
        0327
        수정에서 파일 삭제시
        파일 DB, upload파일 삭제
         */

        for(String file : delFiles){
            int fileNo = Integer.parseInt(file);
            Optional<File> optDelFile = fileRepository.findById(fileNo);
            if(optDelFile.isPresent()){
                File delFile = optDelFile.get();

                fileService.deleteFile(delFile.getSName());
            }
            fileRepository.deleteById(fileNo);
        }



    }

}