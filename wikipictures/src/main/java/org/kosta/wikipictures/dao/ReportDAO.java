package org.kosta.wikipictures.dao;

import java.util.List;

import org.kosta.wikipictures.vo.ReportVO;

public interface ReportDAO {

	public List<ReportVO> reportList(ReportVO rvo);

}