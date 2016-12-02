package org.kosta.wikipictures.dao;

import java.util.List;
import java.util.Map;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.PictureVO;

public interface PictureDAO {

	void registerHashtag(List<HashtagVO> hashtagList);

	void registerPicture(PictureVO pictureVO);

	int totalContentCount();

	List<PictureVO> mypictures(Map<String, Integer> pagingConfig);

	List<PictureVO> mypictures(String pageNo);

}
