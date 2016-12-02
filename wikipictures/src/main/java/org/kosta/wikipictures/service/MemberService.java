package org.kosta.wikipictures.service;

import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO memberVO);
	String idcheck(String id);
	void registerMember(MemberVO vo);
	public MemberVO findMemberById(String id);
	public  ListVO<MemberVO> memberList(String pageNo);
	public  ListVO<MemberVO> memberList();
	public int memeberTotalCount();
}