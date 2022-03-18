<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String categori = (String)request.getAttribute("categori"); 
String url = "newP/mainSidebar.jsp";
if(categori!=null){
	url = "newP/"+categori+"Sidebar.jsp";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신상품 목록</title>
</head>
	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<body>
<div class="main">
	<header class="header"><jsp:include page="header.jsp"/></header>
	<section class="sideProduct"> <jsp:include page="<%=url %>"/> </section>
	<section style="height: auto; float: left; width: 80%"><jsp:include page="newP/newPage.jsp"/></section>
	<footer><jsp:include page="footer.jsp"/></footer>
</div>
</body>
</html>