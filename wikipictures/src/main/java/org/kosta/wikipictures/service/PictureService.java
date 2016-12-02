package org.kosta.wikipictures.service;

import java.util.List;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.PictureVO;

public interface PictureService {

	void registerHashtag(List<HashtagVO> hashtagList);

	void registerPicture(PictureVO pictureVO);

	List<PictureVO> searchPicture(String keyword);
	
	PictureVO picture(PictureVO pictureVO);
	
	List<HashtagVO> searchDetailPicture(HashtagVO hashtagVO);
}