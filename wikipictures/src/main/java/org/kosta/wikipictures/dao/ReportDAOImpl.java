
package org.kosta.wikipictures.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAOImpl implements ReportDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
}

