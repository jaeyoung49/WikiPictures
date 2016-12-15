<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Attribute START ================================================== -->
<sec:authentication var="mvo" property="principal"/>
<!-- Attribute END ==================================================== -->

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
      <sec:authorize ifNotGranted="ROLE_MEMBER, ROLE_ADMIN ">
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
          <!-- 로그인 START ================================================== -->
		  <c:import url="../member/login_all_form.jsp"/>
          <!-- 로그인 END ================================================== -->
        </div>
      </sec:authorize>
      <sec:authorize ifAllGranted="ROLE_MEMBER, ROLE_ADMIN">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav pull-right">
            <li> 	<a href="${pageContext.request.contextPath}/show_member_list.do">관리자 홈으로</a>
              <br>
            </li>
            <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/searchPicture.do">
              <div class="form-group">
                <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
              </div>
              <button type="submit" class="btn btn-default">검색</button>
            </form>
            <li><a href="${pageContext.request.contextPath}/picture/register_picture_form.do">업로드</a></li>
            <li><a href="${pageContext.request.contextPath}/showMypictureList.do">마이페이지</a> </li>
            <li><a href="#" id="logout">로그아웃 </a>
          </ul>
        </div>
      </sec:authorize>
      <sec:authorize ifNotGranted="ROLE_ADMIN" ifAnyGranted="ROLE_MEMBER">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav pull-right">
            <sec:authorize ifNotGranted="ROLE_ADMIN">
              <li><a href="#">${mvo.nickname}님 </a></li>
            </sec:authorize>
            <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/searchPicture.do">
              <div class="form-group">
                <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
              </div>
              <button type="submit" class="btn btn-default">검색</button>
            </form>
            <sec:authorize ifAllGranted="ROLE_MEMBER, ROLE_ADMIN">
              <li><a href="${pageContext.request.contextPath}/admin/show_admin_mypage.do">관리자페이지</a></li>
            </sec:authorize>
            <li><a href="${pageContext.request.contextPath}/picture/register_picture_form.do">업로드</a></li>
            <li><a href="${pageContext.request.contextPath}/member/show_member_mypage.do">마이페이지</a></li>
            <li><a href="#" id="logout">로그아웃 </a>
          </ul>
        </div>
      </sec:authorize>
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