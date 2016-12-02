package org.kosta.wikipictures.dao;

import java.util.List;
import java.util.Map;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.PictureVO;

public interface PictureDAO {

	void registerHashtag(List<HashtagVO> hashtagList);

	void registerPicture(PictureVO pictureVO);

	List<PictureVO> getPictures();

	List<PictureVO> searchPicture(String keyword);
	
	PictureVO picture(PictureVO pictureVO);
	
	List<HashtagVO> searchDetailPicture(HashtagVO hashtagVO);
	
	public List<PictureVO> pictureList(PictureVO pvo);
	
	int totalContentCount();
	
	List<PictureVO> mypictures(Map<String, Integer> pagingConfig);
	
	List<PictureVO> mypictures(String pageNo);

}
