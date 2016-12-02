package org.kosta.wikipictures.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.wikipictures.dao.MemberDAO;
import org.kosta.wikipictures.vo.ListVO;
import org.kosta.wikipictures.vo.MemberVO;
import org.kosta.wikipictures.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.login(memberVO);
	}

	@Override
	public String idcheck(String id) {
		int count = memberDAO.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public void registerMember(MemberVO vo) {
		memberDAO.registerMember(vo);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}

	public ListVO<MemberVO> memberList() {
		return memberList("1");
	}

	@Override
	public ListVO<MemberVO> memberList(String pageNo) {
		int totalCount = memberDAO.memeberTotalCount();
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRowNumber", pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		return new ListVO<MemberVO>(memberDAO.memberList(paramMap), pagingBean);
	}

	@Override
	public int memeberTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

	

	
}
