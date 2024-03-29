package kr.co.sboard.repository.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import kr.co.sboard.dto.PageRequestDTO;
import kr.co.sboard.entity.Article;
import kr.co.sboard.entity.QArticle;
import kr.co.sboard.entity.QUser;
import kr.co.sboard.repository.custom.ArticleRepositoryCustom;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@RequiredArgsConstructor
@Slf4j
public class  ArticleRepositoryImpl implements ArticleRepositoryCustom {

    private final JPAQueryFactory jpaQueryFactory;

    private QArticle qArticle = QArticle.article;
    private QUser qUser = QUser.user;

    @Override
    public Page<Tuple> selectArticles(PageRequestDTO pageRequestDTO, Pageable pageable) {

        String cate = pageRequestDTO.getCate();

        QueryResults<Tuple> results = jpaQueryFactory
                .select(qArticle, qUser.nick)
                .from(qArticle)
                .where(qArticle.cate.eq(cate).and(qArticle.parent.eq(0)))
                .join(qUser)
                .on(qArticle.writer.eq(qUser.uid))
                .orderBy(qArticle.rdate.desc())
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .fetchResults();

        List<Tuple> content = results.getResults();
        long total = results.getTotal();

        return new PageImpl<>(content, pageable, total);
    }
    @Override
    public Page<Tuple> searchArticles(PageRequestDTO pageRequestDTO, Pageable pageable) {

        String cate = pageRequestDTO.getCate();
        String type = pageRequestDTO.getType();
        String keyword = pageRequestDTO.getKeyword();

        BooleanExpression expression = null;

        if(type.equals("title")){
            expression = qArticle.cate.eq(cate).and(qArticle.title.contains(keyword));
            log.info("expression : " + expression);
        }else if(type.equals("content")){
            expression = qArticle.cate.eq(cate).and(qArticle.content.contains(keyword));
            log.info("expression : " + expression);
        }else if(type.equals("title_content")){

            BooleanExpression titleContains = qArticle.title.contains(keyword);
            BooleanExpression contentContains = qArticle.content.contains(keyword);

            expression = qArticle.cate.eq(cate).and(titleContains.or(contentContains));
            log.info("expression : " + expression);
        }else if(type.equals("writer")){
            expression = qArticle.cate.eq(cate).and(qArticle.parent.eq(0)).and(qUser.nick.contains(keyword));
            log.info("expression : " + expression);
        }

        QueryResults<Tuple> results = jpaQueryFactory
                .select(qArticle, qUser.nick)
                .from(qArticle)
                .join(qUser)
                .on(qArticle.writer.eq(qUser.uid))
                .where(expression)
                .orderBy(qArticle.rdate.desc())
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .fetchResults();

        List<Tuple> content = results.getResults();
        long total = results.getTotal();

        return new PageImpl<>(content, pageable, total);
    }
}
