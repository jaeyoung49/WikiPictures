package org.kosta.wikipictures.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.PictureVO;
import org.kosta.wikipictures.vo.ReportVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource(name="sqlSessionTemplate")
private SqlSessionTemplate template;

	@Override
	public int memeberTotalCount() {
		return template.selectOne("admin.memberTotalCount");
	}

	@Override
	public List<HashMap<String, Object>> memberList(String pageNo) {
		List<HashMap<String,Object>> list = template.selectList("admin.memberlist",pageNo);
		return list;
	}

	@Override
	public List<MemberVO> memberList(Map<String, Integer> pagingConfig) {
		return template.selectList("admin.memberlist", pagingConfig);
	}

	@Override
	public int totalContentCount() {
		return template.selectOne("picture.totalContentCount");
	}

	@Override
	public List<PictureVO> mypictures(Map<String, Integer> pagingConfig) {
		return template.selectList("admin.picturelist", pagingConfig);
	}

	@Override
	public List<PictureVO> mypictures(String pageNo) {
		return template.selectList("admin.picturelist",pageNo);
	}

	@Override
	public int reportTotalCount() {
		return template.selectOne("admin.reportTotalCount");
	}

	@Override
	public List<ReportVO> reportList(Map<String, Integer> pagingConfig) {
		return template.selectList("admin.reportlist", pagingConfig);
	}

	@Override
	public List<PictureVO> reportList(String pageNo) {
		return template.selectList("admin.reportlist", pageNo);
	}
	
}
