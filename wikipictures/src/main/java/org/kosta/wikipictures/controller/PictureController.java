package org.kosta.wikipictures.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.wikipictures.dao.PictureDAO;
import org.kosta.wikipictures.service.AdminService;
import org.kosta.wikipictures.service.PictureService;
import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;
import org.kosta.wikipictures.vo.TimeMachineVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PictureController {

	@Resource
	private PictureService pictureService;
	@Resource
	private PictureDAO pictureDAO;
	@Resource
	private AdminService adminService;

	// 업로드 경로
	private String uploadPath;

	// 메인화면
	@RequestMapping("home.do")
	public ModelAndView home(String timeMachineYear) {
		ModelAndView mv = new ModelAndView();
		TimeMachineVO timeMachineVO = null;

		// 타임머신 목록 리스트
		List<TimeMachineVO> timeMachineYearList = pictureService.getTimeMachineList();

		// 타임머신 해당연도
		if (timeMachineYear == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
			timeMachineYear = sdf.format(new Date());
		}
		// 해당연도의 타임머신 객체 뽑기
		for (TimeMachineVO tvo : timeMachineYearList) {
			if (tvo.getTimeMachineYear() == Integer.parseInt(timeMachineYear)) {
				timeMachineVO = tvo;
				break;
			}
		}

		// 사건, 인물장소 사진 리스트
		List<PictureVO> accidentPictureList = pictureService.getAccidentPictureList(timeMachineYear);
		List<PictureVO> personAndLocationPictureList = pictureService.getPersonAndLocationPictureList(timeMachineYear);

		// ModelAndView에 Parameter값 설정
		mv.addObject("timeMachineYearList", timeMachineYearList); // 타임머신 연도 리스트
		mv.addObject("timeMachineVO", timeMachineVO); // 타임머신 객체
		mv.addObject("accidentPictureList", accidentPictureList); // 사건 사진리스트
		mv.addObject("personAndLocationPictureList", personAndLocationPictureList); // 사건
																					// 사진리스트
		mv.setViewName("home"); // viewName 설정

		return mv;
	}

	// 사진 전체 나오는지 테스트
	@RequestMapping("test2.do")
	public ModelAndView test2() {
		ModelAndView mv = new ModelAndView();

		mv.addObject("list", pictureDAO.getPictures());
		mv.setViewName("test2");
		return mv;
	}

	@RequestMapping("test.do")
	public ModelAndView test() {
		return new ModelAndView("picture/upload_form");
	}

	// 사진 등록
	@Secured("ROLE_MEMBER")
	@RequestMapping(method = RequestMethod.POST, value = "registerPicture.do")
	public String registerPicture(PictureVO pictureVO, String tempHashtags, HttpServletRequest request)
			throws UnsupportedEncodingException {

		// 사진 정보 세팅 - 날짜
		pictureVO.setPictureDate(pictureVO.getPictureDate().trim().substring(0, 7));

		// 해시태그 세팅 - 태그 정렬
		List<HashtagVO> hashtagList = new ArrayList<HashtagVO>();
		if(tempHashtags.equals("")==false && tempHashtags!=null){
			String[] tags = tempHashtags.split(",");
			for (int i = 0; i < tags.length; i++) {
				tags[i] = tags[i].trim();
			}
			ArrayList<String> hashtagName = new ArrayList<String>();
			for (String str : tags) {
				boolean duplicated = false;
				for (int i = 0; i < hashtagName.size(); i++) {
					if (str.equals(hashtagName.get(i)))
						duplicated = true;
					break;
				}
				if (duplicated == false)
					hashtagName.add(str);
			}
			for (String str : hashtagName) {
				HashtagVO hvo = new HashtagVO();
				hvo.setHashtagName(str);
				hvo.setPictureVO(pictureVO);
				hashtagList.add(hvo);
			}
		}

		// 사진파일을 서버에 저장
		// 폴더 지정 및 생성
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		File uploadDir = new File(uploadPath);
		if (uploadDir.exists() == false)
			uploadDir.mkdirs();

		// 보내줄 사진 지정 및 저장할 위치의 파일명 지정
		MultipartFile file = pictureVO.getUploadFile();
		System.out.println(file.getOriginalFilename());

		// 파일 전송
		if (file.isEmpty() == false) {
			// 키워드 빈공백 제거
			String adjustKeyword = pictureVO.getKeyword().replaceAll(" ", "");
			pictureVO.setKeyword(adjustKeyword);
			// 파일이름
			String fileName = pictureVO.getKeyword() + "_" + pictureVO.getPictureDate()
					+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println("파일명 : " + fileName);
			File uploadFile = new File(uploadPath + fileName);
			// 사진 정보 세팅 - path
			pictureVO.setPath(fileName);
			try {
				file.transferTo(uploadFile);
				System.out.println(uploadPath + fileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		// Spring Security 에서 Session값 가져오기
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		pictureVO.getMemberVO().setId(memberVO.getId());
		
		// 사진정보를 DB에 저장
		pictureService.registerPicture(pictureVO);
		
		// 해시태그를 DB에 저장
		if(tempHashtags.equals("")==false && tempHashtags!=null)
			pictureService.registerHashtag(hashtagList);
			
		// 이동 경로
		String keyword = URLEncoder.encode(pictureVO.getKeyword(), "UTF-8");
		return "redirect:searchDetailPicture.do?pictureDate=" + pictureVO.getPictureDate() + "&keyword=" + keyword;
	}

	// 사진검색
	@RequestMapping("searchPicture.do")
	public ModelAndView searchPicture(HttpServletRequest request, PictureVO pictureVO) {
		String kw = request.getParameter("keyword");
		List<PictureVO> searchPicture = pictureService.searchPicture(kw);
		List<PictureVO> searchHashtagPicture = pictureService.searchHashtag(kw);
		/*
		 * List<HashtagVO> searchHashtag =pictureService.searchHashtag(kw);
		 * request.setAttribute("searchHashtag", searchHashtag);
		 */
		if (searchPicture.isEmpty() && searchHashtagPicture.isEmpty()) {
			return new ModelAndView("picture/search_picture_fail");
		} else if (searchHashtagPicture.isEmpty()) {
			System.out.println("1" + searchPicture);
			return new ModelAndView("picture/search_picture_ok", "searchPicture", searchPicture);
		} else if (searchPicture.isEmpty()) {
			System.out.println("2" + searchHashtagPicture);
			return new ModelAndView("picture/search_picture_ok", "searchHashtagPicture", searchHashtagPicture);
		} else {
			ModelAndView mv = new ModelAndView();
			mv.addObject("searchPicture", searchPicture);
			mv.addObject("searchHashtagPicture", searchHashtagPicture);
			mv.setViewName("picture/search_picture_ok");
			/* mv.addObject("searchHashtagPicture", searchHashtagPicture); */
			return mv;
		}
	}

	/**
	 * 
	  * <PRE>
	  * 메소드 설명
	  * </PRE>
	  * @date : 2016. 12. 12.
	  * @author : Jaeyoung
	  * @param hashtagVO
	  * @param pictureVO
	  * @return
	 */
	@RequestMapping("searchDetailPicture.do")
	public ModelAndView searchDetailPicture(HashtagVO hashtagVO, PictureVO pictureVO) {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = null;
		// Spring Security 세션 회원정보를 반환받는다
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof MemberVO)
			memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// 사진 내용
		PictureVO picturevo = pictureService.picture(pictureVO);
		// 해쉬태그 내용
		hashtagVO.setPictureVO(picturevo);
		List<HashtagVO> pvo = pictureService.searchDetailPicture(hashtagVO);
		// 시크릿댓글
		if (memberVO != null) {
			MypageVO mypageVO = new MypageVO();
			mypageVO.setMemberVO(memberVO);
			mypageVO.setPictureVO(picturevo);
			mypageVO = pictureService.getMypageVO(mypageVO);
			mv.addObject("mypageVO", mypageVO);
		}

		// ModelAndView에 값
		mv.addObject("picturevo", picturevo);
		mv.addObject("pvo", pvo);
		mv.addObject("memberVO", memberVO);
		// 경로
		mv.setViewName("picture/show_picture_detail");
		return mv;
	}

	// 사진 신고
	@RequestMapping("register_report_form.do")
	public ModelAndView pictureList(HttpServletRequest request, HashtagVO hashtagVO, PictureVO pictureVO) {
		PictureVO picturevo = pictureService.picture(pictureVO);
		hashtagVO.setPictureVO(picturevo);
		List<HashtagVO> pvo = pictureService.searchDetailPicture(hashtagVO);
		request.setAttribute("picturevo", picturevo);
		System.out.println(pvo);
		return new ModelAndView("picture/register_report_form", "pvo", pvo);
	}

	@RequestMapping("report.do")
	public String report(ReportVO rvo) {
		pictureService.report(rvo);
		return "picture/report_ok";
	}

	// 해시태그추가//
	@RequestMapping("addHashtag.do")
	public ModelAndView addHashtag(HashtagVO hashtagVO, PictureVO pictureVO) throws UnsupportedEncodingException {
		String hash = hashtagVO.getHashtagName().trim();
		hash = hash.replaceAll("\\p{Z}", "");
		hash = hash.replaceAll("\\p{Space}", "");
		/* System.out.println("1"+hash); */
		String[] tags = hash.split(",");
		for (int i = 0; i < tags.length; i++) { 
			tags[i] = tags[i].trim();
		}
		ArrayList<String> hashtagNames = new ArrayList<String>();
		for (String str : tags) {
			boolean duplicated = false;
			for (int i = 0; i < hashtagNames.size(); i++) {
				if (str.equals(hashtagNames.get(i)))
					duplicated = true;
				break;
			}
			if (duplicated == false)
				hashtagNames.add(str);
		}
		List<HashtagVO> hashtagList = new ArrayList<HashtagVO>();
		for (String str : hashtagNames) {
			str = str.replaceAll("\\p{Space}", "");
			HashtagVO hvo = new HashtagVO();
			hvo.setHashtagName(str);
			hvo.setPictureVO(pictureVO);
			hashtagList.add(hvo);
		}
		pictureService.registerHashtag(hashtagList);
		// 해시태그 세팅 - 태그 정렬
		String keyword = URLEncoder.encode(pictureVO.getKeyword(), "UTF-8");
		return new ModelAndView(
				"redirect:searchDetailPicture.do?keyword=" + keyword + "&pictureDate=" + pictureVO.getPictureDate());
	}

	/**
	 * 
	 * <PRE>
	 * 원작자 코멘트 수정
	 * </PRE>
	 * 
	 * @date : 2016. 12. 7.
	 * @author : Jaeyoung
	 * @param pictureVO
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateAuthorComment.do")
	public String updateAuthorComment(PictureVO pictureVO) throws UnsupportedEncodingException {
		pictureService.updateAuthorComment(pictureVO);
		String keyword = URLEncoder.encode(pictureVO.getKeyword(), "UTF-8");
		return "redirect:searchDetailPicture.do?keyword=" + keyword + "&pictureDate=" + pictureVO.getPictureDate();
	}

	/**
	 * 
	 * <PRE>
	 * 메소드 설명
	 * </PRE>
	 * 
	 * @date : 2016. 12. 7.
	 * @author : Jaeyoung
	 * @param mypageVO
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("registerSecretReply.do")
	public String registerSecretReply(MypageVO mypageVO) throws UnsupportedEncodingException {
		pictureService.registerSecretReply(mypageVO);
		String keyword = URLEncoder.encode(mypageVO.getPictureVO().getKeyword(), "UTF-8");
		return "redirect:searchDetailPicture.do?keyword=" + keyword + "&pictureDate="
				+ mypageVO.getPictureVO().getPictureDate();
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("fileDownload.do")
	public ModelAndView fileDownload(HttpServletRequest request, String fileName) {
		HashMap<String, String> map = new HashMap<String, String>();
		String downloadPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		map.put("path", downloadPath);
		return new ModelAndView("downloadView", map);
	}

}
