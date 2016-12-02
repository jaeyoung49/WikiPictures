package org.kosta.wikipictures.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kosta.wikipictures.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO memberVO);
	public int idcheck(String id);
	void registerMember(MemberVO vo);
	public MemberVO findMemberById(String id);
	public int memeberTotalCount();
	public  List<HashMap<String,Object>> memberList(String pageNo);
	public List<MemberVO> memberList(Map<String, Integer> pagingConfig);
	void updateMember(MemberVO vo);
	
	
}