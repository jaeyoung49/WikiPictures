package org.kosta.wikipictures.service;

import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;

public interface AdminService {
	public int memeberTotalCount();
	public  ListVO<MemberVO> memberList(String pageNo);
	public  ListVO<MemberVO> memberList();
	public int totalContentCount();
	public ListVO<PictureVO> mypictures(String pageNo);
	public ListVO<PictureVO> mypictures();
	public int reportTotalCount();
	public ListVO<ReportVO> reportList(String pageNo);
	public ListVO<ReportVO> reportList();
	public int sellTotalCount();
	public ListVO<MypageVO> sellList();
	public ListVO<MypageVO> sellList(String pageNo);
}