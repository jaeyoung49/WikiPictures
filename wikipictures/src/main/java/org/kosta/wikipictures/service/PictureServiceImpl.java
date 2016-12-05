package org.kosta.wikipictures.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.dao.PictureDAO;
import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PagingBean;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.TimeMachineVO;
import org.springframework.stereotype.Service;

@Service
public class PictureServiceImpl implements PictureService {
	
	@Resource
	private PictureDAO pictureDAO;

	@Override
	public void registerHashtag(List<HashtagVO> hashtagList) {
		pictureDAO.registerHashtag(hashtagList);
	}

	@Override
	public void registerPicture(PictureVO pictureVO) {
		pictureDAO.registerPicture(pictureVO);
	}

	
	@Override
	public List<PictureVO> searchPicture(String keyword){
		return pictureDAO.searchPicture(keyword);
	}
	@Override
	public PictureVO picture(PictureVO pictureVO){
		return pictureDAO.picture(pictureVO);
	}
	@Override
	public List<HashtagVO> searchDetailPicture(HashtagVO hashtagVO){
		return pictureDAO.searchDetailPicture(hashtagVO);
	}
	
	@Override
	public List<PictureVO> pictureList(PictureVO pvo) {
		return pictureDAO.pictureList(pvo);
	}
	
	
	@Override
	public ListVO<PictureVO> showMypictureList(String pageNo) {
		int totalCount=pictureDAO.totalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
			HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
			paramMap.put("startRowNumber",pagingBean.getStartRowNumber());
			paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		return new ListVO<PictureVO>(pictureDAO.showMypictureList(paramMap),pagingBean) ;
	}

	@Override
	public ListVO<PictureVO> showMypictureList() {
		// TODO Auto-generated method stub
		return showMypictureList("1");
	}

	@Override
	public int totalContentCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public void addHashtag(HashtagVO hashtagVO){
		pictureDAO.addHashtag(hashtagVO);
	}
	@Override
	public ListVO<MypageVO> showSecretreplyList(String pageNo) {
		int totalCount=pictureDAO.secretTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		paramMap.put("startRowNumber", pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		return new ListVO<MypageVO>(pictureDAO.showSecretreplyList(paramMap),pagingBean);
	}
	
	@Override
	public ListVO<MypageVO> showSecretreplyList() {
		// TODO Auto-generated method stub
		return showSecretreplyList("1");
	}
	
	@Override
	public int secretTotalContentCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TimeMachineVO> getTimeMachineList() {
		return pictureDAO.getTimeMachineList();
	}

	@Override
	public List<PictureVO> getAccidentPictureList(String timeMachineYear) {
		return pictureDAO.getAccidentPictureList(timeMachineYear);
	}

	@Override
	public List<PictureVO> getPersonAndLocationPictureList(String timeMachineYear) {
		return pictureDAO.getPersonAndLocationPictureList(timeMachineYear);
	}


	

}
