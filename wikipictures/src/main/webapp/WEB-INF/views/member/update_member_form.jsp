<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/member/update_member_form.do">회원정보수정</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/showMypictureList.do">내가올린사진들보기</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/showSecretreplyList.do">시크릿댓글목록보기</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/showBuyList.do">구매내역보기</a></li>
</ul>
<h3>회원정보수정</h3>
		<form method="post" action="${pageContext.request.contextPath}/updateMember.do"> 
		아이디 : <input type="text" name="id" value="${sessionScope.mvo.id}" readonly>
		<br>패스워드 : <input type="text" name="password"  	value="${sessionScope.mvo.password}" >		
		<br>닉네임 : <input type="text" name="nickname" 	value="${sessionScope.mvo.nickname}" >	
		<br> 생년월일: <input type="text" name="birth" value="${sessionScope.mvo.birth}" readonly>
		<br>선호지역 : <input type="text" name="favoriteSpace" 	value="${sessionScope.mvo.favoriteSpace}" >	
		<br><input type="submit" value="회원정보수정">
		</form>
