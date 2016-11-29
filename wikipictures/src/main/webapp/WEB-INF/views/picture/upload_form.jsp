<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form id="registerForm" action="${pageContext.request.contextPath}/registerPicture.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="memberVO.id" value="${sessionScope.memberVO.id }">
사진 이미지<input type="file" name="uploadFile"><br>
키워드<input type="text" name="keyword"><br>
날짜<input type="date" name="pictureDate"><br>
원작자코멘트<textarea name="authorComment"></textarea><br>
장소<input type="text" name="pictureSpace"><br>
해시태그<input type="text" name="tempHashtags">예) #태그1 #태그2 #태그3<br>
<input type="submit" value="등록하기">
</form>