
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
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {


	//회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource
	private MemberService memberService;

	@Resource
	private PictureService pictureService;


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
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMember.do")
	public String updateMember(MemberVO memberVO) {
		// Spring Security 세션 회원정보를 반환받는다
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("Spring security 세션 수정 전 회원정보 : " + mvo);
		
		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodePassword);
		memberService.updateMember(memberVO);
		
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		mvo.setPassword(encodePassword);
		mvo.setNickname(memberVO.getNickname());
		mvo.setFavoriteSpace(memberVO.getFavoriteSpace());
		System.out.println("Spring Security 세션 수정 후 회원정보 : " + mvo);
		return "member/update_result";
	}

	// 마이페이지 내가올린사진들보기 게시판
	@Secured("ROLE_MEMBER")
	@RequestMapping("showMypictureList.do")
	public ModelAndView showMypictureList(String pageNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ModelAndView("member/show_mypicture_list", "pvo", pictureService.showMypictureList(pageNo, mvo));
	}

	// 마이페이지 시크릿댓글목록보기 게시판
	@Secured("ROLE_MEMBER")
	@RequestMapping("showSecretreplyList.do")
	public ModelAndView showSecretreplyList(String pageNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ModelAndView("member/show_secretreply_list", "svo", pictureService.showSecretreplyList(pageNo, mvo));
	}

	// 마이페이지 구매내역보기 게시판
	@Secured("ROLE_MEMBER")
	@RequestMapping("showBuyList.do")
	public ModelAndView showBuyList(String pageNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
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
	@Secured("ROLE_MEMBER")
	@RequestMapping("registerBuy.do")
	public String registerBuy(MypageVO mypageVO) throws UnsupportedEncodingException {
		memberService.registerBuy(mypageVO);
		String keyword = URLEncoder.encode(mypageVO.getPictureVO().getKeyword(), "UTF-8");
		return "redirect:searchDetailPicture.do?keyword=" + keyword + "&pictureDate="
				+ mypageVO.getPictureVO().getPictureDate();
	}

}
