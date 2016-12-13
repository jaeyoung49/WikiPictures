package org.kosta.wikipictures.controller;

import javax.annotation.Resource;

import org.kosta.wikipictures.service.AdminService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@Resource
	private AdminService adminService;

	@Secured({"ROLE_MEMBER","ROLE_ADMIN"})
	@RequestMapping("show_member_list.do")
	public ModelAndView memberList(String pageNo) {
		return new ModelAndView("admin/show_member_list", "listVO", adminService.memberList(pageNo));
	}

	@Secured({"ROLE_MEMBER","ROLE_ADMIN"})
	@RequestMapping("show_report_list.do")
	public ModelAndView reportList(String pageNo) {
		return new ModelAndView("admin/show_report_list", "reportVO", adminService.reportList(pageNo));
	}

	@Secured({"ROLE_MEMBER","ROLE_ADMIN"})
	@RequestMapping("show_picture_list.do")
	public ModelAndView pictureList(String pageNo) {
		return new ModelAndView("admin/show_picture_list", "pictureVO", adminService.mypictures(pageNo));
	}

	@Secured({"ROLE_MEMBER","ROLE_ADMIN"})
	@RequestMapping("show_sell_list.do")
	public ModelAndView sellList(String pageNo) {
		return new ModelAndView("admin/show_sell_list", "sellList", adminService.sellList(pageNo));
	}
}
