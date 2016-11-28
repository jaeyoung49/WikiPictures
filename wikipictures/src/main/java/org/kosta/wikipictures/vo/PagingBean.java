package org.kosta.wikipictures.vo;

public class PagingBean {
	private int nowPage = 1;
	private int contentNumberPerPage = 5;
	private int pageNumberPerPageGroup = 4;
	private int totalContents;

	public PagingBean() {
	}

	public PagingBean(int totalContents) {
		this.totalContents = totalContents;
	}

	public PagingBean(int totalContents, int nowPage) {
		this.totalContents = totalContents;
		this.nowPage = nowPage;
	}

	public int getNowPage() {
		return nowPage;
	}

	public int getStartRowNumber() {
		return contentNumberPerPage*(nowPage-1) + 1;
	}

	public int getEndRowNumber() {
		int endRowNumber = contentNumberPerPage * nowPage;
		
		if(totalContents < endRowNumber)
			return totalContents;
		
		return endRowNumber;
	}

	public int getTotalPage() {
		int totalPage = totalContents / contentNumberPerPage;
		
		if(totalContents % contentNumberPerPage != 0)
			totalPage = totalPage + 1;
		
		return totalPage;
	}

	public int getTotalPageGroup() {
		int totalPageGroup = this.getTotalPage() / pageNumberPerPageGroup;
		
		if(this.getTotalPage()%pageNumberPerPageGroup!=0)
			totalPageGroup = totalPageGroup + 1;
			
		return totalPageGroup;
	}

	public int getNowPageGroup() {
		int nowPageGroup = nowPage / pageNumberPerPageGroup;
				
		if(nowPage % pageNumberPerPageGroup != 0 )
			nowPageGroup = nowPageGroup + 1;
		
		return nowPageGroup;
	}

	public int getStartPageOfPageGroup() {
		return (this.getNowPageGroup() - 1) * this.pageNumberPerPageGroup + 1;
	}

	public int getEndPageOfPageGroup() {
		int endPageOfPageGroup = this.getNowPageGroup() * this.pageNumberPerPageGroup;
		
		if(endPageOfPageGroup > this.getTotalPage())
			endPageOfPageGroup = this.getTotalPage();
		
		return endPageOfPageGroup;
	}

	public boolean isPreviousPageGroup() {
		boolean flag = false;
		
		if(this.getStartPageOfPageGroup()>this.pageNumberPerPageGroup)
			flag = true;
		
		return flag;
	}

	public boolean isNextPageGroup() {
		boolean flag = false;
		
		if(this.getTotalPage()>this.getEndPageOfPageGroup())
			flag = true;
			
		return flag;
	}

	public static void main(String args[]) {
		PagingBean p = new PagingBean(0, 1);
		// 현페이지의 시작 row number 를 조회 46
		System.out.println("getBeginRowNumber:" + p.getStartRowNumber());
		// 현페이지의 마지막 row number 를 조회 47
		System.out.println("getEndRowNumber:" + p.getEndRowNumber());
		// 전체 페이지 수 : 10
		System.out.println("getTotalPage:" + p.getTotalPage());
		// 전체 페이지 그룹 수 : 3
		System.out.println("getTotalPageGroup:" + p.getTotalPageGroup());
		System.out.println("////////////////////////////");
//		p = new PagingBean(40, 6);// 게시물수 31 현재 페이지 6
		// 현페이지의 시작 row number 를 조회 26
		System.out.println("getStartRowNumber:" + p.getStartRowNumber());
		// 현페이지의 마지막 row number 를 조회 30
		System.out.println("getEndRowNumber:" + p.getEndRowNumber());
		// 게시물수 31 -> 총페이지수 7 -> 총페이지그룹->2
		// 현재 페이지 그룹 : 2
		System.out.println("getNowPageGroup:" + p.getNowPageGroup());
		// 페이지 그룹의 시작 페이지 : 5
		System.out.println("getStartPageOfPageGroup:" + p.getStartPageOfPageGroup());
		// 페이지 그룹의 마지막 페이지 : 7
		System.out.println("getEndPageOfPageGroup:" + p.getEndPageOfPageGroup());
		// 이전 페이지 그룹이 있는 지 : true
		System.out.println("isPreviousPageGroup:" + p.isPreviousPageGroup());
		// 다음 페이지 그룹이 있는 지 : false
		System.out.println("isNextPageGroup:" + p.isNextPageGroup());

	}

}
