package org.kosta.wikipictures.dao;

import java.util.List;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.PictureVO;

public interface PictureDAO {

	void registerHashtag(List<HashtagVO> hashtagList);

	void registerPicture(PictureVO pictureVO);

	public List<PictureVO> pictureList(PictureVO pvo);

}
