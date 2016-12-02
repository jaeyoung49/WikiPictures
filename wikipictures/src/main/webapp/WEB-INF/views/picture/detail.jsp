<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   
    <%-- <img src="${pageContext.request.contextPath}/resources/img/${requestScope.ppvo.path}"  width="300" height="200"> --%>
    <%-- ${requestScope.pvo.keyword} --%>
    <h3>사진정보</h3>
 <img src="${pageContext.request.contextPath}/resources/img/${requestScope.picturevo.path}"  width="300" height="200">
<br>
촬영일 : ${requestScope.picturevo.pictureDate}<br>
키워드 : ${requestScope.picturevo.keyword}<br>
원작자코멘트 : ${requestScope.picturevo.authorComment}<br>
촬영장소 : ${requestScope.picturevo.pictureSpace}<br>
    
    <h3>해시태그</h3><br>
    <c:forEach items="${requestScope.pvo}" var="pvo">
<a href="${pageContext.request.contextPath}/searchPicture.do?keyword=${pvo.hashtagName}">#${pvo.hashtagName}</a>
 </c:forEach> 