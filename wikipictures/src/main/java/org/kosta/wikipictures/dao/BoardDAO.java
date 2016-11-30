package org.kosta.wikipictures.dao;

import java.util.List;

import org.kosta.wikipictures.vo.MemberVO;

public interface BoardDAO {
	
	public List<MemberVO> getMemberList(String memberId);
}