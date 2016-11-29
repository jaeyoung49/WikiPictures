package org.kosta.wikipictures.model;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource(name="sqlSessionTemplate")
private SqlSessionTemplate template;

	@Override
	public List<MemberVO> getMemberList(String memberId) {
		return template.selectList("board.memberList",memberId);
	}

}
