<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   

<script type="text/javascript">
	$(document).ready(function() {
	  <%-- 해쉬태그 추가 --%>
	  $("#addhashtag").click(function() {
		  if($("#hashtagForm :input[name=hashtagName]").val()==""){
			  alert("해시태그명 입력후 Enter 해주세요!");
			  return false;
		  }else{
			  
	    $("#hashtagForm").submit();
		  }
	  }); // click
	
	  <%-- 원작자코멘트 수정 --%>
	  if(${sessionScope.mvo.id == requestScope.picturevo.memberVO.id}) {
	    $("#authorComment").next().hide();
	
	    $("#authorComment").click(function() {
	      $(this).next().toggle();
	    });
	    $("#updateAuthorCommentBtn").click(function() {
	      $("#updateAuthorCommentForm").submit();
	    }); // click
	  }
	
	  <%-- 시크릿댓글 등록/수정 --%>
	  if (${requestScope.mypageVO != null}) {
	    $("#secretReply").next().hide();
	
	    $("#secretReply").click(function() {
	      $(this).next().toggle();
	    });
	  }
	  $("#registerSecretReplyBtn").click(function() {
	    $("#registerSecretReplyForm").submit();
	  }); // click
	
	  $("#register_report_formBtn").click(function() {
	    $("#register_report_form").submit();
	  });
	
	  $("#tags").inputTags();
	
	  <%-- 사진구매 --%>
	  $("#buyBtn").click(function() {
	    if (confirm("사진을 구매하시겠습니까?")) {
	      $("#registerBuyForm").submit();
	    }
	  });
	
	  <%-- 사진다운로드 --%>
	  $("#pictureDownloadBtn").click(function() {
	    $("#pictureDownloadForm").submit();
	  });
	
	}); //ready
</script>
</head>

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
        <br>
        <br>
        <blockquote>
          <p>${requestScope.picturevo.authorComment}</p>
          <c:if test="${sessionScope.mvo.id == requestScope.picturevo.memberVO.id}">
            <a href="#" id="authorComment" data-toggle="tooltip" data-placement="top" title="코멘트 수정하기">
              <span class="glyphicon glyphicon-edit text-right" aria-hidden="true"></span></a>
          </c:if>
        </blockquote>
        <hr>
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
              <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          시크릿 댓글</a>
          <c:if test="${sessionScope.mvo!=null&&requestScope.mypageVO!=null}">
          &nbsp;&nbsp;&nbsp;
        <a href="#" id="secretReply" data-toggle="tooltip" data-placement="top" title="댓글 편집하기">
        <span class="glyphicon glyphicon-edit text-right" aria-hidden="true"></span>
        </a>
        </c:if>
      </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                <c:choose>
                  <c:when test="${sessionScope.mvo!=null&&requestScope.mypageVO!=null}">
                    ${requestScope.mypageVO.replyContent}
                  </c:when>
                  <c:otherwise>
                    <a href="#" class="btn btn-default btn-lg btn-block">
        				댓글이 없군요! 당신만의 추억을 기록해보세요 :)</a>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <form id="updateAuthorCommentForm" action="updateAuthorComment.do">
            <p>
              <c:if test="${sessionScope.mvo.id == requestScope.picturevo.memberVO.id}">
                <input type="hidden" name="pictureDate" value="${requestScope.picturevo.pictureDate}">
                <input type="hidden" name="keyword" value="${requestScope.picturevo.keyword}">
                <input type="text" name="authorComment" value="${requestScope.picturevo.authorComment}" placeholder="원작자 코멘트">
                <a class="btn btn-primary" id="updateAuthorCommentBtn" role="button">변경</a>
              </c:if>
            </p>
          </form>
        </div>
        <%-- <c:if test="${sessionScope.mvo!=null&&requestScope.mypageVO!=null}">
            <p id="secretReply">
              시크릿댓글 : ${requestScope.mypageVO.replyContent}
              <!-- 시크릿 댓글 있는 수정 -->
              <c:if test="${sessionScope.mvo.id == requestScope.mypageVO.memberVO.id}">
                  (변경하려면 클릭!)
              </c:if>
            </p>
          </c:if> --%>
          <!-- 시크릿 댓글 작성 -->
          <c:if test="${sessionScope.mvo.id != null}">
            <div class="form-group">
              <form id="registerSecretReplyForm" action="registerSecretReply.do">
                <p>
                  <input type="hidden" name="memberVO.id" value="${sessionScope.mvo.id}">
                  <input type="hidden" name="pictureVO.pictureDate" value="${requestScope.picturevo.pictureDate}">
                  <input type="hidden" name="pictureVO.keyword" value="${requestScope.picturevo.keyword}">
                  <c:choose>
                    <c:when test="${requestScope.mypageVO==null}">
                      <input type="text" name="replyContent" placeholder="시크릿댓글">
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
            <c:if test="${sessionScope.mvo.id != null}">
              <c:choose>
                <c:when test="${requestScope.mypageVO.buyDate==null && sessionScope.mvo.id != requestScope.picturevo.memberVO.id}">
                  <a href="#" id="buyBtn" class="btn btn-info">사진구매</a>
                </c:when>
                <c:otherwise>
                  <a href="${pageContext.request.contextPath}/fileDownload.do?fileName=${requestScope.picturevo.path}" id="buyBtn" class="btn btn-info">사진다운로드</a>
                </c:otherwise>
              </c:choose>
            </c:if>
            <a href="#" class="btn btn-info" id="register_report_formBtn" role="button" data-toggle="modal" data-target="#reportModal">신고/정정 요청</a>
          </div>
          <c:if test="${sessionScope.mvo.id != null}">
            <c:choose>
              <c:when test="${requestScope.mypageVO.buyDate==null && sessionScope.mvo.id != requestScope.picturevo.memberVO.id}">
                <form id="registerBuyForm" action="registerBuy.do">
                  <input type="hidden" name="memberVO.id" value="${sessionScope.mvo.id}">
                  <input type="hidden" name="pictureVO.pictureDate" value="${requestScope.picturevo.pictureDate}">
                  <input type="hidden" name="pictureVO.keyword" value="${requestScope.picturevo.keyword}">
                </form>
              </c:when>
              <c:otherwise>
                <form id="pictureDownloadForm" action="#">
                  <input type="hidden" name="memberVO.id" value="${sessionScope.mvo.id}">
                  <input type="hidden" name="pictureVO.pictureDate" value="${requestScope.picturevo.pictureDate}">
                  <input type="hidden" name="pictureVO.keyword" value="${requestScope.picturevo.keyword}">
                </form>
              </c:otherwise>
            </c:choose>
          </c:if>
      </div>
    </div>
  </div>
</div>

<!-- 신고/정정 요청 모달 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <c:import url="../picture/register_report_form.jsp" />
</div>
<!-- TagCloud!! -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.tagcloud.js"></script>

<script>
	//	TagCloud
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
	
	// 말풍선
	$(function() {
	  $('[data-toggle="tooltip"]').tooltip()
	})
</script>

   
 