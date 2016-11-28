package org.kosta.wikipictures.vo;

public class PictureVO {
	private String pictureDate;
	private String keyword;
	private String path;
	private String authorComment;
	private int hits;
	private String pictureSpace;
	private MemberVO memberVO;

	public PictureVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PictureVO(String pictureDate, String keyword, String path, String authorComment, int hits,
			String pictureSpace, MemberVO memberVO) {
		super();
		this.pictureDate = pictureDate;
		this.keyword = keyword;
		this.path = path;
		this.authorComment = authorComment;
		this.hits = hits;
		this.pictureSpace = pictureSpace;
		this.memberVO = memberVO;
	}

	public String getPictureDate() {
		return pictureDate;
	}

	public void setPictureDate(String pictureDate) {
		this.pictureDate = pictureDate;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getAuthorComment() {
		return authorComment;
	}

	public void setAuthorComment(String authorComment) {
		this.authorComment = authorComment;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getPictureSpace() {
		return pictureSpace;
	}

	public void setPictureSpace(String pictureSpace) {
		this.pictureSpace = pictureSpace;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "PictureVO [pictureDate=" + pictureDate + ", keyword=" + keyword + ", path=" + path + ", authorComment="
				+ authorComment + ", hits=" + hits + ", pictureSpace=" + pictureSpace + ", memberVO=" + memberVO + "]";
	}

	
	
	
}
