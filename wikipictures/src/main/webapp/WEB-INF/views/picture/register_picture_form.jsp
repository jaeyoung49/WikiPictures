<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 파일업로드 라이브러리 css -->
<link href="${pageContext.request.contextPath}/resources/css/dropify.min.css" rel="stylesheet">
<script>
	$(document).ready(function() {
	  // 해시태그 입력 Controll
	  $('#tags').inputTags();
	
	  // 제출
	  $("#formButton").click(function() {
	    $("#registerForm").submit();
	  });
	});
</script>

<div class="container" style="margin-top: 20px;">
  <form id="registerForm" action="${pageContext.request.contextPath}/registerPicture.do" method="post" enctype="multipart/form-data" class="form-horizontal">
    <legend>사진 업로드</legend>
    <div class="form-group">
      <label for="input-file-now">당신의 추억을 공유해주세요</label>
      <input type="file" id="input-file-now" name="uploadFile" class="dropify">
      <input type="hidden" name="memberVO.id" value="${sessionScope.memberVO.id}">
    </div>
    <div class="form-group">
      <label for="category">카테고리</label>
      <select name="category" multiple class="form-control" required>
        <option value="장소">장소</option>
        <option value="인물">인물</option>
        <option value="사건">사건</option>
        <option value="사건">역사</option>
      </select>
      <br>
    </div>
    <div class="form-group">
      <label for="id">키워드</label>
      <input type="text" name="keyword" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="date">사진의 촬영일로 지정해주세요.</label>
    <input class="form-control" type="text" data-format="Y-m-d" data-lang="ko" 
    id="date" name="pictureDate" data-large-default="true" data-large-mode="true" required>
   </div>
    <div class="form-group">
      <label for="authorComment">사진 설명</label>
      <textarea name="authorComment" class="form-control" rows="5" id="textArea" required></textarea>
    </div>
    <div class="form-group">
      <label for="pictureSpace">장소</label>
      <input type="text" name="pictureSpace" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="tempHashtags">해시태그 (입력 후 엔터를 눌러주세요! 최대 6개:)</label>
      <input type="text" name="tempHashtags" id="tags" required>
    </div>
    <input class="btn btn-success btn-lg btn-block" id="formButton" type="button" value="등록하기">
  </form>
</div>
	<!-- 파일업로드 라이브러리 js -->
	<script src="${pageContext.request.contextPath}/resources/js/dropify.min.js"></script>
	
	<script>
	$(document).ready(function() {
	// 파일첨부 Controll
	  $('.dropify').dropify();
	// 날짜 선택 Controll
	  $('#date').dateDropper();
	});
</script>
