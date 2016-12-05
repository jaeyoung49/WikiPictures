<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
report_no, report_type,report_content,report_date,pic_date,keyword
<form method="post" action="#">
<select >
<option class="1">신고요청
<option class="2">정정요청
</select>
<input type="hidden" value="${reportNo}">
<input type="hidden" value="${reportDate}">
<input type="hidden" value="${pictureVO.pictureDate }">
<input type="hidden" value="${pictureVO.keyword }">
타입 : <input type="text">
사유 : <input type="text">
</form>
</body>
</html>