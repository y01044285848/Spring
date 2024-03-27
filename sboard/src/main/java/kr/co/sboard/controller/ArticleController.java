package kr.co.sboard.controller;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.sboard.config.AppInfo;
import kr.co.sboard.dto.ArticleDTO;
import kr.co.sboard.dto.PageRequestDTO;
import kr.co.sboard.dto.PageResponseDTO;
import kr.co.sboard.entity.Config;
import kr.co.sboard.repository.ConfigRepository;
import kr.co.sboard.service.ArticleService;
import kr.co.sboard.service.FileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Controller
public class ArticleController {

    private final ArticleService articleService;
    private final AppInfo appInfo;

    /*
        @ModelAttribute("cate")
         - modelAttribute("cate", cate)와 동일
    */
    @GetMapping("/article/list")
    public String list(Model model, String cate, PageRequestDTO pageRequestDTO){

        PageResponseDTO pageResponseDTO = null;

        if(pageRequestDTO.getKeyword() == null){
            // 일반 글 목록 조회
            pageResponseDTO = articleService.selectArticles(pageRequestDTO);
            log.info("pageResponseDTO : " + pageResponseDTO);
        }else{
            // 검색 글 목록 조회
            pageResponseDTO = articleService.searchArticles(pageRequestDTO);
        }


        model.addAttribute(pageResponseDTO);
        model.addAttribute(appInfo);
        return "/article/list";
    }

    @GetMapping("/article/write")
    public String write(Model model, String cate, PageRequestDTO pageRequestDTO){

        PageResponseDTO pageResponseDTO = PageResponseDTO.builder()
                .pageRequestDTO(pageRequestDTO)
                .build();

        model.addAttribute(pageResponseDTO);

        return "/article/write";
    }

    @PostMapping("/article/write")
    public String write(HttpServletRequest req, ArticleDTO articleDTO){
        /*
            글작성을 테스트할 때는 로그인해야하기 때문에
            SecurityConfig 인가 설정 수정할 것
        */
        String regip = req.getRemoteAddr();
        articleDTO.setRegip(regip);

        log.info(articleDTO.toString());

        articleService.insertArticle(articleDTO);

        return "redirect:/article/list" + "?cate=" + articleDTO.getCate();
    }

    @GetMapping("/article/view")
    public String view(Model model, String cate, int no){

        ArticleDTO articleDTO = articleService.findById(no);
        model.addAttribute(articleDTO);

        return "/article/view";
    }

    @GetMapping("/article/modify")
    public String modify(int no, Model model){
        ArticleDTO articleDTO = articleService.findById(no);
        model.addAttribute(articleDTO);

        return "/article/modify";
    }

    @PostMapping("/article/modify")
    public String modify(ArticleDTO articleDTO, String deleteFile){
        int delFileCount = 0;
        if(deleteFile != null && !deleteFile.isEmpty() && !deleteFile.isBlank()){

            String[] delArr = deleteFile.split(",");
            delFileCount = delArr.length;

            articleService.modifyArticleFile(delArr);
        }
        articleService.modifyArticle(articleDTO, delFileCount);


        return "redirect:/index";
    }

    @GetMapping("/article/delete")
    public String delete(int no){
        articleService.deleteArticle(no);
        return "redirect:/index";
    }

}