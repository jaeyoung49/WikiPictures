<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		var checkResultId="";
		$("#regForm").submit(function(){
			if($("#regForm :input[name=id]").val().trim()==""){
				alert("아이디를 입력하세요!");
				return false;
			} if($("#regForm :input[name=nickname]").val().trim()==""){
				alert("닉네임을 입력하세요!");
				return false;	
			} if($("#regForm :input[name=password]").val().trim()==""){
				alert("비밀번호를 입력하세요!");
				return false;
			}if($("#regForm :input[name=birth]").val().trim()==""){
				alert("생년월일을 입력하세요!");
				return false;
			}if($("#regForm :input[name=favoriteSpaceㄴ]").val().trim()==""){
				alert("선호장소를 입력하세요!");
				return false;
			}if(checkResultId==""){
			alert("아이디 중복확인을 하세요");
			return false;
		}	
	});
	$("#regForm :input[name=id]").keyup(function(){
		var id=$(this).val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자 이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
		}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/idcheckAjax.do",
				data:"id="+id,
				success:function(data){
					if(data=="fail"){
					$("#idCheckView").html(id+"사용불가!").css("background","red");
						checkResultId="";
					}else{
						$("#idCheckView").html(id+"사용가능!").css(
								"background","yellow");
						checkResultId=id;
				}
			}
		});
	});
});
</script>

    <div class="modal-dialog">
      <h1 class="text-center" style="color:#fff;">환영합니다</h1>
      <form name="login" class="register" role="form" method="post" id="regForm"
      	action="${pageContext.request.contextPath}/registerMember.do" accept-charset="UTF-8">
        <b style="color: #fff">소셜 가입</b>
          <div class="social-buttons form-group">
            <a href="#" class="btn btn-fb btn-block"><i class="fa fa-facebook"></i> Facebook</a>
            <a href="#" class="btn btn-go btn-block"><i class="fa fa-google"></i> Google</a>
          </div>
            <div class="form-group">
              <label class="sr-only">id</label>
              <input type="text" name="id" class="form-control" placeholder="아이디" required>
              <span id="idCheckView"></span>
            </div>
            <div class="form-group">
              <label class="sr-only">비밀번호</label>
              <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
              <label class="sr-only">닉네임</label>
              <input type="text" name="nickname" class="form-control" placeholder="닉네임" required>
            </div>
        	<div class="form-group">
        	    <input class="form-control" type="text" data-format="Y-m-d" data-lang="ko" 
    			id="date" name="birth" required>
        	</div>
            <div class="form-group">
              <label class="sr-only">선호장소</label>
              <input type="text" name="favoriteSpace" class="form-control" placeholder="선호장소" required>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-block">회원가입</button>
              <button type="button" class="btn btn-default btn-block" data-dismiss="modal">닫기</button>
            </div>
          </form>
    </div>
	<script>
	$(document).ready(function() {
	// 날짜 선택 Controll
	  $('#date').dateDropper();
	});
</script>