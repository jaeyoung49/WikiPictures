<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
	<!-- 헤더 import START ================================================== -->
	<div id="headerImport"><tiles:insertAttribute name="headerImport" ignore="true"/></div>
	<!-- 헤더 import END ================================================== -->
	<!-- NAVBAR START ================================================== -->
	<div id="header"><tiles:insertAttribute name="header" ignore="true"/></div>
	<!-- NAVBAR END ================================================== -->
	
	<!-- MAIN START ================================================== -->
	<div id="main"><tiles:insertAttribute name="main"   ignore="true"/></div>
	<!-- MAIN END ================================================== -->
	
	<!-- FOOTER START ================================================== -->
	<div id="footer"><tiles:insertAttribute name="footer"  ignore="true"/></div>
	<!-- FOOTER END ================================================== -->
	
	<!-- Footer import START ================================================== -->
	<div id="footerImport"><tiles:insertAttribute name="footerImport" ignore="true"/></div>
	<!-- 헤더 import END ================================================== -->
</body>
</html>