<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<title>관리자 페이지</title>
</head>
<body>

관리자 관리 페이지<br>
<a href="${pageContext.request.contextPath}/show_member_list.do">회원리스트</a><br>
<a href="${pageContext.request.contextPath}/show_report_list.do">신고리스트</a><br>
<a href="${pageContext.request.contextPath}/show_sell_list.do">판매리스트</a><br>
<a href="${pageContext.request.contextPath}/show_picture_list.do">사진리스트</a><br>
<a href="${pageContext.request.contextPath}/admin/register_ad_form.do">광고</a><!-- 2차구현 -->
</body>
</html>