<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <!-- Flipster Carousel CSS -->
  <link href="css/demo.css" rel="stylesheet">
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

  <!-- Bootstrap Carousel -->
  <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
  <!-- Flipster Carousel css -->
  <link href="${pageContext.request.contextPath}/resources/css/jquery.flipster.min.css" rel="stylesheet">
  <!-- icon css -->
  <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Animate modal -->
  <link href="${pageContext.request.contextPath}/resources/css/normalize.min.css" rel="stylesheet">
  <!-- Animate modal -->
  <link href="${pageContext.request.contextPath}/resources/css/animate.min.css" rel="stylesheet">
  
  <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
  <script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"></script>
  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>


  <!-- Animate modal setting -->
  <style>
    #btn-close-modal {
      width:100%;
      text-align: center;
      cursor:pointer;
      color:#fff;
    }
  </style>
</head>

<body cz-shortcut-listen="true">
  <!-- NAVBAR START ================================================== -->
  <div class="navbar-wrapper">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
          </button>
        <a class="navbar-brand" href="#">Wiki Pictures</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">로그인</a></li>
            <li><a href="member/register_form.do">회원가입</a></li>
            <li><a href="#">타임머신</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav><!-- /.navbar navbar-default -->
  </div><!-- /.navbar-wrapper -->
  <!-- NAVBAR END ================================================== -->

  <!-- Carousel START ================================================== -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="first-slide" src="img/1.jpg" alt="First slide"> 
      <div class="container">
        <div class="carousel-caption">
          <h1>1번 사진</h1>
          <br>
          <p>1번사진의 엄청난 배경</p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="second-slide" src="img/2.jpg" alt="Second slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>2번 사진</h1>
          <br>
          <p>2번사진의 엄청난 배경</p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="third-slide" src="img/3.jpg" alt="Third slide">
      <div class="container">
        <div class="carousel-caption">
          <h1>3번 사진</h1>
          <br>
          <p>3번사진의 엄청난 배경</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Carousel Button START ================================================== -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
  </a>
  <!-- Carousel Button END ================================================== -->
  <br>
    
    <!-- Serch ================================================== -->
    <div class="col-xs-12">
      <div class="input-group">
     	 <form action ="searchPicture.do">
        <input type="text" name="keyword" class="form-control" placeholder="검색할 내용을 입력해주세요">
        <span class="input-group-btn">
          <button class="btn btn-default" type="submit">검색</button>
        </span>
        </form>
      </div><!-- /input-group -->
    </div><!-- /search -->
  </div><!-- /.carousel -->
  <!-- Carousel END ================================================== -->
  <br>

