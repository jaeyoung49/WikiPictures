package org.kosta.wikipictures.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.wikipictures.dao.AdminDAO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PagingBean;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDAO adminDAO;

	@Override
	public ListVO<MemberVO> memberList(String pageNo) {
		int totalCount = adminDAO.memeberTotalCount();
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRowNumber", pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		
		return new ListVO<MemberVO>(adminDAO.memberList(paramMap), pagingBean);
	}

	@Override
	public ListVO<MemberVO> memberList() {
		return memberList("1");
	}

	@Override
	public int memeberTotalCount() {
		return 0;
	}

	public ListVO<PictureVO> mypictures(String pageNo) {
		int totalCount = adminDAO.totalContentCount();
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRowNumber", pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		return new ListVO<PictureVO>(adminDAO.mypictures(paramMap), pagingBean);
	}

	@Override
	public ListVO<PictureVO> mypictures() {
		return mypictures("1");
	}

	@Override
	public int totalContentCount() {
		return 0;
	}

	@Override
	public ListVO<ReportVO> reportList(String pageNo) {
		int totalCount = adminDAO.reportTotalCount();
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRowNumber", pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		return new ListVO<ReportVO>(adminDAO.reportList(paramMap), pagingBean);
	}

	@Override
	public ListVO<ReportVO> reportList() {
		return reportList("1");
	}

	@Override
	public int reportTotalCount() {
		return 0;
	}

	@Override
	public int sellTotalCount() {
		return 0;
	}

	@Override
	public ListVO<MypageVO> sellList() {
		return sellList("1");
	}

	@Override
	public ListVO<MypageVO> sellList(String pageNo) {
		int totalCount = adminDAO.sellTotalCount();
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRowNumber", pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		
		return new ListVO<MypageVO>(adminDAO.sellList(paramMap), pagingBean);
	}
}
