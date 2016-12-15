<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

<form action ="${pageContext.request.contextPath}/memberSearch.do" id="searchForm">
	아이디 : <input type="text" name="id" id="id" ><br>
	별명 : <input type ="text" name="nickname" id="nickname"><br>
	 <input type ="submit" value="찾기">
</form>
