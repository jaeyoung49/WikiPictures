package org.kosta.wikipictures.service;

import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;

public interface AdminService {
	public  ListVO<MemberVO> memberList(String pageNo);
	public  ListVO<MemberVO> memberList();
	public int memeberTotalCount();
	public ListVO<PictureVO> mypictures(String pageNo);
	public ListVO<PictureVO> mypictures();
	public int totalContentCount();
	public ListVO<ReportVO> reportList(String pageNo);
	public ListVO<ReportVO> reportList();
	public int reportTotalCount();
}