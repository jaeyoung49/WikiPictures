package org.kosta.wikipictures.service;

import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;

public interface MemberService {

	MemberVO login(MemberVO memberVO);

	String idcheck(String id);

	void registerMember(MemberVO vo);

	public MemberVO findMemberById(String id);

	void updateMember(MemberVO memberVO);

	void registerBuy(MypageVO mypageVO);

}