package org.kosta.wikipictures.controller;

import javax.annotation.Resource;

import org.kosta.wikipictures.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class AdminContoller {
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping("show_member_list.do")
	public ModelAndView memberList(String pageNo){
		return new ModelAndView("admin/show_member_list","listVO",adminService.memberList(pageNo));
	}
	@RequestMapping("show_report_list.do")
	public ModelAndView reportList(String pageNo){
		return new ModelAndView("admin/show_report_list","reportVO",adminService.reportList(pageNo));
	}
	@RequestMapping("show_picture_list.do")
	public ModelAndView pictureList(String pageNo){
		return new ModelAndView("admin/show_picture_list","pictureVO",adminService.mypictures(pageNo));
	}
	@RequestMapping("show_sell_list.do")
	public String iu(){
		return "admin/show_sell_list";
	}
}

