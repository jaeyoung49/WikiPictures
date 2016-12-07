package org.kosta.wikipictures.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.dao.PictureDAO;
import org.kosta.wikipictures.vo.HashtagVO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PagingBean;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;
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
	
	
	public void addHashtag(HashtagVO hashtagVO){
		pictureDAO.addHashtag(hashtagVO);
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
	
	@Override
	public ListVO<PictureVO> showMypictureList(String pageNo, MemberVO mvo) {
		int totalCount=pictureDAO.totalContentCount(mvo.getId());
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		HashMap<String,String> paramMap=new HashMap<String,String>();
		paramMap.put("id", mvo.getId());
		paramMap.put("startRowNumber",String.valueOf(pagingBean.getStartRowNumber()));
		paramMap.put("endRowNumber", String.valueOf(pagingBean.getEndRowNumber()));
		return new ListVO<PictureVO>(pictureDAO.showMypictureList(paramMap),pagingBean);
	}
	
	
	@Override
	public int totalContentCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ListVO<MypageVO> showSecretreplyList(String pageNo, MemberVO mvo) {
		int totalCount=pictureDAO.secretTotalContentCount(mvo.getId());
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		HashMap<String,String> paramMap=new HashMap<String,String>();
		paramMap.put("id", mvo.getId());
		paramMap.put("startRowNumber",String.valueOf(pagingBean.getStartRowNumber()));
		paramMap.put("endRowNumber", String.valueOf(pagingBean.getEndRowNumber()));
		return new ListVO<MypageVO>(pictureDAO.showSecretreplyList(paramMap),pagingBean);
	}


	@Override
	public int secretTotalContentCount() {
		return 0;
	}

	@Override
	public ListVO<MypageVO> showBuyList(String pageNo, MemberVO mvo) {
		int totalCount=pictureDAO.buyTotalContentCount(mvo.getId());
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		HashMap<String,String> paramMap=new HashMap<String,String>();
		paramMap.put("id", mvo.getId());
		paramMap.put("startRowNumber",String.valueOf(pagingBean.getStartRowNumber()));
		paramMap.put("endRowNumber", String.valueOf(pagingBean.getEndRowNumber()));
		return new ListVO<MypageVO>(pictureDAO.showBuyList(paramMap),pagingBean);
	}

	@Override
	public int buyTotalContentCount() {
		return 0;
	}

	@Override
	public void updateAuthorComment(PictureVO pictureVO) {
		pictureDAO.updateAuthorComment(pictureVO);
	}

	@Override
	public MypageVO getMypageVO(MypageVO mypageVO) {
		return pictureDAO.getMypageVO(mypageVO);
	}

	@Override
	public void registerSecretReply(MypageVO mypageVO) {
		pictureDAO.registerSecretReply(mypageVO);
	}

	@Override
	public PictureVO reportForm(PictureVO pictureVO) {
		return pictureDAO.reportForm(pictureVO);
	}

	@Override
	public int report(ReportVO rvo) {
		return pictureDAO.report(rvo);
	}
}
