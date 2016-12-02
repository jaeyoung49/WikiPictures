package org.kosta.wikipictures;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.wikipictures.controller.MemberController;
import org.kosta.wikipictures.controller.PictureController;
import org.kosta.wikipictures.dao.MemberDAO;
import org.kosta.wikipictures.dao.PictureDAO;
import org.kosta.wikipictures.service.MemberService;
import org.kosta.wikipictures.service.PictureService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/wikipictures-model.xml"})
public class TestUnit {
	@Resource
	private PictureController pictureController;
	@Resource
	private PictureService pictureService;
	@Resource
	private PictureDAO pictureDAO;
	@Resource
	private MemberController memberController;
	@Resource
	private MemberService memberService;
	@Resource
	private MemberDAO memberDAO;
	
	
	@Test
	public void mainTest(){
		System.out.println(memberDAO.findMemberById("java"));
		
	}
}
