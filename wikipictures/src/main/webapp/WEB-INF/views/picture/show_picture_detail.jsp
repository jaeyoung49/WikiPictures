
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   

    <script type="text/javascript">
    $(document).ready(function() {
      $('#tags').inputTags();
    });
  </script>

   <style>
  
  .hashTag {
    margin: auto;
  }
  
  .hashTag a {
    text-decoration: none;
  }
  </style>
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#addhashtag").click(function(){
		 $("#dataView").html($("#tags").text(val()));
	  });
  });
  </script>

	
    <!-- /#sidebar-wrapper -->
   
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
          <form action="${pageContext.request.contextPath}/addHashtag.do?keyword=${requestScope.picturevo.keyword}&pic_date=${requestScope.picturevo.pictureDate}">
          <div class="form-group">
            해시태그추가
            <br>
            <input type="text" name="tempHashtags" id="tags" placeholder="태그입력후 Enter를 눌러주세요">
          </div>
          <p><a href="searchHashtag.do" class="btn btn-primary" id="addhashtag" role="button">버튼1</a>
            <a href="#" class="btn btn-default" role="button">버튼2</a></p>
            <span id="dataView"></span>
            <input type="submit" value="버튼">
            </form>
        </div>
      </div>
    </div>
  </div>


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
 