<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function() {
  $("#reportBtn").click(function() {
    $("#report").submit();
  });
});
</script>
<!--  -->
<div style="width:300px; height:auto; margin:0 auto; border:1px solid white;">
<img src="${pageContext.request.contextPath}/resources/img/${requestScope.picturevo.path}" style="max-width: =200px; height: 200px;">
<div class="caption">
  <h3>제목 : ${requestScope.picturevo.keyword}</h3>
  <p>내용 : ${requestScope.picturevo.authorComment}</p>
  <p>촬영일 : ${requestScope.picturevo.pictureDate}</p>
  <div class="form-group">
  </div>
  <p>장소 : ${requestScope.picturevo.pictureSpace}</p>
</div>
<form id="report" action="report.do">
  타입 :
  <select name="reportType">
    <option class="신고요청">신고요청
      <option class="정정요청">정정요청
  </select>
  <br>
  <br> 사유 :
  <br>
  <!-- <input type="text" name="reportContent"> -->
  <textarea cols="50" rows="10" name="reportContent"></textarea>
  <input type="hidden" name="pictureVO.pictureDate" value="${requestScope.picturevo.pictureDate}">
  <input type="hidden" name="pictureVO.keyword" value="${requestScope.picturevo.keyword}">
  <p class="text-right"><a id="reportBtn" class="btn btn-primary" role="button">신고/정정 요청</a></p>
</form>
</div>
