
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   
   
 <!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Six-Men studios">
  <title>Wiki Pictures</title>
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/inputTags.min.css" rel="stylesheet">
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
  <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
  <script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"></script>
  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/inputTags.jquery.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
		$("#addhashtag").click(function(){
			$("#hashtagForm").submit();
		}); // click
		$("#tags").inputTags(); 
    }); //ready
  </script>

   <style>
  
  .hashTag {
    margin: auto;
  }
  
  .hashTag a {
    text-decoration: none;
  }
  </style>

</head>

<body>
	
    <!-- /#sidebar-wrapper -->
    <nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0px; font-size: 1em">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" style="font-size: 1.3em" href="#">Wiki Pictures</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="hamburger is-closed" data-toggle="offcanvas">마이페이지</a></li>
            <li><a href="#">로그인</a></li>
            <li><a href="#">회원가입</a></li>
          </ul>
        </div>
        <!--/.nav-collapse -->
      </div>
    </nav>
  </div>
  <!-- /container -->
  </div>
  <ol class="breadcrumb text-center" style="font-size: 1em">
    <li><a href="#">Home</a></li>
    <li><a href="#">Library</a></li>
    <li><a href="#">Library</a></li>
  </ol>
  <div class="row">
    <div class="container">
      <div class="thumbnail"> 
        <img src="${pageContext.request.contextPath}/resources/img/${requestScope.picturevo.path}" alt="이미지설명">
        <div class="caption">
          <h3>제목 : ${requestScope.picturevo.keyword}</h3>
          <p>내용 : ${requestScope.picturevo.authorComment}</p>
          <p>촬영일 : ${requestScope.picturevo.pictureDate}</p>
          <div class="form-group">
          </div>
          <p>장소 : ${requestScope.picturevo.pictureSpace}</p>
          <div class="form-group">
          </div>
          해시태그
          <div class="form-group">
            <div id="tagcloud" class="hashTag">
              <!-- rel은 글씨 크기를 좌우한다 -->
              <c:forEach items="${requestScope.pvo}" var="pvo">
              <a href="${pageContext.request.contextPath}/searchPicture.do?keyword=${pvo.hashtagName}" rel="${pvo.hashtagCount}">#${pvo.hashtagName}</a>
              </c:forEach> 
            </div>
          </div>
          <form id="hashtagForm" action="addHashtag.do">
          <div class="form-group">
            해시태그추가
            <br>
            <input type="text" name="hashtagName" id="tags" placeholder="태그입력후 Enter를 눌러주세요">  
             <input type="hidden" name="pictureDate" value="${requestScope.picturevo.pictureDate}">
             <input type="hidden" name="keyword" value="${requestScope.picturevo.keyword}">
          </div>
          <p><a class="btn btn-primary" id="addhashtag" role="button">버튼1</a>
          </form>
            <!-- <a href="#" class="btn btn-default" role="button">버튼2</a> --></p>
            <!-- <span id="dataView"></span> -->
        </div>
      </div>
    </div>
  </div>
  <footer class="footer">
    <div class="container" style="padding-top: 100px;">
      <hr>
      <p class="pull-right"><a href="#top">맨위로</a></p>
      <p>ⓒ 2016 Six-Men studios. ·
        <a href="#">이용약관</a> ·
        <a href="#">Six-Men studios 소개</a> ·
        <a href="#">채용정보</a> ·
      </p>
    </div>
  </footer>

   <script src="${pageContext.request.contextPath}/resources/js/jquery.tagcloud.js"></script>
    <script>
    $("#tagcloud a").tagcloud({
      size: {
        start: 12,
        end: 36,
        unit: "px"
      },
      color: {
        start: '#3498DB',
        end: '#46CFB0'
      }
    });
    </script>
    <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script');
      ga.type = 'text/javascript';
      ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(ga, s);
    })();
    </script>
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>
 