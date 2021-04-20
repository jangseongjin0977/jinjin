package com.board.domain;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.dao.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(UserDAOTest.class);
	
	@Inject
	private UserDAO userDAO;
	
	//회원정보 수정 테스트
	@Test
	public void testUpdate() throws Exception {
		UserVO user = new UserVO();
		user.setUserId("test");
		user.setPw("test");
		user.setEmail("test");
		userDAO.userUpdate(user);
	}
	
	//회원탈퇴 테스트
//	@Test
//	public void testDelete() throws Exception {
//		UserVO user = new UserVO();
//		user.setUserId("test");
//		user.setPw("test");
//		userDAO.userDelete(user);
//	}
	
	
	
}
