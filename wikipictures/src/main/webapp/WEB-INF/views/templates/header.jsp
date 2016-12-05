
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse" role="navigation" style="margin-bottom: 0px;">
    <div class="container">
      <!-- Toggle Display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" style="font-size: 2em;">Wiki Pictures</a>
      </div>
      <!-- NAVBAR Button -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav pull-right">
          <li><a href="#">업로드</a></li>
          <li><a href="#">마이페이지</a></li>
          <li><a href="#">정정 / 신고 요청</a></li>
        </ul>
        <!-- 검색 ================================================== -->
        <form class="navbar-form navbar-right" role="search">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="검색어를 입력해주세요">
          </div>
          <button type="submit" class="btn btn-default">검색</button>
        </form>
         <!-- 로그인 ================================================== -->
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>로그인</b> <span class="caret"></span></a>
            <ul id="login-dp" class="dropdown-menu">
              <li>
                <div class="row">
                  <div class="col-md-12">
                    소셜 로그인
                    <div class="social-buttons">
                      <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                      <a href="#" class="btn btn-go"><i class="fa fa-google"></i> Google</a>
                    </div>
                    <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
                      <div class="form-group">
                        <label class="sr-only" for="exampleInputId2">id</label>
                        <input type="text" class="form-control" id="exampleInputEmailId2" placeholder="아이디" required>
                      </div>
                      <div class="form-group">
                        <label class="sr-only" for="exampleInputPassword2">password</label>
                        <input type="password" class="form-control" id="exampleInputPassword2" placeholder="비밀번호" required>
                        <div class="help-block text-right"><a href="">비밀번호 찾기</a></div>
                      </div>
                      <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">로그인</button>
                      </div>
                    </form>
                  </div>
                  <div class="bottom text-center">
                    회원이 아니세요? <a href="#"><strong style="color: blue">회원가입</strong></a>
                  </div>
                </div>
              </li>
            </ul>
          </li>
        </ul>
        <!-- /.navbar-collapse -->
      </div>
    </div>
 </nav> 
    
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<%--   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <script type="text/javascript"> -->
// 	$(document).ready(function(){	
// 		$("#logout").click(function(){
//     		if(confirm("로그아웃하시겠습니까?")){
//     			location.href="${pageContext.request.contextPath}/logout.do";
//     		}
//     	});
		
// 		$("#loginForm").submit(function(){			
// 			if($("#loginForm :input[name=id]").val()==""){
// 				alert("아이디를 입력하세요!");
// 				return false;
// 			}else if($("#loginForm :input[name=password]").val()==""){
// 				alert("비밀번호를 입력하세요!");
// 				return false;
// 			}		
// 		});
// 	});
<!-- </script>     -->
<!-- <body> -->
<%--  <c:choose> --%>
<%--    		<c:when test="${sessionScope.mvo==null}"> --%>
<%-- <form method="post" action="${pageContext.request.contextPath}/login.do" id="loginForm"> --%>
<!-- 아이디 : <input type="text" name="id"> -->
<!-- 비밀번호 : <input type="password" name="password"> -->
<!-- <input type="submit" value="로그인"> -->
<%--  <a href="${pageContext.request.contextPath}/member/register_member_form.do">회원가입</a><br> --%>
<!-- </form> -->
<!-- <hr> -->
<%-- </c:when> --%>
<%--  <c:otherwise> --%>
<%--  ${sessionScope.mvo.nickname}님 | --%>
<%--  <a href="${pageContext.request.contextPath }/picture/upload_form.do">사진업로드 |</a> --%>
<%--  <a href="${pageContext.request.contextPath }/picture/register_picture_form.do">사진업로드 |</a> --%>
<%--  <a href="${pageContext.request.contextPath}/member/show_member_mypage.do">마이페이지 |</a> --%>
<%--  <a href="${pageContext.request.contextPath}/member/update_member_form.do">회원정보수정 |</a> --%>
<!--   <a href="#" id="logout">로그아웃 |</a> -->
<!-- <hr> -->
<%-- </c:otherwise> --%>

<%-- </c:choose> --%>
<!-- </body> -->
<!-- </html> -->