package org.kosta.wikipictures.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.TimeMachineVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PictureDAOImpl implements PictureDAO {

	@Resource
	private SqlSessionTemplate template;

	@Override
	public void registerHashtag(List<HashtagVO> hashtagList) {
		for (HashtagVO hvo : hashtagList)
			template.insert("picture.registerHashtag", hvo);
	}

	@Override
	public void registerPicture(PictureVO pictureVO) {
		template.insert("picture.registerPicture", pictureVO);
	}


	@Override
	public List<PictureVO> getPictures() {
		return template.selectList("picture.getPictures");
	}
		
	@Override
	public List<PictureVO> pictureList(PictureVO pvo){
		return template.selectList("admin.picturelist",pvo);
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
	
	public void addHashtag(HashtagVO hashtagVO){
		template.insert("picture.addHashtag",hashtagVO);
	}
	@Override
	public List<PictureVO> showMypictureList(Map<String, Integer> pagingConfig) {
		return template.selectList("picture.showMypictureList", pagingConfig);
	}
	
	@Override
	public List<PictureVO> showMypictureList(String pageNo) { 
		return template.selectList("picture.showMypictureList",pageNo); 
	}
	
	@Override
	public int totalContentCount() {
		// TODO Auto-generated method stub
		return template.selectOne("picture.totalContentCount");
	}
	
	@Override
	public List<MypageVO> showSecretreplyList(Map<String, Integer> pagingConfig) {
		return template.selectList("picture.showSecretreplyList", pagingConfig);
	}

	@Override
	public List<MypageVO> showSecretreplyList(String pageNo) {
		return template.selectList("picture.showSecretreplyList", pageNo);
	}
	
	@Override
	public int secretTotalContentCount() {
		// TODO Auto-generated method stub
		return template.selectOne("picture.secretTotalContentCount");
	}

	@Override
	public List<PictureVO> mypictures(String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TimeMachineVO> getTimeMachineList() {
		return template.selectList("picture.getTimeMachineList");
	}

	@Override
	public List<PictureVO> getAccidentPictureList(String timeMachineYear) {
		return template.selectList("picture.getAccidentPictureList", timeMachineYear);
	}

	@Override
	public List<PictureVO> getPersonAndLocationPictureList(String timeMachineYear) {
		return template.selectList("picture.getPersonAndLocationPictureList", timeMachineYear);
	}



}