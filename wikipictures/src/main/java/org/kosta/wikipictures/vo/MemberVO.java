package org.kosta.wikipictures.vo;

public class MemberVO {
	private String id;
	private String nickname;
	private String password;
	private String birth;
	private String favorateSpace;
	private int enabled;
	private AuthoritiesVO authoritiesVO;
	
	public MemberVO() {
		super();
	}

	public MemberVO(String id, String nickname, String password, String birth, String favorateSpace, int enabled,
			AuthoritiesVO authoritiesVO) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.birth = birth;
		this.favorateSpace = favorateSpace;
		this.enabled = enabled;
		this.authoritiesVO = authoritiesVO;
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

	public String getFavorateSpace() {
		return favorateSpace;
	}

	public void setFavorateSpace(String favorateSpace) {
		this.favorateSpace = favorateSpace;
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
		return "MemberVO [id=" + id + ", nickname=" + nickname + ", password=" + password + ", birth=" + birth
				+ ", favorateSpace=" + favorateSpace + ", enabled=" + enabled + ", authoritiesVO=" + authoritiesVO
				+ "]";
	}
	
	
	
}
