<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/member/update_member_form.do">회원정보수정</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/showMypictureList.do">내가올린사진들보기</a></li>
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/showSecretreplyList.do">시크릿댓글목록보기</a></li>
		<li role="presentation"><a href="${pageContext.request.contextPath}/showBuyList.do">구매내역보기</a></li>
</ul>
<div class="container">
<table class="table table-striped">
		<tr>
			<th class="id">작성자</th>
			<th class="replyDate">시크릿댓글날짜</th>
			<th class="replyContent">시크릿댓글내용</th>
		</tr>
			<c:forEach var="mypageVO" items="${requestScope.svo.list}" varStatus="status">
		<tr>
			<th>${mypageVO.memberVO.id}</th>
			<th>${mypageVO.replyDate}</th>
			<th>${mypageVO.replyContent}</th>
		</tr>					
			</c:forEach>
</table>
	<br><br>	
<p class="paging">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.svo.pagingBean}"></c:set>
	<!-- 
			step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->      
	<c:if test="${pb.previousPageGroup}">
	<a href="${pageContext.request.contextPath}/showSecretreplyList.do?pageNo=${pb.startPageOfPageGroup-1}">
	<!-- <img src="img/left_arrow_btn.gif"> -->
	◀&nbsp; </a>	
	</c:if>
	<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="list.do?pageNo=...">				   
	 -->		
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<a href="${pageContext.request.contextPath}/showSecretreplyList.do?pageNo=${i}">${i}</a> 
	</c:when>
	<c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>	 
	<!-- 
			step3 1) 다음 페이지 그룹이 있으면 이미지(img/right_arrow_btn.gif) 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 -->   
	<c:if test="${pb.nextPageGroup}">
	<a href="${pageContext.request.contextPath}/showSecretreplyList.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶<!-- <img src="img/right_arrow_btn.gif"> --></a>
	</c:if>
	</p>
</div>
