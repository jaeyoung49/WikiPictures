
package org.kosta.wikipictures.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.wikipictures.service.MemberService;
import org.kosta.wikipictures.service.PictureService;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
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

	@Resource
	private PictureService pictureService;

	@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName, @PathVariable String viewName) {
		System.out.println("2.@PathVariable:" + dirName + "/" + viewName);
		return dirName + "/" + viewName;
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpServletRequest request) {
		MemberVO vo = memberService.login(memberVO);
		if (vo == null) {
			return "member/login_all_fail";
		}
		if (vo.getId().equals("admin")) {
			request.getSession().setAttribute("mvo", vo);
			return "redirect:show_member_list.do";
		} else {
			request.getSession().setAttribute("mvo", vo);
			String referer=request.getHeader("referer");
			//return "redirect:"+referer;
			return "redirect:showMypictureList.do";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		return "redirect:home.do";
	}

	@RequestMapping("company_introduce.do")
	public String introduce() {
		return "company_introduce";
	}

	@RequestMapping("tos.do")
	public String tos() {
		return "tos";
	}

	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}

	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:registerResultView.do?id=" + vo.getId();
	}

	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_member_result", "memberVO", vo);
	}

	// 마이페이지 회원정보수정
	@RequestMapping("updateMember.do")
	public String updateMember(HttpServletRequest request, MemberVO memberVO) {
		HttpSession session = request.getSession(false);
		session.setAttribute("mvo", memberVO);
		memberService.updateMember(memberVO);
		return "member/update_result";
	}

	// 마이페이지 내가올린사진들보기 게시판
	@RequestMapping("showMypictureList.do")
	public ModelAndView showMypictureList(HttpServletRequest request, String pageNo) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		return new ModelAndView("member/show_mypicture_list", "pvo", pictureService.showMypictureList(pageNo, mvo));
	}

	// 마이페이지 시크릿댓글목록보기 게시판
	@RequestMapping("showSecretreplyList.do")
	public ModelAndView showSecretreplyList(HttpServletRequest request, String pageNo) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		return new ModelAndView("member/show_secretreply_list", "svo", pictureService.showSecretreplyList(pageNo, mvo));
	}

	// 마이페이지 구매내역보기 게시판
	@RequestMapping("showBuyList.do")
	public ModelAndView showBuyList(HttpServletRequest request, String pageNo) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		return new ModelAndView("member/show_buy_list", "bvo", pictureService.showBuyList(pageNo, mvo));
	}

	/**
	 * 
	 * <PRE>
	 * 메소드 설명
	 * </PRE>
	 * 
	 * @date : 2016. 12. 8.
	 * @author : Jaeyoung
	 * @param mypageVO
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("registerBuy.do")
	public String registerBuy(MypageVO mypageVO) throws UnsupportedEncodingException {
		memberService.registerBuy(mypageVO);
		String keyword = URLEncoder.encode(mypageVO.getPictureVO().getKeyword(), "UTF-8");
		return "redirect:searchDetailPicture.do?keyword=" + keyword + "&pictureDate="
				+ mypageVO.getPictureVO().getPictureDate();
	}

}
