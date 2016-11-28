package org.kosta.wikipictures.vo;

public class MypageVO {
	private MemberVO memberVO;
	private PictureVO pictureVO;
	private String replyDate;
	private String replyContent;
	private String buyDate;
	
	public MypageVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MypageVO(MemberVO memberVO, PictureVO pictureVO, String replyDate, String replyContent, String buyDate) {
		super();
		this.memberVO = memberVO;
		this.pictureVO = pictureVO;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.buyDate = buyDate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public PictureVO getPictureVO() {
		return pictureVO;
	}

	public void setPictureVO(PictureVO pictureVO) {
		this.pictureVO = pictureVO;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	@Override
	public String toString() {
		return "MypageVO [memberVO=" + memberVO + ", pictureVO=" + pictureVO + ", replyDate=" + replyDate
				+ ", replyContent=" + replyContent + ", buyDate=" + buyDate + "]";
	}
	
	
}
