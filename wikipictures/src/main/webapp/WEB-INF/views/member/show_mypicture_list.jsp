<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/member/update_member_form.do">회원정보수정</a>
	</li>
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/showMypictureList.do">내가올린사진들보기</a>
	</li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/showSecretreplyList.do">시크릿댓글목록보기</a>
	</li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/showBuyList.do">구매내역보기</a></li>
</ul>


<script>
	$(document).ready(function() {
		$('ul.first').bsPhotoGallery({
			"classes" : "col-lg-2 col-md-4 col-sm-3 col-xs-4 col-xxs-12",
			"hasModal" : true,
			"fullHeight" : true
		});
	});
</script>


<div class="container">
	<div class="panel panel-default panel-table">
		<div class="panel-body">
			<div class="container" style="margin-top: 20px;">
				<ul class="row first">
					<c:forEach var="pictureVO" items="${requestScope.pvo.list}" varStatus="status">
						<li><img alt="${pictureVO.authorComment}" src="${pageContext.request.contextPath}/resources/img/${pictureVO.path}">
							<div class="thumbnail">
								<div>${pictureVO.pictureDate}</div>
								<div class="text">
									<a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${pictureVO.pictureDate}&keyword=${pictureVO.keyword}">상세보기</a>
								</div>
								<div>${pictureVO.keyword }</div>
							</div></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>

<%--    <legend>해시태그 : ${pictureVO.keyword}</legend>
        <ul class="row first">
              <c:forEach var="pictureVO" items="${requestScope.pvo.list}" varStatus="status">
            <li>
		<img alt="${pictureVO.authorComment}" src="${pageContext.request.contextPath}/resources/img/${pictureVO.path}">
           <div class="thumbnail">
           <div>${pictureVO.pictureDate}</div>
            <div class="text"> 
           <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${pictureVO.pictureDate}&keyword=${pictureVO.keyword}">상세보기</a>
       </div>
          <div>${pictureVO.keyword }</div>
           </div>
           </li>
        </c:forEach>
 
           </ul> --%>


<div class="panel-footer">
	<div class="container-fluid">
		<c:set var="pb" value="${requestScope.pvo.pagingBean}"></c:set>
		<ul class="pagination active hidden-xs pull-right">
			<c:choose>
				<c:when test="${pb.previousPageGroup}">
					<li><a aria-label="Previous"
						href="${pageContext.request.contextPath}/showMypictureList.do?pageNo=${pb.startPageOfPageGroup-1}">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a aria-label="Previous" href="#"> <span
							aria-hidden="true">&laquo;</span></a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage==i}">
						<li class="active"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="${pageContext.request.contextPath}/showMypictureList.do?pageNo=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pb.nextPageGroup}">
					<li><a aria-label="Next"
						href="${pageContext.request.contextPath}/showMypictureList.do?pageNo=${pb.endPageOfPageGroup+1}">
							<span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a aria-label="Next" href="#"> <span
							aria-hidden="true">&raquo;</span></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>







