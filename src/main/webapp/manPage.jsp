<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String categori = (String)request.getAttribute("categori"); 
String url = "man/mainSidebar.jsp";
String gender = "ManP";
if(categori!=null){
	url = "man/"+categori+"Sidebar.jsp";
}
int totalCount = 1;
if (request.getAttribute("totalCount") != null) {
	totalCount = (int) request.getAttribute("totalCount");
}

int pg = 1;
if (request.getParameter("page") != null) {
	pg = Integer.parseInt(request.getParameter("page"));
	
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남성</title>
</head>
	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<body>
<div class="main">
	<header class="header"><jsp:include page="header.jsp"/></header>
	<section class="sideProduct" > <jsp:include page="<%=url %>"/> </section>
	<section style="height: auto; float: left; width: 80%"><jsp:include page="man/manPage.jsp"/>
	</section>
	<div class="paging">
		<jsp:include page="page/getPage.jsp">
			<jsp:param value="<%=totalCount%>" name="totalCount" />
			<jsp:param value="<%=pg%>" name="pg" />
			<jsp:param value="<%=gender%>" name="gender" />
		</jsp:include>
	</div>
	
	<footer><jsp:include page="footer.jsp"/></footer>
</div>
</body>
</html>