<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <!-- Pagepiling js -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.pagepiling.min.js"></script>
  <script>
  // pagepiling Controll
  var deleteLog = false;

  $(document).ready(function() {
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
  });
  </script>
</head>

<body>
  <!-- NAVBAR START ================================================== -->
  <nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0px;">
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
      <li class="dropdown-toggle">
        <a href="#" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">타임머신<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" data-filter >
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1980</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1981</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1982</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1983</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1984</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1985</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1986</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1987</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1988</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1989</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1990</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2000</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2001</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2002</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2003</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2004</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2005</a></li>
          </ul>
        </li>
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
                   회원이 아니세요? <a href="#" style="text-decoration:none;"><strong style="color: Navy">회원가입</strong></a>
                  </div>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
  </nav>
  <!-- NAVBAR END ================================================== -->

  <!-- MAIN START ================================================== -->
  <div id="pagepiling">
    <!-- Video Page START ================================================== -->
    <div class="section" id="section1">
      <video autoplay loop muted id="video">
        <source src="${pageContext.request.contextPath}/resources/img/1.mp4" type="video/mp4">
      </video>
      <div class="layer">
        <h1 class="text-center">기억하시나요 붉은 함성</h1>
        <h2 class="text-center">Be the Reds</h2>
      </div>
    </div>
    <!-- section2 Page START ================================================== -->
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
              <img src="${pageContext.request.contextPath}/resources/img/1.JPG" alt="" />
              <div class="container">
                <div class="carousel-caption">
                  <h1 class="text-center">Bootstrap Carousel Fullscreen</h1>
                  <p class="text-center">Just turns the Twitter Bootstrap Carousel in fullscreen mode, and scale to fit the screen resolution</p>
                </div>
              </div>
            </div>
            <div class="item">
              <img src="${pageContext.request.contextPath}/resources/img/2.JPG" alt="" />
              <div class="container">
                <div class="carousel-caption">
                  <h1 class="text-center">Bootstrap Carousel Fullscreen</h1>
                  <p class="text-center">Just turns the Twitter Bootstrap Carousel in fullscreen mode, and scale to fit the screen resolution</p>
                </div>
              </div>
            </div>
            <div class="item">
              <img src="${pageContext.request.contextPath}/resources/img/3.JPG" alt="" />
              <div class="container">
                <div class="carousel-caption">
                  <h1 class="text-center">Bootstrap Carousel Fullscreen</h1>
                  <p class="text-center">Just turns the Twitter Bootstrap Carousel in fullscreen mode, and scale to fit the screen resolution</p>
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

    <!-- section3 Page START ================================================== -->
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
              <img src="${pageContext.request.contextPath}/resources/img/4.JPG" alt="" />
              <div class="container">
                <div class="carousel-caption">
                  <h1 class="text-center">Bootstrap Carousel Fullscreen</h1>
                  <p class="text-center">Just turns the Twitter Bootstrap Carousel in fullscreen mode, and scale to fit the screen resolution</p>
                </div>
              </div>
            </div>
            <div class="item">
              <img src="${pageContext.request.contextPath}/resources/img/5.JPG" alt="" />
              <div class="container">
                <div class="carousel-caption">
                  <h1 class="text-center">Bootstrap Carousel Fullscreen</h1>
                  <p class="text-center">Just turns the Twitter Bootstrap Carousel in fullscreen mode, and scale to fit the screen resolution</p>
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
  </div>
  <!-- MAIN END ================================================== -->

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
  
<!--   나중에 처리할 예정
  담당자 : 장현석 
  2016-12-05 -->
<!--   <script>
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
  </script> -->
</body>

</html>
