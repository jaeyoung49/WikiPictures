<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
  <li role="presentation"><a href="${pageContext.request.contextPath}/show_member_list.do">회원리스트</a></li>
  <li role="presentation"><a href="${pageContext.request.contextPath}/show_report_list.do">신고리스트</a></li>
  <li role="presentation"><a href="${pageContext.request.contextPath}/show_sell_list.do">판매리스트</a></li>
  <li role="presentation"><a href="${pageContext.request.contextPath}/show_picture_list.do">사진리스트</a></li>
  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/admin/register_ad_form.do">광고</a></li>
</ul>
<div class="container">
  <form id="미정Form" action="${pageContext.request.contextPath}/미정.do" method="post" enctype="multipart/form-data" class="form-horizontal">
    <div class="form-group">
      <label for="category">신고유형</label>
      <select name="category" multiple class="form-control">
        <option value="미정">미정</option>
        <option value="미정">미정</option>
        <option value="미정">미정</option>
        <option value="미정">미정</option>
      </select>
      <br>
    </div>
    <div class="form-group">
      <label for="미정">미정</label>
      <input type="text" name="keyword" class="form-control">
    </div>
    <div class="form-group">
      <label for="미정">미정</label>
      <input class="form-control" id="미정" name="미정" placeholder="년-월-일" type="text" required>
    </div>
    <div class="form-group">
      <label for="미정">미정</label>
      <textarea name="미정" class="form-control" rows="5" id="textArea"></textarea>
    </div>
    <div class="form-group">
      <label for="미정">미정</label>
      <input type="text" name="미정" class="form-control">
    </div>
    <input class="btn btn-default btn-lg btn-block" id="formButton" type="button" value="미정">
  </form>
</div>