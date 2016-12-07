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
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do" style="font-size: 2em;">Wiki Pictures</a>
    </div>
    <!-- NAVBAR Button -->
    <c:choose>
      <c:when test="${sessionScope.mvo==null}">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav pull-right">
            <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/searchPicture.do">
              <div class="form-group">
                <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
              </div>
              <button type="submit" class="btn btn-default">검색</button>
            </form>
          </ul>
          <!-- 검색 ================================================== -->
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
                      <form class="form" role="form" method="post" action="${pageContext.request.contextPath}/login.do" accept-charset="UTF-8" id="loginForm">
                        <div class="form-group">
                          <input type="text" name="id" class="form-control" placeholder="아이디" required>
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
                          <div class="help-block text-right"><a href="#">비밀번호 찾기</a></div>
                        </div>
                        <div class="form-group">
                          <input type="submit" class="btn btn-primary btn-block" value="로그인">
                        </div>
                      </form>
                    </div>
                    <div class="bottom text-center">
                      회원이 아니세요? <a href="${pageContext.request.contextPath}/member/register_member_form.do"><strong style="color: blue">회원가입</strong></a>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
          <!-- /.navbar-collapse -->
        </div>
      </c:when>
      <c:when test="${sessionScope.mvo.id=='admin'}">
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         
        <ul class="nav navbar-nav pull-right">
        <li><a href="${pageContext.request.contextPath}/admin/show_admin_mypage.do">관리자 홈으로</a><br></li>
        <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/searchPicture.do">
          <div class="form-group">
            <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
          </div>
          <button type="submit" class="btn btn-default">검색</button>
        </form>
          <li><a href="${pageContext.request.contextPath}/picture/register_picture_form.do">업로드</a></li>
          <li><a href="${pageContext.request.contextPath}/member/show_member_mypage.do">마이페이지</a></li>
          <li><a href="#" id="logout">로그아웃 </a>
          </ul>
          </div>
      </c:when>
      <c:otherwise>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav pull-right">
            <c:if test="${sessionScope.mvo.id!='admin'}">
              <li><a href="#">${sessionScope.mvo.nickname}님 </a></li>
            </c:if>
            <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/searchPicture.do">
              <div class="form-group">
                <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
              </div>
              <button type="submit" class="btn btn-default">검색</button>
            </form>
            <c:if test="${sessionScope.mvo.id=='admin'}">
              <li><a href="${pageContext.request.contextPath}/admin/show_admin_mypage.do">관리자페이지</a></li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/picture/register_picture_form.do">업로드</a></li>
            <li><a href="${pageContext.request.contextPath}/member/show_member_mypage.do">마이페이지</a></li>
            <li><a href="#" id="logout">로그아웃 </a>
          </ul>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</nav>
<script type="text/javascript">
	$(document).ready(function() {
	  $("#logout").click(function() {
	    if (confirm("로그아웃하시겠습니까?")) {
	      location.href = "${pageContext.request.contextPath}/logout.do";
	    }
	  });
	  $("#loginForm").submit(function() {
	    if ($("#loginForm :input[name=id]").val() == "") {
	      alert("아이디를 입력하세요!");
	      return false;
	    } else if ($("#loginForm :input[name=password]").val() == "") {
	      alert("비밀번호를 입력하세요!");
	      return false;
	    }
	  });
	});
</script>
