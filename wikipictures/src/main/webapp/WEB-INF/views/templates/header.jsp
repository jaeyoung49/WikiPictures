
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){	
		$("#loginForm").submit(function(){			
			if($("#loginForm :input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}else if($("#loginForm :input[name=password]").val()==""){
				alert("비밀번호를 입력하세요!");
				return false;
			}		
			$("#logout").click(function(){
	    		if(confirm("로그아웃하시겠습니까?")){
	    			location.href="${pageContext.request.contextPath}/logout.do";
	    		}
	    	});
		});
	});
</script>    
<body>
 <c:choose>
   		<c:when test="${sessionScope.mvo==null}">
<form method="post" action="${pageContext.request.contextPath}/login.do" id="loginForm">
아이디 : <input type="text" name="id">
비밀번호 : <input type="password" name="password">
<input type="submit" value="로그인">
 <a href="${pageContext.request.contextPath}/member/register_form.do">회원가입</a><br>
</form>
<hr>
</c:when>
 <c:otherwise>
 ${sessionScope.mvo.nickname}님 |
 <a href="${pageContext.request.contextPath }/picture/upload_form.do">사진업로드 |</a>
 <a href="${pageContext.request.contextPath}/member/show_member_mypage.do">마이페이지 |</a>
 <a href="${pageContext.request.contextPath}/member/update_member_form.do">회원정보수정 |</a>
  <a href="${pageContext.request.contextPath}/logout.do" id="logout">로그아웃 |</a>
<hr>
</c:otherwise>

</c:choose>
</body>
</html>