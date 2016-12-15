package org.kosta.wikipictures.dao;

import java.util.List;

import org.kosta.wikipictures.vo.AuthoritiesVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;

public interface MemberDAO {

	MemberVO login(MemberVO memberVO);

	public int idcheck(String id);

	void registerMember(MemberVO vo);

	public MemberVO findMemberById(String id);

	void updateMember(MemberVO vo);

	void registerBuy(MypageVO mypageVO);

	List<AuthoritiesVO> selectAuthorityByUsername(String username);

	void registerRole(AuthoritiesVO authoritiesVO);

	MemberVO memberSearch(MemberVO memberVO);
	
	void updatePassword(MemberVO memberVO);
}