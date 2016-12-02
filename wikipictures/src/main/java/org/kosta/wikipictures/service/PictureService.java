package org.kosta.wikipictures.service;

import java.util.List;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.PictureVO;

public interface PictureService {

	void registerHashtag(List<HashtagVO> hashtagList);

	void registerPicture(PictureVO pictureVO);

	public List<PictureVO> pictureList(PictureVO pvo);
	ListVO<PictureVO> mypictures(String pageNo);
	ListVO<PictureVO> mypictures();
	public int totalContentCount();
	


}