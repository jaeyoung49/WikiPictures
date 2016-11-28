package org.kosta.wikipictures.vo;

public class HashtagVO {
	private PictureVO pictureVO;
	private String hashtagName;
	private int hashtagCount;
	
	public HashtagVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HashtagVO(PictureVO pictureVO, String hashtagName, int hashtagCount) {
		super();
		this.pictureVO = pictureVO;
		this.hashtagName = hashtagName;
		this.hashtagCount = hashtagCount;
	}

	public PictureVO getPictureVO() {
		return pictureVO;
	}

	public void setPictureVO(PictureVO pictureVO) {
		this.pictureVO = pictureVO;
	}

	public String getHashtagName() {
		return hashtagName;
	}

	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}

	public int getHashtagCount() {
		return hashtagCount;
	}

	public void setHashtagCount(int hashtagCount) {
		this.hashtagCount = hashtagCount;
	}

	@Override
	public String toString() {
		return "HashtagVO [pictureVO=" + pictureVO + ", hashtagName=" + hashtagName + ", hashtagCount=" + hashtagCount
				+ "]";
	}
	
	
}
