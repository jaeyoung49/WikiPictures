package org.kosta.wikipictures.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.wikipictures.dao.PictureDAO;
import org.kosta.wikipictures.service.PictureService;
import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.TimeMachineVO;
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
	
	
	//업로드 경로
	private String uploadPath;

	
	// 메인화면
	@RequestMapping("home.do")
	public ModelAndView home(String timeMachineYear){
		ModelAndView mv = new ModelAndView();
		TimeMachineVO timeMachineVO = null;
		
		// 타임머신 목록 리스트
		List<TimeMachineVO> timeMachineYearList = pictureService.getTimeMachineList();
		
		// 타임머신 해당연도
		if(timeMachineYear == null){
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
			timeMachineYear = sdf.format(new Date());
		}
		// 해당연도의 타임머신 객체 뽑기
		for(TimeMachineVO tvo : timeMachineYearList){
			if(tvo.getTimeMachineYear() == Integer.parseInt(timeMachineYear)){
				timeMachineVO = tvo;
				break;
			}
		}
		
		// 사건, 인물장소 사진 리스트
		List<PictureVO> accidentPictureList = pictureService.getAccidentPictureList(timeMachineYear);
		List<PictureVO> personAndLocationPictureList = pictureService.getPersonAndLocationPictureList(timeMachineYear);
		
		// ModelAndView에 Parameter값 설정
		mv.addObject("timeMachineYearList", timeMachineYearList);	// 타임머신 연도 리스트
		mv.addObject("timeMachineVO", timeMachineVO);	// 타임머신 객체
		mv.addObject("accidentPictureList", accidentPictureList);	// 사건 사진리스트
		mv.addObject("personAndLocationPictureList", personAndLocationPictureList);	// 사건 사진리스트
		mv.setViewName("home");	// viewName 설정
		
		for(PictureVO pvo : accidentPictureList)
			System.out.println(pvo.getPath());
		System.out.println("------------------------");
		for(PictureVO pvo : personAndLocationPictureList)
			System.out.println(pvo.getPath());
		return mv;
	}
	
	// 사진 전체 나오는지 테스트
	@RequestMapping("test2.do")
	public ModelAndView test2(){
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
	@RequestMapping(method = RequestMethod.POST, value = "registerPicture.do")
	public ModelAndView registerPicture(PictureVO pictureVO, String tempHashtags, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		// 사진 정보 세팅 - 날짜
		pictureVO.setPictureDate(pictureVO.getPictureDate().trim().substring(0, 7));

		// 해시태그 세팅 - 태그 정렬
		String[] tags = tempHashtags.substring(1).split("#");
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
		List<HashtagVO> hashtagList = new ArrayList<HashtagVO>();
		for (String str : hashtagName) {
			HashtagVO hvo = new HashtagVO();
			hvo.setHashtagName(str);
			hvo.setPictureVO(pictureVO);
			hashtagList.add(hvo);
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
		
		// 차후 아이디 받아오는 것이 구현되면 삭제할것!!
		pictureVO.getMemberVO().setId("java");
		// 사진정보를 서버에 저장
		pictureService.registerPicture(pictureVO);
		// 해시태그를 서버에 저장
		pictureService.registerHashtag(hashtagList);

		return mv;
	}

	// 사진검색
	@RequestMapping("searchPicture.do")
	public ModelAndView searchPicture(HttpServletRequest request, PictureVO pictureVO) {
		String kw = request.getParameter("keyword");
		List<PictureVO> searchPicture = pictureService.searchPicture(kw);
		if (searchPicture.isEmpty()) {
			return new ModelAndView("picture/search_picture_fail");
		} else {
			return new ModelAndView("picture/search_picture_ok", "searchPicture", searchPicture);
		}
	}
	//사진 상세 보기
	@RequestMapping("searchDetailPicture.do")
	public ModelAndView searchDetailPicture(HttpServletRequest request, HashtagVO hashtagVO, PictureVO pictureVO){
		PictureVO picturevo = pictureService.picture(pictureVO);
		hashtagVO.setPictureVO(picturevo);
		List<HashtagVO> pvo = pictureService.searchDetailPicture(hashtagVO);
		request.setAttribute("picturevo", picturevo);
		return new ModelAndView("picture/show_picture_detail","pvo",pvo);
	}
	
	@RequestMapping("addHashtag.do")
	public ModelAndView addHashtag(HttpServletRequest request, HashtagVO hashtagVO, PictureVO pictureVO){
		String hashtagName = request.getParameter("tempHashtags");
		
		System.out.println(hashtagName);
		/*pictureService.addHashtag(hashtagName);*/
		return new ModelAndView("picture/show_picture_detail");
	}
}
