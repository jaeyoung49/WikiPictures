<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Attribute START ================================================== -->
<c:set var="timeMachineYearList" value="${requestScope.timeMachineYearList}"/>
<c:set var="timeMachineVO" value="${requestScope.timeMachineVO }"/>
<c:set var="accidentPictureList" value="${requestScope.accidentPictureList }"/>
<c:set var="personAndLocationPictureList" value="${requestScope.personAndLocationPictureList }"/>
<!-- Attribute END ================================================== -->
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Wiki Pictures</title>
  <meta name="AUTHOR" content="Six-Men studios">
  <meta name="DESCRIPTION" content="위키 픽쳐스 첫 방문 index 페이지">
  <meta name="KEYWORDS" content="Wiki Pictures, Cinema View & Time Machine">
  <!-- 부트스트랩 핵심 css -->
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- 부트스트랩 자체수정 css -->
  <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
  <!-- Window8 & IE10 버그 해결 css -->
  <link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
  <!-- 부트스트랩 Carousel -->
  <link href="${pageContext.request.contextPath}/resources/css/jquery.carousel.fullscreen.css" rel="stylesheet">
  <!-- PagePiling css -->
  <link href="${pageContext.request.contextPath}/resources/css/jquery.pagepiling.css" rel="stylesheet">
  <!-- jQuery v1.12.4 핵심 js -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <!-- google api jQuery -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <!-- Pagepiling js -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.pagepiling.min.js"></script>
  
  <script>
  // pagepiling Controll
  var deleteLog = false;
  $(document).ready(function() {
	var flag1 = ${accidentPictureList.isEmpty()};
	var flag2 = ${personAndLocationPictureList.isEmpty()};
	
	if(flag1){
		$('#pagepiling').pagepiling({
		      menu: '#menu',
		      anchors: ['page1', 'page3'],
		      loopTop: true,
		      loopBottom: true,

		      afterRender: function() {
		        //playing the video
		        $('video').get(0).play();
		      }
		    });
	} else if(flag2){
		$('#pagepiling').pagepiling({
		      menu: '#menu',
		      anchors: ['page1', 'page2',],
		      loopTop: true,
		      loopBottom: true,

		      afterRender: function() {
		        //playing the video
		        $('video').get(0).play();
		      }
		    });
	} else {
		$('#pagepiling').pagepiling({
		      menu: '#menu',
		      anchors: ['page1', 'page2', 'page3'],
		      loopTop: true,
		      loopBottom: true,

		      afterRender: function() {
		        //playing the video
		        $('video').get(0).play();
		      }
		});
	}
  });
  </script>
	<script type="text/javascript">
		$(document).ready(function() {
		$("#logout").click(function(){
				if(confirm("로그아웃하시겠습니까?")){
					location.href="${pageContext.request.contextPath}/logout.do";
				}
			});
			$("#loginForm").submit(function(){			
				if($("#loginForm :input[name=id]").val()==""){
					alert("아이디를 입력하세요!");
					return false;
				}else if($("#loginForm :input[name=password]").val()==""){
					alert("비밀번호를 입력하세요!");
					return false;
				}		
			});
		});
	</script>
</head>

