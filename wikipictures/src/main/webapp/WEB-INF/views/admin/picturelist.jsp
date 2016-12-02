<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<title>사진리스트</title>
</head>
<body>
<table class="table">

<caption><a href="${pageContext.request.contextPath}/admin/admin.do">관리자 홈으로</a><br>회원리스트</caption>
<tr>
<td class="no"><h4>NO</h4></td>
<td class="id"><h4>아이디</h4></td>
<td class="nickname"><h4>촬영일자</h4></td>
<td class="birth"><h4>키워드</h4></td>
<td class="fav_space"><h4>조회수</h4></td>
</tr>
	<c:forEach var="pvo" items="${requestScope.pictureVO}" varStatus="status">
<tr>
<td>${status.count}</td>
<td>${pvo.memberVO.id }</td>
<td>${pvo.pictureDate }</td>
<td>${pvo.keyword }</td>
<td>${pvo.hits }</td>
</tr>
</c:forEach>
</table>
</body>
</html>