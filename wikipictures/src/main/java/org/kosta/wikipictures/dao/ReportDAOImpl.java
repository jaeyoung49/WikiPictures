package org.kosta.wikipictures.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.vo.ReportVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAOImpl implements ReportDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	@Override
	public List<ReportVO> reportList(ReportVO rvo){
		List<ReportVO> list = template.selectList("admin.reportlist",rvo);
		System.out.println("try : "+list);
		return list;
		
	}
}
