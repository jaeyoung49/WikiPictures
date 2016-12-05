package org.kosta.wikipictures.service;

import java.util.List;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;

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
	

}