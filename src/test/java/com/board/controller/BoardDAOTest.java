package com.board.controller;

import com.board.domain.RboardVO;
import com.board.dao.BoardDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.inject.Inject;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {

    @Inject
    private BoardDAO boardDAO;

    private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

    // 게시글 입력 테스트, 더미데이터 입력
    @Test
    public void testCreate() throws Exception {
        for (int i = 1; i <= 1; i++) {
            RboardVO boardVO = new RboardVO();
            boardVO.setReview_title(i + "번째 글제");
            boardVO.setReview_content(i + "번째용입.");
            boardVO.setUser_id("asd" + (i % 10));
            boardDAO.write(boardVO);
        }
    }

    // 게시글 조회 테스트
    @Test
    public void testRead() throws Exception {
        logger.info(boardDAO.read(1).toString());
    }

    // 게시글 수정 테스트
    @Test
    public void testUpdate() throws Exception {
        RboardVO boardVO = new RboardVO();
        boardVO.setReview_id(1000);
        boardVO.setReview_title(1000 + "번째 글 수정한 제목입니다...");
        boardVO.setReview_content(1000 + "번째 글 수정한 내용입니다.......");
        boardDAO.update(boardVO);
    }

    // 게시글 삭제 테스트
    @Test
    public void testDelete() throws Exception {
        boardDAO.delete(1000);
    }

    // 게시글 목록 테스트
//    @Test
//    public void testList() throws Exception {
//        boardDAO.list();
//    }

//    // 게시글 목록 페이징 테스트
//    @Test
//    public void testListPaging() throws Exception {
//        Criteria criteria = new Criteria();
//        criteria.setPage(3);
//        criteria.setPerPageNum(20);
//        List<BoardVO> list = boardDAO.list(criteria);
//
//        for (BoardVO boardVO : list) {
//            logger.info(boardVO.getBno() + " : " + boardVO.getTitle());
//        }
//    }
//
//    // UriComponentBuilder 테스트
//    @Test
//    public void testURI() throws Exception {
//        UriComponents uriComponents = UriComponentsBuilder.newInstance()
//                .path("/board/read")
//                .queryParam("bno", 12)
//                .queryParam("perPageNum", 20)
//                .build();
//
//        logger.info("/board/read?bno=12&perPageNum=20");
//        logger.info(uriComponents.toString());
//    }
//
//    // UriComponentBuilder 테스트 2
//    @Test
//    public void testURI2() throws Exception {
//        UriComponents uriComponents = UriComponentsBuilder.newInstance()
//                .path("/{module}/{page}")
//                .queryParam("bno", 12)
//                .queryParam("perPageNum", 20)
//                .build()
//                .expand("board", "read")
//                .encode();
//
//        logger.info("/board/read?bno=12&perPageNum=20");
//        logger.info(uriComponents.toString());
//    }

}