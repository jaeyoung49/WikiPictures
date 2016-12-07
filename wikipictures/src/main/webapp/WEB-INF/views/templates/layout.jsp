<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
	<!-- Header import START ================================================== -->
	<c:import url ="header_import.jsp"/>
	<!-- Header import END ================================================== -->
<title><tiles:insertAttribute name="title" ignore="true"/></title>
</head>
<body>
	<!-- NAVBAR START ================================================== -->
	<div id="header"><tiles:insertAttribute name="header" ignore="true"/></div>
	<!-- NAVBAR END ================================================== -->
	
	<!-- MAIN START ================================================== -->
	<div id="main"><tiles:insertAttribute name="main" ignore="true"/></div>
	<!-- MAIN END ================================================== -->
	
	<!-- FOOTER START ================================================== -->
	<div id="footer"><tiles:insertAttribute name="footer" ignore="true"/></div>
	<!-- FOOTER END ================================================== -->
	
	<!-- Footer import START ================================================== -->
	<c:import url ="footer_import.jsp"/>
	<!-- Footer import END ================================================== -->
</body>
</html>