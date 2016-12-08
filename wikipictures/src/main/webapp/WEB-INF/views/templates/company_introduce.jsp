<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$(".menu>a").click(function(){
		var intro = $(this).next("ul");
		if(intro.is(":visible")){
			intro.slideUp();
		}else{
			intro.slideDown();
		}
	});
});
</script>
	<style>
		.menu a {cursor:pointer;}
		.menu .hide{display:none;}
	</style>
	<div class="container">
<h3>WikiPictures</h3><br>
	WikiPictures는 위키피디아에 모티브를 얻어서 설립된 사이트로서, 위키피디아가 지식을<br>
	공유하는 사이트라면 위키픽쳐스는 추억을 공유하는 사이트이다. 각자의 사람들이 추억이<br>
	있었던 장소를 업로드 해서 시대별 장소의 모습을 확인 할 수 있고 여러 종류의 사진을<br>
	서로 공유할 수 있다. 여러분의 추억을 위키픽쳐스에서 공유해주시길 바랍니다.<br>
<br>
Name: Position: Cell Phone: Favorite Space:  <br>
	<img src="${pageContext.request.contextPath}/resources/img/lsh.jpg">
	<img src="${pageContext.request.contextPath}/resources/img/ljy.jpg">
	<img src="${pageContext.request.contextPath}/resources/img/jh.jpg"><br>
	<img src="${pageContext.request.contextPath}/resources/img/jhs.jpg">
	<img src="${pageContext.request.contextPath}/resources/img/mnc.jpg">
	<img src="${pageContext.request.contextPath}/resources/img/dhk.jpg">
<br><br>
</div>