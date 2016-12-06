
package org.kosta.wikipictures.service;

import javax.annotation.Resource;

import org.kosta.wikipictures.dao.ReportDAO;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService{
	@Resource
	private ReportDAO reportDAO;

}


