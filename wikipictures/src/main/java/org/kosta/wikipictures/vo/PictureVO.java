package org.kosta.wikipictures.vo;

import org.springframework.web.multipart.MultipartFile;

public class PictureVO {
	private String pictureDate;
	private String keyword;
	private String path;
	private String authorComment;
	private int hits;
	private String pictureSpace;
	private String category;
	private MemberVO memberVO;
	private MultipartFile uploadFile;

	public PictureVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public PictureVO(String pictureDate, String keyword, String path, String authorComment, int hits,
			String pictureSpace, String category, MemberVO memberVO, MultipartFile uploadFile) {
		super();
		this.pictureDate = pictureDate;
		this.keyword = keyword;
		this.path = path;
		this.authorComment = authorComment;
		this.hits = hits;
		this.pictureSpace = pictureSpace;
		this.category = category;
		this.memberVO = memberVO;
		this.uploadFile = uploadFile;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "PictureVO [pictureDate=" + pictureDate + ", keyword=" + keyword + ", path=" + path + ", authorComment="
				+ authorComment + ", hits=" + hits + ", pictureSpace=" + pictureSpace + ", category=" + category
				+ ", memberVO=" + memberVO + ", uploadFile=" + uploadFile + "]";
	}

}
