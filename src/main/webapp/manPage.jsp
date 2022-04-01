<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남성</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/mainJs.js"></script>
</head>
	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<body>
<div class="main">
	<c:if test="${totalCount == null }">
		<c:set value="1" var="totalCount"/>
	</c:if>
	<c:set value="${param.page }" var="pg"/>
	<c:if test="${pg == null }">
		<c:set value="1" var="pg"/>
	</c:if>
	<header class="header"><jsp:include page="header.jsp"/></header>
	<section class="sideProduct" > <jsp:include page="productSidebar/${categori }Sidebar.jsp"/> </section>
	<section style="height: auto; float: left; width: 80%; " id="se">
		<main class="card-body" style="height: auto; float: left;"><jsp:include page="productPage/manPage.jsp"/></main>
		<div class="paging">
		<jsp:include page="page/getPage.jsp">
			<jsp:param value="${totalCount }" name="totalCount" />
			<jsp:param value="${pg }" name="pg" />
		</jsp:include>
	</div>
	</section>

	<footer><jsp:include page="footer.jsp"/></footer>
	
</div>
</body>
</html>