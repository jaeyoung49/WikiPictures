<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
  <li role="presentation"><a href="${pageContext.request.contextPath}/show_member_list.do">회원리스트</a></li>
  <li role="presentation"><a href="${pageContext.request.contextPath}/show_report_list.do">신고리스트</a></li>
  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/show_sell_list.do">판매리스트</a></li>
  <li role="presentation"><a href="${pageContext.request.contextPath}/show_picture_list.do">사진리스트</a></li>
  <li role="presentation"><a href="${pageContext.request.contextPath}/admin/register_ad_form.do">광고등록</a></li>
</ul>
<div class="container">
  <div class="panel panel-default panel-table">
    <div class="panel-body">
      <table class="table table-hover table-bordered table-list">
        <thead>
          <tr class="active">
            <th>NO</th>
            <th>아이디</th>
            <th>촬영일시</th>
            <th>키워드</th>
            <th>판매날짜</th>
          </tr>
        </thead>
        <c:forEach items="${sellList.list}" var="list">
          <tbody>
            <tr>
              <td>${list.rowNumber}</td>
              <td>${list.memberVO.id}</td>
              <td>${list.pictureVO.pictureDate}</td>
              <td>${list.pictureVO.keyword}</td>
              <td>${list.buyDate}</td>
            </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="panel-footer">
      <div class="container-fluid">
        <c:set var="pb" value="${requestScope.sellList.pagingBean}"></c:set>
        <ul class="pagination active hidden-xs pull-right">
          <c:choose>
            <c:when test="${pb.previousPageGroup}">
              <li>
                <a aria-label="Previous" href="${pageContext.request.contextPath}/show_sell_list.do?pageNo=${pb.startPageOfPageGroup-1}">
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
                <li><a href="${pageContext.request.contextPath}/show_sell_list.do?pageNo=${i}">${i}</a></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
          <c:choose>
            <c:when test="${pb.nextPageGroup}">
              <li>
                <a aria-label="Next" href="${pageContext.request.contextPath}/show_sell_list.do?pageNo=${pb.endPageOfPageGroup+1}">
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
