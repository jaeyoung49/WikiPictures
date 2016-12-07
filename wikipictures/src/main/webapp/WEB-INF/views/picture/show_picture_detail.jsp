<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   

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
    	<%-- 해쉬태그 추가 --%>
		$("#addhashtag").click(function(){
			$("#hashtagForm").submit();
		}); // click
		
		<%-- 원작자코멘트 수정 --%>
		if(${sessionScope.mvo.id == requestScope.picturevo.memberVO.id}){
		  $("#authorComment").next().hide();
		  
		  $("#authorComment").click(function(){
			  $(this).next().toggle();
		  });
		  $("#updateAuthorCommentBtn").click(function(){
			  $("#updateAuthorCommentForm").submit();
		  }); // click
		}
		
		<%-- 시크릿댓글 등록/수정 --%>
		if(${requestScope.mypageVO != null}){
			$("#secretReply").next().hide();
			
			$("#secretReply").click(function(){
				$(this).next().toggle();
			});
		}
		$("#registerSecretReplyBtn").click(function(){
			$("#registerSecretReplyForm").submit();
		}); // click
		  
		$("#register_report_formBtn").click(function(){
			$("#register_report_form").submit();
		});
		
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
    <!-- /#sidebar-wrapper -->
   
  <div class="row">
    <div class="container">
      <div class="thumbnail"> 
        <img src="${pageContext.request.contextPath}/resources/img/${requestScope.picturevo.path}"
         >
        <div class="caption">
          <h3>제목 : ${requestScope.picturevo.keyword}</h3>
          <p id="authorComment">
            내용 : ${requestScope.picturevo.authorComment}
            <c:if test="${sessionScope.mvo.id == requestScope.picturevo.memberVO.id}">
              (변경하려면 클릭!)
            </c:if>
          </p>
          <div class="form-group">
            <form id="updateAuthorCommentForm" action="updateAuthorComment.do">
              <p>
                <c:if test="${sessionScope.mvo.id == requestScope.picturevo.memberVO.id}">
                  <input type="hidden" name="pictureDate" value="${requestScope.picturevo.pictureDate}">
                  <input type="hidden" name="keyword" value="${requestScope.picturevo.keyword}">
                  <input type="text" name="authorComment" value="${requestScope.picturevo.authorComment}">
                  <a class="btn btn-primary" id="updateAuthorCommentBtn" role="button">변경</a>
                </c:if>
              </p>
            </form>
          </div>
          <c:if test="${sessionScope.mvo!=null&&requestScope.mypageVO!=null}">
            <p id="secretReply">
              시크릿댓글 : ${requestScope.mypageVO.replyContent }
                <c:if test="${sessionScope.mvo.id == requestScope.mypageVO.memberVO.id}">
                  (변경하려면 클릭!)
                </c:if>
            </p>
          </c:if>
          <c:if test="${sessionScope.mvo.id != null}">
            <div class="form-group">
              <form id="registerSecretReplyForm" action="registerSecretReply.do">
                <p>
                  <input type="hidden" name="memberVO.id" value="${sessionScope.mvo.id}">
                  <input type="hidden" name="pictureVO.pictureDate" value="${requestScope.picturevo.pictureDate}">
                  <input type="hidden" name="pictureVO.keyword" value="${requestScope.picturevo.keyword}">
                  <c:choose>
                    <c:when test="${requestScope.mypageVO==null }">
	                  <input type="text" name="replyContent" value="나만의 새로운 코멘트를 등록해보세요!">
	                </c:when>
	                <c:otherwise>
	                  <input type="text" name="replyContent" value="${requestScope.mypageVO.replyContent }">
	                </c:otherwise>
                  </c:choose>
                  <a class="btn btn-primary" id="registerSecretReplyBtn" role="button">등록/변경</a>
                </p>
              </form>
            </div>
          </c:if>
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
            <div class="input-group">
          		<input type="text" name="hashtagName" id="tags" class="form-control" required>  
      			<a class="btn btn-primary" id="addhashtag" role="button">추가</a>
  			 </div>
             <input type="hidden" name="pictureDate" value="${requestScope.picturevo.pictureDate}">
             <input type="hidden" name="keyword" value="${requestScope.picturevo.keyword}">
          </div>
          </form>
           <form id="register_report_form" action="register_report_form.do">
               <input type="hidden" name="pictureDate" value="${requestScope.picturevo.pictureDate}">
             <input type="hidden" name="keyword" value="${requestScope.picturevo.keyword}">
         <p class="text-right"><a id="register_report_formBtn" class="btn btn-primary" role="button">신고/정정 요청</a></p>
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
 