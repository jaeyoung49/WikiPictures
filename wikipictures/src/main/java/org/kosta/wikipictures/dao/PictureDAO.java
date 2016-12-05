package org.kosta.wikipictures.dao;

import java.util.List;
import java.util.Map;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.TimeMachineVO;

public interface PictureDAO {

	void registerHashtag(List<HashtagVO> hashtagList);

	void registerPicture(PictureVO pictureVO);


	List<PictureVO> getPictures();

	List<PictureVO> searchPicture(String keyword);
	
	PictureVO picture(PictureVO pictureVO);
	
	List<HashtagVO> searchDetailPicture(HashtagVO hashtagVO);
	
	public List<PictureVO> pictureList(PictureVO pvo);
	
	List<PictureVO> showMypictureList(Map<String, Integer> pagingConfig);

	List<PictureVO> showMypictureList(String pageNo);

	int totalContentCount();

	List<MypageVO> showSecretreplyList(Map<String, Integer> pagingConfig);
	
	List<MypageVO> showSecretreplyList(String pageNo);

	int secretTotalContentCount();
	
	List<PictureVO> mypictures(String pageNo);
	
	void addHashtag(HashtagVO hashtagVO);

	List<TimeMachineVO> getTimeMachineList();

	List<PictureVO> getAccidentPictureList(String timeMachineYear);

	List<PictureVO> getPersonAndLocationPictureList(String timeMachineYear);

	


}
