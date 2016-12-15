package org.kosta.wikipictures.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.dao.MemberDAO;
import org.kosta.wikipictures.vo.AuthoritiesVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	/**
	 * 비밀번호 암호화를 위한 객체를 주입
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder; 

	@Override
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.login(memberVO);
	}

	@Override
	public String idcheck(String id) {
		int count = memberDAO.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}
	
	@Transactional
	@Override
	public void registerMember(MemberVO vo) {
		// 비밀번호를 bcrypt 알고리듬으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPwd);
		memberDAO.registerMember(vo);
		// 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다.
		AuthoritiesVO authoritiesVO = new AuthoritiesVO(vo, "ROLE_MEMBER");
		memberDAO.registerRole(authoritiesVO);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

	@Override
	public void registerBuy(MypageVO mypageVO) {
		memberDAO.registerBuy(mypageVO);
	}

	@Override
	public List<AuthoritiesVO> selectAuthorityByUsername(String username) {
		return memberDAO.selectAuthorityByUsername(username);
	}
	

	public MemberVO memberSearch(MemberVO memberVO){
		return memberDAO.memberSearch(memberVO);
	}

	public void updatePassword(MemberVO memberVO){
		memberDAO.updatePassword(memberVO);
	}

}
