<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<title>신고리스트</title>
</head>	
<body>
<table class="table">

<caption><a href="${pageContext.request.contextPath}/admin/admin.do">관리자 홈으로</a><br>신고리스트</caption>
<tr>
<td class="report_no"><h4>NO</h4></td>
<td class="report_type"><h4>타입</h4></td>
<td class="report_content"><h4>내용</h4></td>
<td class="report_date"><h4>신고날짜</h4></td>
<td class="keyword"><h4>키워드</h4></td>

</tr>
	<c:forEach var="rvo" items="${requestScope.reportVO}" varStatus="status">
<tr>
<td>${status.count}</td>
<td>${rvo.reportType }</td>
<td>${rvo.reportContent }</td>
<td>${rvo.reportDate }</td>
<td>${rvo.pictureVO.keyword}</td>
</tr>
</c:forEach>
</table>

</body>
</html>