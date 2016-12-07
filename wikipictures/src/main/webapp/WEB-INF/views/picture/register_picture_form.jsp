<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
	  // 해시태그 입력 Controll
	  $('#tags').inputTags();
	
	  // 파일첨부 Controll
	  $(":file").filestyle();
	  //
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
      <input type="hidden" name="memberVO.id" value="${sessionScope.memberVO.id}">
      <label for="uploadFile">사진 이미지</label>
      <input type="file" id="input04" name="uploadFile">
    </div>
    <div class="form-group">
      <label for="category">카테고리</label>
      <select name="category" multiple class="form-control">
        <option value="장소">장소</option>
        <option value="인물">인물</option>
        <option value="사건">사건</option>
      </select>
      <br>
    </div>
    <div class="form-group">
      <label for="id">키워드</label>
      <input type="text" name="keyword" class="form-control">
    </div>
    <div class="form-group">
      <label for="date">사진의 날짜를 지정해주세요.</label>
      <input class="form-control" id="date" name="pictureDate" placeholder="년-월-일" type="text" required>
    </div>
    <div class="form-group">
      <label for="authorComment">코멘트</label>
      <textarea name="authorComment" class="form-control" rows="5" id="textArea"></textarea>
    </div>
    <div class="form-group">
      <label for="pictureSpace">장소</label>
      <input type="text" name="pictureSpace" class="form-control">
    </div>
    <div class="form-group">
      <label for="tempHashtags">해시태그</label>
      <input type="text" name="tempHashtags" id="tags">
    </div>
    <input class="btn btn-default btn-lg btn-block" id="formButton" type="button" value="등록하기">
  </form>
</div>


    // 파일첨부 Controll
    $(":file").filestyle();
    //목요일 3시부터 시작 10분이내 erd 바꾼거 추가 (변경 설계 추가) 소스코드를 견고히
    //2차구현때는 차라리 알고리즘 같은 것을 추가 포트폴리오 및 취업관련 스터디 정리단계
    //담주 금요일 2차 마감 금토일 리팩토링 취업준비 월화수 안드로이드 기초 화요일 포폴 목요일 수료날 받음
    //시큐리티 월요일 교육 포트폴리오 변경이력 만들어서 공부할때 참고가 되도록 
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
          <input type="hidden" name="memberVO.id" value="${sessionScope.memberVO.id}">
          <label for="uploadFile">사진 이미지</label>
          <input type="file" id="input04" name="uploadFile">
        </div>
        <div class="form-group">
          <label for="category">카테고리</label>
        <select name="category" multiple class="form-control">
			<option value="장소">장소</option>
			<option value="인물">인물</option>
			<option value="사건">사건</option>
		</select><br>
        </div>
        <div class="form-group">
          <label for="id">키워드</label>
          <input type="text" name="keyword" class="form-control">
        </div>
        <div class="form-group">
          <label for="date">사진의 날짜를 지정해주세요.</label>
          <input class="form-control" id="date" name="pictureDate" placeholder="년-월-일" type="text" required>
        </div>
        <div class="form-group">
		  <label for="authorComment">코멘트</label>
          <textarea name="authorComment" class="form-control" rows="5" id="textArea"></textarea>
        </div>
        <div class="form-group">
		  <label for="pictureSpace">장소</label>
          <input type="text" name="pictureSpace" class="form-control">
        </div>
        <div class="form-group">
          <label for="tempHashtags">해시태그</label>
          <input type="text" name="tempHashtags" id="tags">
        </div>
        <input class="btn btn-default btn-lg btn-block" id="formButton" type="button" value="등록하기">
      </form>
    </div>