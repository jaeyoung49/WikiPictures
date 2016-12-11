package org.kosta.wikipictures.vo;

public class MemberVO {
	private int rowNumber;
	private String id;
	private String nickname;
	private String password;
	private String birth;
	private String favoriteSpace;
	private int enabled;
	private AuthoritiesVO authoritiesVO;
	

	public MemberVO() {
		super();
	}
	public MemberVO(int rowNumber, String id, String nickname, String password, String birth, String favoriteSpace,
			int enabled, AuthoritiesVO authoritiesVO) {
		super();
		this.rowNumber = rowNumber;
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.birth = birth;
		this.favoriteSpace = favoriteSpace;
		this.enabled = enabled;
		this.authoritiesVO = authoritiesVO;
	}
	public int getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getFavoriteSpace() {
		return favoriteSpace;
	}
	public void setFavoriteSpace(String favoriteSpace) {
		this.favoriteSpace = favoriteSpace;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public AuthoritiesVO getAuthoritiesVO() {
		return authoritiesVO;
	}
	public void setAuthoritiesVO(AuthoritiesVO authoritiesVO) {
		this.authoritiesVO = authoritiesVO;
	}
	@Override
	public String toString() {
		return "MemberVO [rowNumber=" + rowNumber + ", id=" + id + ", nickname=" + nickname + ", password=" + password
				+ ", birth=" + birth + ", favoriteSpace=" + favoriteSpace + ", enabled=" + enabled + ", authoritiesVO="
				+ authoritiesVO + "]";
	}
	
}
