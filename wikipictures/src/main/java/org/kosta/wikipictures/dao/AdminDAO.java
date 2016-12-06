package org.kosta.wikipictures.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;

public interface AdminDAO {
	public int memeberTotalCount();
	public  List<HashMap<String,Object>> memberList(String pageNo);
	public List<MemberVO> memberList(Map<String, Integer> pagingConfig);
	public int totalContentCount();
	public List<PictureVO> mypictures(Map<String, Integer> pagingConfig);
	public List<PictureVO> mypictures(String pageNo);
	public int reportTotalCount();
	public List<ReportVO> reportList(Map<String, Integer> pagingConfig);
	public List<PictureVO> reportList(String pageNo);
	public int sellTotalCount();
	public List<MypageVO> sellList(Map<String, Integer> pagingConfig);
	public List<MypageVO> sellList(String pageNo);
}