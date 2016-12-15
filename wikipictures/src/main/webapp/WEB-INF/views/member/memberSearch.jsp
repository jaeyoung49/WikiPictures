<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	  $("#searchForm").submit(function() {
	    if ($("#searchForm :input[name=id]").val().trim() == "") {
	      alert("아이디를 입력하세요!");
	      return false;
	    }
	    
	    if ($("#searchForm :input[name=nickname]").val().trim() == "") {
	      alert("별명을 입력하세요!");
	      return false;
	    }
      });
});
</script>
<body>
<form action ="${pageContext.request.contextPath}/memberSearch.do" id="searchForm">
	아이디 : <input type="text" name="id" id="id" ><br>
	별명 : <input type ="text" name="nickname" id="nickname"><br>
	 <input type ="submit" value="찾기">
</form>
</body>
</html>