<!-- Main Container Start ================================================== -->
<div class="container">
  <div class="row">
    <!-- 검색버튼 -->
    <a href="#" class="btn btn-default btn-lg btn-block">당신의 추억을 나누어주세요</a>

    <hr class="featurette-divider">

    <ul>
      <li><a id="demo01" href="#animatedModal">DEMO01</a></li>
      <li><a id="demo02" href="#modal-02">DEMO02</a></li>
    </ul>

    <h2>테스트 1</h2>

    <div id="carousel">
      <ul class="flip-items">
        <li data-flip-title="대분류 1">
          <img src="resources/img/1.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 1" data-flip-category="대분류 2">
          <img src="img/2.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 2" data-flip-category="대분류 2">
          <img src="img/3.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 3" data-flip-category="대분류 2">
          <img src="img/4.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 4" data-flip-category="대분류 3">
          <img src="img/5.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 5" data-flip-category="대분류 3">
          <img src="img/6.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 6" data-flip-category="대분류 4">
          <img src="img/7.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 7" data-flip-category="대분류 4">
          <img src="img/8.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 8" data-flip-category="대분류 5">
          <img src="img/9.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 9" data-flip-category="대분류 5">
          <img src="img/10.jpg" style="width: 500px; height: auto;">
        </li>
      </ul>
    </div>

    <hr class="featurette-divider">

    <h2>테스트 2</h2>

    <div id="wheel">
      <ul class="flip-items">
        <li data-flip-title="대분류 1">
          <img src="img/1.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 1" data-flip-category="대분류 2">
          <img src="img/2.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 2" data-flip-category="대분류 2">
          <img src="img/3.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 3" data-flip-category="대분류 2">
          <img src="img/4.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 4" data-flip-category="대분류 3">
          <img src="img/5.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 5" data-flip-category="대분류 3">
          <img src="img/6.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 6" data-flip-category="대분류 4">
          <img src="img/7.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 7" data-flip-category="대분류 4">
          <img src="img/8.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 8" data-flip-category="대분류 5">
          <a href="http://www.naver.com">
            <img src="img/9.jpg" style="width: 500px; height: auto;">
          </a>
        </li>
        <li data-flip-title="중분류 9" data-flip-category="대분류 5">
          <img src="img/10.jpg" style="width: 500px; height: auto;">
        </li>
      </ul>
    </div>
    <hr class="featurette-divider">

    <div id="flat">

    <h2>테스트 3</h2>

      <ul class="flip-items">
        <li data-flip-title="대분류 1">
          <img src="img/1.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 1" data-flip-category="대분류 2">
          <img src="img/2.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 2" data-flip-category="대분류 2">
          <img src="img/3.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 3" data-flip-category="대분류 2">
          <img src="img/4.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 4" data-flip-category="대분류 3">
          <img src="img/5.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 5" data-flip-category="대분류 3">
          <img src="img/6.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 6" data-flip-category="대분류 4">
          <img src="img/7.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 7" data-flip-category="대분류 4">
         <img src="img/8.jpg" style="width: 500px; height: auto;">
        </li>
        <li data-flip-title="중분류 8" data-flip-category="대분류 5">
          <a href="http://www.naver.com">
           <img src="img/9.jpg" style="width: 500px; height: auto;">
          </a>
        </li>
        <li data-flip-title ="중분류 9" data-flip-category="대분류 5">
          <img src="img/10.jpg" style="width: 500px; height: auto;">
        </li>
      </ul>
    </div>
  </div><!-- /.row -->

  
  <hr class="featurette-divider">
  <!-- FOOTER START ================================================== -->
  <footer>
    <p class="pull-right"><a href="#top">맨위로</a></p>
    <p>© 2016 Six-Men studios. · 
      <a href="#">이용약관</a> · 
      <a href="#">Six-Men studios 소개</a> · 
      <a href="#">채용정보</a> · 
    </p>
  </footer>
</div><!-- /.container -->
<!-- Main Container END ================================================== -->

  <!-- animatedModal TEST START ================================================== -->
  <!--DEMO01-->
  <div id="animatedModal">
    <!--THIS IS IMPORTANT! to close the modal, the class name has to match the name given on the ID -->
    <div  id="btn-close-modal" class="close-animatedModal"> 
      CLOSE MODAL
    </div>

    <div class="modal-content">
      Modal Test<br>
    </div>
  </div>

  <!--DEMO02-->
  <div id="modal-02">
    <!--"THIS IS IMPORTANT! to close the modal, the class name has to match the name given on the ID-->
    <div  id="btn-close-modal" class="close-modal-02"> 
     CLOSE MODAL
    </div>

    <div class="modal-content">
      Modal Test
    </div>
  </div>
  <!-- animatedModal TEST END ================================================== -->

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  <script src="${pageContext.request.contextPath}/resources/js/holder.min.js"></script>
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
  <!-- Animate modal -->
  <script src="${pageContext.request.contextPath}/resources/js/animatedModal.min.js"></script>
  <!-- Flipster Carousel -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.flipster.min.js"></script>
  <script>
    $(document).ready(function(){
      // 상단 Carousel
      $('#myCarousel').carousel({
        interval: 1500,
        pause : "hover",
        wrap : true,
        keyboard : true
      });

      $('.my-flipster').flipster();

      var carousel = $("#carousel").flipster({
        style: 'carousel',
        spacing: -0.5,
        nav: true,
        buttons: true,
      });

      var wheel = $("#wheel").flipster({
        style: 'wheel',
        spacing: 0,
        nav: true,
        buttons: true,
      });
      
      var flat = $("#flat").flipster({
        style: 'flat',
        spacing: -0.25
      });
    });
    //demo 01
    $("#demo01").animatedModal();

    //demo 02
    $("#demo02").animatedModal({
      modalTarget:'modal-02',
      animatedIn:'zoomIn',
      animatedOut:'zoomOut',
      color:'#3498db'
    });
  </script>
</body>
</html>
