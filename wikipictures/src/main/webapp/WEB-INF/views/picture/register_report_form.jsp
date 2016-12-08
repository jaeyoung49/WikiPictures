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

  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">신고 / 정정 요청</h4>
      </div>
      <div class="modal-body">
		<form id="report" action="report.do">
		<div class="form-group">
     <img src="${pageContext.request.contextPath}/resources/img/${requestScope.picturevo.path}" 
     	style="height: 200px;">
     </div>
      <div class="caption">
  		<h3>${requestScope.picturevo.keyword}</h3>
		  <div class="form-group">
		  <label for="reportType">유형 : </label>
		  <select name="reportType" class="form-control">
		    <option class="신고요청">신고요청
		      <option class="정정요청">정정요청
		  </select>
		  </div>
		  <div class="form-group">
		  <dl>
			  <dt>내용</dt>
			  <dd>${requestScope.picturevo.authorComment}</dd>
			  			  <dt>촬영일</dt>
			  <dd>${requestScope.picturevo.pictureDate}</dd>
			  			  <dt>장소</dt>
			  <dd>${requestScope.picturevo.pictureSpace}</dd>
			</dl>
  		</div>
	</div>
	  <div class="form-group">
	  <div>
  		<span class="label label-default">사유</span></div>
  		<textarea class="form-control" cols="50" rows="10" name="reportContent" required></textarea></div>
      	<input type="hidden" name="pictureVO.pictureDate" value="${requestScope.picturevo.pictureDate}">
  		<input type="hidden" name="pictureVO.keyword" value="${requestScope.picturevo.keyword}">
		</form>
      </div>
      <div class="modal-footer">
        <a id="reportBtn" class="btn btn-danger btn-lg btn-block" role="button">신고/정정 요청</a>
      </div>
    </div>
  </div>
