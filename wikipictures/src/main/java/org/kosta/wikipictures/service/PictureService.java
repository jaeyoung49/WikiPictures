package org.kosta.wikipictures.service;

import java.util.ArrayList;
import java.util.List;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.TimeMachineVO;

public interface PictureService {
	void registerHashtag(List<HashtagVO> hashtagList);
	void registerPicture(PictureVO pictureVO);


	List<PictureVO> searchPicture(String keyword);
	
	PictureVO picture(PictureVO pictureVO);
	
	List<HashtagVO> searchDetailPicture(HashtagVO hashtagVO);

	public List<PictureVO> pictureList(PictureVO pvo);
	
	
	ListVO<PictureVO> showMypictureList(String pageNo);
	
	ListVO<PictureVO> showMypictureList();
	
	public int totalContentCount();

	ListVO<MypageVO> showSecretreplyList(String pageNo);
	
	ListVO<MypageVO> showSecretreplyList();
	
	public int secretTotalContentCount();
	
	void addHashtag(HashtagVO hashtagVO);
	
	List<TimeMachineVO> getTimeMachineList();
	List<PictureVO> getAccidentPictureList(String timeMachineYear);
	List<PictureVO> getPersonAndLocationPictureList(String timeMachineYear);
	
	

}