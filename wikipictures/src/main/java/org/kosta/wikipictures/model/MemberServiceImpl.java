package org.kosta.wikipictures.model;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.login(memberVO);
	}

	@Override
	public String idcheck(String id) {
		int count=memberDAO.idcheck(id);
		return (count==0) ? "ok":"fail";
	}

	@Override
	public void registerMember(MemberVO vo) {
		memberDAO.registerMember(vo);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}
}
