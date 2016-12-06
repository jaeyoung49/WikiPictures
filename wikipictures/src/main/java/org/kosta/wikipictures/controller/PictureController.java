package org.kosta.wikipictures.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.wikipictures.dao.PictureDAO;
import org.kosta.wikipictures.service.PictureService;
import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView home(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("home");
		
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
	public ModelAndView addHashtag(HashtagVO hashtagVO, PictureVO pictureVO) throws UnsupportedEncodingException{
		String hash = hashtagVO.getHashtagName().trim();
		hash =hash.replaceAll("\\p{Z}", "");
		hash=hash.replaceAll("\\p{Space}", "");
		/*System.out.println("1"+hash);*/
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
			str=str.replaceAll("\\p{Space}", "");
			HashtagVO hvo = new HashtagVO();
			hvo.setHashtagName(str);
			hvo.setPictureVO(pictureVO);
			hashtagList.add(hvo);
		}
		pictureService.registerHashtag(hashtagList);
		// 해시태그 세팅 - 태그 정렬
		String keyword = URLEncoder.encode(pictureVO.getKeyword(),"UTF-8");
		return new ModelAndView("redirect:searchDetailPicture.do?keyword="+keyword+"&pictureDate="+pictureVO.getPictureDate());
	}
}
