<%@page import="com.company.bin.ProductList"%>
<%@page import="com.company.bin.ReviewsList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<ReviewsList> rList = (ArrayList<ReviewsList>) request.getAttribute("rList");
ProductList p = (ProductList) request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<div class="container mt-5 mb-5">
		<div class="d-flex justify-content-center row">
			<%
			for (int i = 0; i < rList.size(); i++) {
				ReviewsList r = rList.get(i);
			%>
			<div class="col-md-10">
				<div class="row p-2 bg-white border rounded">
					<div class="col-md-3 mt-1">
						<img class="img-fluid img-responsive rounded product-image"
							src="<%=r.getR_url()%>">
					</div>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<%for (int k = 1; k <= r.getR_grade(); k++) {%>
						<span class="bi-star-fill"></span>
						<%} if ( r.getR_grade() % 1 != 0) {%>
						<span class="bi bi-star-half"></span>
						<%} else if(r.getR_grade()!=5){%>
						<span class="bi bi-star"></span>
						<%}for (int k = 1; k < 5 - r.getR_grade(); k++) {%>
						<span class="bi bi-star"></span>
						<%}%>
						<span><%=r.getR_grade() %></span>
					</div>
					<div class="col-md-6 mt-1" style="width: 75%">
						<h5><%=p.getP_name()%></h5>
						<div class="review_rating"></div>
						<div class="mt-1 mb-1 spec-1">
							<span><%=r.getWriter()%>/</span> <span><%=r.getCrdate()%></span>
						</div>
						<p class="text-justify text-truncate para mb-0"><%=r.getR_content()%>
							<br> <br>
						</p>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<script type="text/javascript" src="js/mainJs.js"></script>
</body>
</html>