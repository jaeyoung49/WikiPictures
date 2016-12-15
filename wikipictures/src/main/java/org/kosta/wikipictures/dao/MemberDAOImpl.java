package org.kosta.wikipictures.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.AuthoritiesVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.MypageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public MemberVO login(MemberVO memberVO) {
		return template.selectOne("member.login", memberVO);
	}

	@Override
	public int idcheck(String id) {
		return template.selectOne("member.idcheck", id);
	}

	@Override
	public void registerMember(MemberVO vo) {
		template.insert("member.registerMember", vo);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return template.selectOne("member.findMemberById", id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		template.update("member.updateMember", vo);
	}

	@Override
	public void registerBuy(MypageVO mypageVO) {
		template.insert("member.registerBuy", mypageVO);
	}
	/**
	 * Security에서 인증시 사용
	 */
	@Override
	public List<AuthoritiesVO> selectAuthorityByUsername(String username) {
		return template.selectList("member.selectAuthorityByUsername", username);
	}
	/**
	 * Security를 위해 권한부여를 위해 사용
	 */
	@Override
	public void registerRole(AuthoritiesVO authoritiesVO) {
		template.insert("member.registerRole", authoritiesVO);
	}
	
	
	public MemberVO memberSearch(MemberVO memberVO){
		return template.selectOne("member.memberSearch",memberVO);
	}
	
	public void updatePassword(MemberVO memberVO){
		template.update("member.updatePassword",memberVO);
	}
}
