package org.kosta.wikipictures.dao;

import java.util.List;
import java.util.Map;

import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.kosta.wikipictures.vo.PictureVO;

public interface MemberDAO {

	MemberVO login(MemberVO memberVO);
	public int idcheck(String id);
	void registerMember(MemberVO vo);
	public MemberVO findMemberById(String id);

	void updateMember(MemberVO vo);
	
	
	
	
}