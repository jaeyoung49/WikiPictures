package org.kosta.wikipictures.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.wikipictures.dao.ReportDAO;
import org.kosta.wikipictures.vo.ReportVO;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService{
	@Resource
	private ReportDAO reportDAO;

	public List<ReportVO> reportList(ReportVO rvo) {
		return reportDAO.reportList(rvo);
	}
}
