<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/member/update_member_form.do">회원정보수정</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/showMypictureList.do">내가올린사진들보기</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/showSecretreplyList.do">시크릿댓글목록보기</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/showBuyList.do">구매내역보기</a></li>
</ul>
<div class="container">
<form method="post" action="${pageContext.request.contextPath}/updateMember.do" class="form-horizontal">
  <div class="form-group">
    <label for="id">아이디</label>
    <input class="form-control" type="text" name="id" value="${sessionScope.mvo.id}" disabled>
  </div>
  <div class="form-group">
    <label for="password">비밀번호</label>
    <input class="form-control" type="text" name="password" value="${sessionScope.mvo.password}" required>
  </div>
  <div class="form-group">
    <label for="exampleInputFile">닉네임</label>
	<input class="form-control" type="text" name="nickname" value="${sessionScope.mvo.nickname}"required>
  </div>
  <div class="form-group">
    <label for="birth">생년월일</label>
	<input class="form-control" type="text" name="birth" value="${sessionScope.mvo.birth}" disabled>
  </div>
  <div class="form-group">
    <label for="birth">선호지역</label>
	<input class="form-control" type="text" name="favoriteSpace" value="${sessionScope.mvo.favoriteSpace}"required>
  </div>
  <input class="btn btn-default btn-lg btn-block" type="submit" value="회원정보수정">
</form>
</div>
