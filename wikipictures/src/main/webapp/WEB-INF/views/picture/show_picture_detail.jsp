<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   

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


</head>
    <!-- /#sidebar-wrapper -->
 <div class="container" style="margin-top:20px;">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="thumbnail">
          <img src="${pageContext.request.contextPath}/resources/img/${requestScope.picturevo.path}">
        </div>
        <div class="caption">
       <h2> ${requestScope.picturevo.keyword}</h2>
  			<span class="badge">${requestScope.picturevo.pictureDate}</span>
  			<span class="badge">${requestScope.picturevo.pictureSpace}</span>
       <hr>
          <p id="authorComment">
            <h5>${requestScope.picturevo.authorComment}</h5>
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
          <div class="form-group">
            <div id="tagcloud">
              <!-- rel은 글씨 크기를 좌우한다 -->
              <c:forEach items="${requestScope.pvo}" var="pvo">
            <a href="${pageContext.request.contextPath}/searchPicture.do?keyword=${pvo.hashtagName}" rel="${pvo.hashtagCount}">#${pvo.hashtagName}</a>
              </c:forEach> 
            </div>
          </div>
          <form id="hashtagForm" action="addHashtag.do">
          <div class="form-group">
             <label for="hashtagName">해시태그 (입력 후 엔터를 눌러주세요! 최대 6개:)</label>
          	 <input type="text" name="hashtagName" id="tags" class="form-control" required>  
             <input type="hidden" name="pictureDate" value="${requestScope.picturevo.pictureDate}">
             <input type="hidden" name="keyword" value="${requestScope.picturevo.keyword}">
          </div>
          </form>
             <input type="hidden" name="pictureDate" value="${requestScope.picturevo.pictureDate}">
             <input type="hidden" name="keyword" value="${requestScope.picturevo.keyword}">
             <div class="btn-group btn-group-justified">
  				<a href="#" class="btn btn-info" id="addhashtag">해시태그추가</a>
  				<a href="#" class="btn btn-info">원본구매하기</a>
  				<a href="#" class="btn btn-info">다운로드</a>
			    <a href="#" class="btn btn-info" id="register_report_formBtn" role="button"
			    data-toggle="modal" data-target="#reportModal">신고/정정 요청</a>
			</div>
        </div>
      
    </div>
</div>
</div>

<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" >
	<c:import url ="../picture/register_report_form.jsp"/>
</div>

  <!-- TagCloud!! -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.tagcloud.js"></script>
    <script>
    $("#tagcloud a").tagcloud({
      size: {
        start: 20,
        end: 50,
        unit: "px"
      },
      color: {
        start: '#3498DB',
        end: '#46CFB0'
      }
    });
    </script>
   
 