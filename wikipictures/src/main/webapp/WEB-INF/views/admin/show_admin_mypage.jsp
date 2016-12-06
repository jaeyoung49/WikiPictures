<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/show_member_list.do">회원리스트</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/show_report_list.do">신고리스트</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/show_sell_list.do">판매리스트</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/show_picture_list.do">사진리스트</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/admin/register_ad_form.do">광고</a></li>
</ul>
관리자 관리 페이지
<br>
<img src="${pageContext.request.contextPath}/resources/img/1.JPG">
<script type="text/javascript">
	$(document).ready(function() {

		$(".myModal").modal("show");
	});
</script>
<!--  <div class="modal fade"> -->
<!-- 모달 -->
<div class="container">
	<a href="#myModal" role="button" class="btn" data-toggle="modal">모달
		시연 시작</a>
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">모달 제목</h3>
		</div>
		<div class="modal-body">
			<p>한 멋진 본문…</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
			<button class="btn btn-primary">변경사항 저장</button>
		</div>
	</div>
</div>
