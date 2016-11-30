package org.kosta.wikipictures.dao;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource(name="sqlSessionTemplate")
private SqlSessionTemplate template;
	@Override
	public MemberVO login(MemberVO memberVO){
		return template.selectOne("member.login",memberVO);
	}
	@Override
	public int idcheck(String id){
		return template.selectOne("member.idcheck",id);
	}
	@Override
	public void registerMember(MemberVO vo) {
		template.insert("member.registerMember",vo);
	}
	@Override
	public MemberVO findMemberById(String id){
		return template.selectOne("member.findMemberById",id);
	}
}
