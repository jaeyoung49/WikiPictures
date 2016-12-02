package org.kosta.wikipictures.dao;

import java.util.List;
import java.util.Map;

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
	public int totalContentCount() {
		// TODO Auto-generated method stub
		return template.selectOne("picture.totalContentCount");
	}

	@Override
	public List<PictureVO> mypictures(Map<String, Integer> pagingConfig) {
		// TODO Auto-generated method stub
		return template.selectList("picture.mypictures", pagingConfig);
	}

	@Override
	public List<PictureVO> mypictures(String pageNo) {
		return template.selectList("picture.mypictures",pageNo);
	}

	
	

}