<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
  <li role="presentation">
  	<a href="${pageContext.request.contextPath}/member/update_member_form.do">회원정보수정</a>
  </li>
  <li role="presentation">
  	<a href="${pageContext.request.contextPath}/showMypictureList.do">내가올린사진들보기</a>
  </li>
  <li role="presentation" class="active">
  	<a href="${pageContext.request.contextPath}/showSecretreplyList.do">시크릿댓글목록보기</a>
  </li>
  <li role="presentation">
  	<a href="${pageContext.request.contextPath}/showBuyList.do">구매내역보기</a>
  </li>
</ul>

<div class="container">
  <div class="panel panel-default panel-table">
    <div class="panel-body">
      <table class="table table-hover table-bordered table-list">
        <thead>
          <tr class="active">
            <th>작성자</th>
            <th>시크릿댓글날짜</th>
            <th>시크릿댓글내용</th>
          </tr>
        </thead>
        <c:forEach var="mypageVO" items="${requestScope.svo.list}" varStatus="status">
          <tbody>
            <tr>
              <td>${mypageVO.memberVO.id}</td>
              <td>${mypageVO.replyDate}</td>
              <td>
                <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${mypageVO.pictureVO.pictureDate}&keyword=${mypageVO.pictureVO.keyword}">
                  ${mypageVO.replyContent}
                </a>
              </td>
            </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="panel-footer">
      <div class="container-fluid">
        <c:set var="pb" value="${requestScope.svo.pagingBean}"></c:set>
        <ul class="pagination active hidden-xs pull-right">
          <c:choose>
            <c:when test="${pb.previousPageGroup}">
              <li>
                <a aria-label="Previous" href="${pageContext.request.contextPath}/showSecretreplyList.do?pageNo=${pb.startPageOfPageGroup-1}">
                  <span aria-hidden="true">&laquo;</span></a>
              </li>
            </c:when>
            <c:otherwise>
              <li class="disabled">
                <a aria-label="Previous" href="#">
                  <span aria-hidden="true">&laquo;</span></a>
              </li>
            </c:otherwise>
          </c:choose>
          <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
            <c:choose>
              <c:when test="${pb.nowPage==i}">
                <li class="active"><a href="#">${i}</a></li>
              </c:when>
              <c:otherwise>
                <li><a href="${pageContext.request.contextPath}/showSecretreplyList.do?pageNo=${i}">${i}</a></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
          <c:choose>
            <c:when test="${pb.nextPageGroup}">
              <li>
                <a aria-label="Next" href="${pageContext.request.contextPath}/showSecretreplyList.do?pageNo=${pb.endPageOfPageGroup+1}">
                  <span aria-hidden="true">&raquo;</span></a>
              </li>
            </c:when>
            <c:otherwise>
              <li class="disabled">
                <a aria-label="Next" href="#">
                  <span aria-hidden="true">&raquo;</span></a>
              </li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </div>
</div>

