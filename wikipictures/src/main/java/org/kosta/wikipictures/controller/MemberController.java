package org.kosta.wikipictures.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.wikipictures.service.MemberService;
import org.kosta.wikipictures.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@RequestMapping("{viewName}.do")
	public String showView(@PathVariable String viewName) {
		System.out.println("1.@PathVariable:" + viewName);
		return viewName;
	}

	@Resource
	private MemberService memberService;

	@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName, @PathVariable String viewName) {
		System.out.println("2.@PathVariable:" + dirName + "/" + viewName);
		return dirName + "/" + viewName;
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpServletRequest request) {
		MemberVO vo = memberService.login(memberVO);
		if (vo == null) {
			return "member/login_fail";
		}if(vo.getId().equals("admin")){
			request.getSession().setAttribute("mvo", vo);
			return "admin/admin";
		}else {
			request.getSession().setAttribute("mvo", vo);
			System.out.println(vo.getId());
			return "home";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		return "home";
	}
	@RequestMapping("introduce.do")
	public String test(){
		return "company_introduce";
	}
	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {		
		return memberService.idcheck(id);			
	}	
	@RequestMapping(value="registerMember.do", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);		
		return "redirect:registerResultView.do?id=" + vo.getId();
	}
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String id) {		
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result", "memberVO", vo);
	}
	
}

