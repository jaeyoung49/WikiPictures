package org.kosta.wikipictures.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Override
	public  List<HashMap<String,Object>> memberList(String pageNo){
		List<HashMap<String,Object>> list = template.selectList("admin.memberlist",pageNo);
		System.out.println(list);
		return list;
	}
	public int memeberTotalCount(){
		return template.selectOne("admin.memberTotalCount");
	}
	@Override
	public List<MemberVO> memberList(Map<String, Integer> pagingConfig) {
		return template.selectList("admin.memberlist", pagingConfig);
	}
	@Override
	public void updateMember(MemberVO vo) {
		template.update("member.updateMember",vo);
		
	}
	
}
