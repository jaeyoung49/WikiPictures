package org.kosta.wikipictures.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.service.MemberService;
import org.kosta.wikipictures.service.PictureService;
import org.kosta.wikipictures.service.ReportService;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class AdminContoller {
	
	@Resource
	private MemberService memberService;
	@Resource
	private ReportService reportService;
	@Resource
	private PictureService pictureService;
	
	@RequestMapping("memberlist.do")
	public ModelAndView memberList(String pageNo){
		System.out.println("멤버리스트 컨트롤러");
		System.out.println(memberService.memberList(pageNo));
		return new ModelAndView("admin/memberlist","listVO",memberService.memberList(pageNo));
	}
	
	@RequestMapping("reportlist.do")
	public ModelAndView reportList(ReportVO rvo){
		List<ReportVO> rlist = reportService.reportList(rvo);
		return new ModelAndView("admin/reportlist","reportVO",rlist);
	}
	@RequestMapping("picturelist.do")
	public ModelAndView pictureList(PictureVO pvo){
		List<PictureVO> plist=pictureService.pictureList(pvo);
		return new ModelAndView("admin/picturelist","pictureVO",plist);
	}
}
