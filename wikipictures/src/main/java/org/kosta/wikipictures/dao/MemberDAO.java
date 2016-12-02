package org.kosta.wikipictures.dao;

import org.kosta.wikipictures.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO memberVO);
	public int idcheck(String id);
	void registerMember(MemberVO vo);
	public MemberVO findMemberById(String id);
	
	void updateMember(MemberVO vo);
	
	
}