<body>
  <!-- NAVBAR START ================================================== -->
  <nav class="navbar-inverse navbar-fixed-top" role="navigation" style="margin-bottom: 0px;">
    <div class="container">
      <!-- Toggle Display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do" style="font-size: 2em;">Wiki Pictures #${timeMachineVO.timeMachineYear }</a>
      </div>
      <!-- NAVBAR Button -->
      <c:choose>
      <c:when test="${sessionScope.mvo==null }">
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav pull-right">
      <li class="dropdown-toggle">
        <a href="#" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">타임머신<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" data-filter >
          	<c:forEach items="${timeMachineYearList}" var="row" >
          	  <li role="presentation">
          	  	<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/home.do?timeMachineYear=${row.timeMachineYear}">
          	  	  ${row.timeMachineYear}
          	  	</a>
          	  </li>
          	</c:forEach>
          </ul>
        </li>

        <!-- 검색 ================================================== -->
           <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/searchPicture.do">
          <div class="form-group">
            <input type="text" name="keyword" class="form-control" placeholder="검색어를 입력해주세요">
          </div>
          <button type="submit" class="btn btn-default">검색</button>
        </form>
        </ul>
        <!-- 검색 ================================================== -->
       
        <!-- 로그인 ================================================== -->
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>로그인</b>
            <span class="caret"></span></a>
            <ul id="login-dp" class="dropdown-menu">
              <li>
                <div class="row">
                  <div class="col-md-12">
                    <b style="color: #fff">소셜 로그인</b>
                    <div class="social-buttons">
                      <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                      <a href="#" class="btn btn-go"><i class="fa fa-google"></i> Google</a>
                    </div>

                    <form class="form" role="form" method="post" action="${pageContext.request.contextPath}/login.do" accept-charset="UTF-8" id="login-nav">
                      <div class="form-group">
                        <label class="sr-only" for="exampleInputId2">id</label>
                        <input type="text" class="form-control" id="exampleInputEmailId2" name="id" placeholder="아이디" required>
                      </div>
                      <div class="form-group">
                        <label class="sr-only" for="exampleInputPassword2">password</label>
                        <input type="password" class="form-control" id="exampleInputPassword2" name="password" placeholder="비밀번호" required>
                        <div class="help-block text-right"><a href="">비밀번호 찾기</a></div>
                      </div>
                      <div class="form-group">
                      <input type="submit" class="btn btn-primary btn-block" value="로그인">
                      </div>
                    </form>
                  </div>
  				  <div class="bottom text-center">
                    회원이 아니세요?&nbsp;<a href="#" style="text-decoration:none;" data-toggle="modal"
                    data-target="#registerModal"><strong style="color: Navy">&nbsp;회원가입</strong></a>
                  </div>
                </div>
              </li>
            </ul>
          </li>
        </ul>
        
      </div>
       
        </c:when>
        <c:when test="${sessionScope.mvo.id=='admin' }">
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
             <li class="dropdown-toggle">
        <a href="#" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"><b>타임머신</b><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" data-filter >
          	<c:forEach items="${timeMachineYearList}" var="row" >
          	  <li role="presentation">
          	  	<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/home.do?timeMachineYear=${row.timeMachineYear}">
          	  	  ${row.timeMachineYear}
          	  	</a>
          	  </li>
          	</c:forEach>
          </ul>
        </li>
          </ul>
          </div>
        </c:when>
        <c:otherwise>
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         
        <ul class="nav navbar-nav pull-right">
        <li><a href="#">${sessionScope.mvo.nickname}님 </a></li>
        <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/searchPicture.do">
          <div class="form-group">
            <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
          </div>
          <button type="submit" class="btn btn-default">검색</button>
        </form>
          <li><a href="${pageContext.request.contextPath}/picture/register_picture_form.do">업로드</a></li>
          <li><a href="${pageContext.request.contextPath}/member/show_member_mypage.do">마이페이지</a></li>
          <li><a href="#" id="logout">로그아웃 </a>
          <li class="dropdown-toggle">
        <a href="#" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"><b>타임머신</b><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" data-filter >
          	<c:forEach items="${timeMachineYearList}" var="row" >
          	  <li role="presentation">
          	  	<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/home.do?timeMachineYear=${row.timeMachineYear}">
          	  	  ${row.timeMachineYear}
          	  	</a>
          	  </li>
          	</c:forEach>
          </ul>
        </li>
          </ul>
          </div>
        </c:otherwise>
        </c:choose>
      <!-- /.navbar-collapse -->
    </div>
  </nav>
  <!-- NAVBAR END ================================================== -->

  <!-- MAIN START ================================================== -->
  <div id="pagepiling">
    <!-- Video Page START ================================================== -->
    <br><br>
    <div class="section" id="section1">
      <video autoplay loop muted id="video">
        <source src="${pageContext.request.contextPath}/resources/video/${timeMachineVO.timeMachineYear}.mp4" type="video/mp4">
      </video>
      <div class="layer text-center">
      	<a href="${pageContext.request.contextPath}/searchPicture.do?keyword=${timeMachineVO.timeMachineKeyword}"> <!-- 서치 페이지 보여줌 -->
          <h1 class="text-center">${timeMachineVO.timeMachineTitle }</h1>
          <h3 class="text-center">${timeMachineVO.timeMachineContent }</h3>
        </a>
      </div>
    </div>
    <!-- section2 Page START ================================================== -->
    <c:if test="${accidentPictureList.size() != 0 }">
    <div class="section" id="section2">
      <div class="intro">
        <div id="carousel1-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel1-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel1-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel1-example-generic" data-slide-to="2"></li>
          </ol>
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <img src="${pageContext.request.contextPath}/resources/img/${accidentPictureList[0].path }" alt="조회수 : ${accidentPictureList[0].hits}" />
              <div class="container">
                <div class="carousel-caption">
                  <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${accidentPictureList[0].pictureDate}&keyword=${accidentPictureList[0].keyword}">
                    <h1 class="text-center">${accidentPictureList[0].keyword}</h1>
                    <h3 class="text-center">${accidentPictureList[0].authorComment}</h3>
                  </a>
                </div>
              </div>
            </div>
            <div class="item">
              <img src="${pageContext.request.contextPath}/resources/img/${accidentPictureList[1].path }" alt="조회수 : ${accidentPictureList[1].hits}" />
              <div class="container">
                <div class="carousel-caption">
                  <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${accidentPictureList[1].pictureDate}&keyword=${accidentPictureList[1].keyword}">
                    <h1 class="text-center">${accidentPictureList[1].keyword}</h1>
                    <h3 class="text-center">${accidentPictureList[1].authorComment}</h3>
                  </a>
                </div>
              </div>
            </div>
            <div class="item">
              <img src="${pageContext.request.contextPath}/resources/img/${accidentPictureList[2].path }" alt="조회수 : ${accidentPictureList[2].hits}" />
              <div class="container">
                <div class="carousel-caption">
				  <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${accidentPictureList[2].pictureDate}&keyword=${accidentPictureList[2].keyword}">                
                    <h1 class="text-center">${accidentPictureList[2].keyword}</h1>
                    <h3 class="text-center">${accidentPictureList[2].authorComment}</h3>
                  </a>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Carousel 좌우 Button -->
          <a class="left carousel-control" href="#carousel1-example-generic" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#carousel1-example-generic" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
      </div>
    </div>
	</c:if>
    <!-- section3 Page START ================================================== -->
    <c:if test="${personAndLocationPictureList.size() != 0 }">
    <div class="section" id="section3">
      <div class="intro">
        <div id="carousel2-example-generic" class="carousel slide" data-ride="carousel">
          
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel2-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel2-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel2-example-generic" data-slide-to="2"></li>
          </ol>
          <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <div class="item active">
                <img src="${pageContext.request.contextPath}/resources/img/${personAndLocationPictureList[0].path }" alt="${personAndLocationPictureList[0].hits }" />
                <div class="container">
                  <div class="carousel-caption">
                    <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${personAndLocationPictureList[0].pictureDate}&keyword=${personAndLocationPictureList[0].keyword}">
                      <h1 class="text-center">${personAndLocationPictureList[0].keyword}</h1>
                      <h3 class="text-center">${personAndLocationPictureList[0].authorComment}</h3>
                    </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <img src="${pageContext.request.contextPath}/resources/img/${personAndLocationPictureList[1].path }" alt="${personAndLocationPictureList[1].hits }" />
                <div class="container">
                  <div class="carousel-caption">
                    <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${personAndLocationPictureList[1].pictureDate}&keyword=${personAndLocationPictureList[1].keyword}">
                      <h1 class="text-center">${personAndLocationPictureList[1].keyword}</h1>
                      <h3 class="text-center">${personAndLocationPictureList[1].authorComment}</h3>
                    </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <img src="${pageContext.request.contextPath}/resources/img/${personAndLocationPictureList[2].path }" alt="${personAndLocationPictureList[2].hits }" />
                <div class="container">
                  <div class="carousel-caption">
			        <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${personAndLocationPictureList[2].pictureDate}&keyword=${personAndLocationPictureList[2].keyword}">                
                      <h1 class="text-center">${personAndLocationPictureList[2].keyword}</h1>
                      <h3 class="text-center">${personAndLocationPictureList[2].authorComment}</h3>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <!-- Carousel 좌우 Button -->
            <a class="left carousel-control" href="#carousel2-example-generic" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#carousel2-example-generic" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
          </div>
        </div>
      </div>
      </c:if>
    </div>
  <!-- MAIN END ================================================== -->

  <!-- Register Form Modal START ================================================== -->
  <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" style="background-color: rgba(255, 255, 255, 0.3);">
  	<c:import url ="member/register_member_form.jsp"/>
  </div>
  <!-- Register Form Modal END ================================================== -->
  
  <!-- 부트스트랩 핵심 js -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <!-- Window8 & IE10 버그 해결 js -->
  <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
  <!-- 부트스트랩 Carousel -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.carousel.fullscreen.js"></script>
  <!-- 타임머신 검색 필터 -->
  <script src="${pageContext.request.contextPath}/resources/js/diacritics.js"></script>
  <!-- 타임머신 검색 필터 -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-dropdown-filter.js"></script>
  <!-- Datepicker Controll js -->
  <script src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
  <!-- Datepicker 달력 js -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
  <!-- Datepicker 달력 한글화 js -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.kr.min.js"></script>
</body>

</html>
