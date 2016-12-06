<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <script>
  $(document).ready(function() {
    // 해시태그 입력 Controll
    $('#tags').inputTags();

    // 파일첨부 Controll
    $(":file").filestyle();
    
    // 제출
    $("#formButton").click(function(){
    	$("#registerForm").submit();
    });
  });
  </script>

 <div class="container">
      <form id="registerForm" action="${pageContext.request.contextPath}/registerPicture.do" method="post" enctype="multipart/form-data" class="form-horizontal">
        <legend>사진 업로드</legend>
        <div class="form-group">
          <input type="hidden" name="memberVO.id" value="${sessionScope.memberVO.id}"> 사진 이미지
          <input type="file" id="input04" name="uploadFile">
        </div>
        <div class="form-group">
          카테고리
        <select name="category">
			<option value="장소">장소</option>
			<option value="인물">인물</option>
			<option value="사건">사건</option>
		</select><br>
        </div>
        <div class="form-group">
          키워드
          <br>
          <input type="text" name="keyword" class="form-control">
        </div>
        <div class="form-group">
          사진의 날짜를 지정해주세요.
          <input class="form-control" id="date" name="pictureDate" placeholder="년/월/일" type="text" required>
        </div>
        <div class="form-group">
          원작자코멘트
          <br>
          <textarea name="authorComment" class="form-control" rows="5" id="textArea"></textarea>
        </div>
        <div class="form-group">
          장소
          <br>
          <input type="text" name="pictureSpace" class="form-control">
        </div>
        <div class="form-group">
          해시태그
          <br>
          <input type="text" name="tempHashtags" id="tags">
        </div>
        <input id="formButton" type="button" value="등록하기">
      </form>
    </div>