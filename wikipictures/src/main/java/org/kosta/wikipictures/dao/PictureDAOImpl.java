package org.kosta.wikipictures.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PictureDAOImpl implements PictureDAO {
	
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void registerHashtag(List<HashtagVO> hashtagList) {
		for(HashtagVO hvo : hashtagList)
			template.insert("picture.registerHashtag", hvo);
	}

	@Override
	public void registerPicture(PictureVO pictureVO) {
		template.insert("picture.registerPicture", pictureVO);
	}
	
	@Override
	public List<PictureVO> searchPicture(String keyword){
		return template.selectList("picture.searchPicture",keyword);
	}
	@Override
	public PictureVO picture(PictureVO pictureVO){
		return template.selectOne("picture.picture",pictureVO);
	}
	@Override
	public List<HashtagVO> searchDetailPicture(HashtagVO hashtagVO){
		return template.selectList("picture.searchDetailPicture",hashtagVO);
	}

}