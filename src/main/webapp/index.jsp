<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더휴먼 쇼핑몰</title>
	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<c:set var="webApp" value="${param.webApp }"/>
	<c:if test="${webApp == null }">
		<c:set value="mainPage" var="webApp"/>
	</c:if>
<div class="main">
	
	<header class="header"><jsp:include page="header.jsp" /></header>
	<section style="min-height: 1200px; height: auto; "><jsp:include page="${webApp }.jsp" /></section>
	<footer><jsp:include page="footer.jsp"/></footer>
</div>
</body>
</html>