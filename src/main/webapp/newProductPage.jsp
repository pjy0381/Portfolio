<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<section class="sideProduct"> <jsp:include page="productSidebar/${categori }Sidebar.jsp"/> </section>
	<section style="height: auto; float: left; width: 80%; " id="se">
		<main class="card-body" style="height: auto; float: left;"><jsp:include page="productPage/newPage.jsp"/></main>
	</section>
	<footer><jsp:include page="footer.jsp"/></footer>
</div>
</body>
</html>