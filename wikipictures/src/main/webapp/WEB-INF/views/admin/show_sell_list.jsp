<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
    <li role="presentation"><a href="${pageContext.request.contextPath}/show_member_list.do">회원리스트</a></li>
    <li role="presentation"><a href="${pageContext.request.contextPath}/show_report_list.do">신고리스트</a></li>
    <li role="presentation"><a href="${pageContext.request.contextPath}/show_sell_list.do">판매리스트</a></li>
    <li role="presentation"><a href="${pageContext.request.contextPath}/show_picture_list.do">사진리스트</a></li>
    <li role="presentation"><a href="${pageContext.request.contextPath}/admin/register_ad_form.do">광고</a></li>
  </ul>
<table class="table">
		<caption>
			<a href="${pageContext.request.contextPath}/admin/show_admin_mypage.do">관리자
				홈으로</a><br>판매리스트
		</caption>
		<tr>
			<td class="no"><h4>NO</h4></td>
			<td class="id"><h4>아이디</h4></td>
			<td class="nickname"><h4>촬영일시</h4></td>
			<td class="birth"><h4>키워드</h4></td>
			<td class="fav_space"><h4>구매날짜</h4></td>
		</tr>
		
		<c:forEach items="${sellList.list }" var="list" >
			<tr>
				<td>${list.rowNumber}</td>
				<td>${list.memberVO.id }</td>
				<td>${list.pictureVO.pictureDate }</td>
				<td>${list.pictureVO.keyword}</td>
				<td>${list.buyDate}</td>
			</tr>
		</c:forEach>

	</table>
	<p class="paging">
		<!-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. -->
		<c:set var="pb" value="${requestScope.sellList.pagingBean}"></c:set>
		<!-- 
			step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->
		<c:if test="${pb.previousPageGroup}">
			<a
				href="${pageContext.request.contextPath}/show_sell_list.do?pageNo=${pb.startPageOfPageGroup-1}">
				<!-- <img src="img/left_arrow_btn.gif"> --> ◀&nbsp;
			</a>
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
					<a
						href="${pageContext.request.contextPath}/show_sell_list.do?pageNo=${i}">${i}</a>
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
			<a
				href="${pageContext.request.contextPath}/show_sell_list.do?pageNo=${pb.endPageOfPageGroup+1}">
				▶<!-- <img src="img/right_arrow_btn.gif"> -->
			</a>
		</c:if>
	</p>
