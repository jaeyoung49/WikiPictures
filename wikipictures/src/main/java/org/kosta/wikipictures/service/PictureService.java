package org.kosta.wikipictures.service;

import java.util.List;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;
import org.kosta.wikipictures.vo.TimeMachineVO;

public interface PictureService {
	void registerHashtag(List<HashtagVO> hashtagList);
	
	void registerPicture(PictureVO pictureVO);

	List<PictureVO> searchPicture(String keyword);
	
	List<PictureVO> searchHashtag(String keyword);
	
	PictureVO picture(PictureVO pictureVO);
	
	List<HashtagVO> searchDetailPicture(HashtagVO hashtagVO);

	void addHashtag(HashtagVO hashtagVO);
	
	List<TimeMachineVO> getTimeMachineList();
	
	List<PictureVO> getAccidentPictureList(String timeMachineYear);
	
	List<PictureVO> getPersonAndLocationPictureList(String timeMachineYear);
	
	ListVO<PictureVO> showMypictureList(String pageNo, MemberVO mvo);
	public int totalContentCount();
	
	ListVO<MypageVO> showSecretreplyList(String pageNo, MemberVO mvo);
	public int secretTotalContentCount();
	
	ListVO<MypageVO> showBuyList(String pageNo, MemberVO mvo);
	public int buyTotalContentCount();

	void updateAuthorComment(PictureVO pictureVO);

	MypageVO getMypageVO(MypageVO mypageVO);

	void registerSecretReply(MypageVO mypageVO);
	
	PictureVO reportForm(PictureVO pictureVO);
	public int report(ReportVO rvo);
}