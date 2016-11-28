package org.kosta.wikipictures.vo;

public class AuthoritiesVO {
	private MemberVO memberVO;
	private String authority;
	
	public AuthoritiesVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuthoritiesVO(MemberVO memberVO, String authority) {
		super();
		this.memberVO = memberVO;
		this.authority = authority;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "AuthoritiesVO [memberVO=" + memberVO + ", authority=" + authority + "]";
	}
	
	
	
}
