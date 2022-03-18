<%@page import="com.company.bin.ProductList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<ProductList> pList = (ArrayList<ProductList>) request.getAttribute("pList");
int totalCount = (int)request.getAttribute("totalCount");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품 검색</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Section-->
	<section class="py-5">
		<h4><%=totalCount %>개의 상품이 검색 되었습니다</h4>
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
				if (pList != null) {
					for (int i = 0; i < pList.size(); i++) {
						ProductList p = pList.get(i);
				%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<a href="ShopDetails?id=<%=p.getP_id()%>">
						<img class="card-img-top"
							src="<%=p.getP_url() %>" alt="..." />
						</a>	
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">no.<%=p.getP_id() %></h5>
								<h5 class="fw-bolder"><%=p.getP_name() %>
									<span id="<%=p.getP_id()%>"><script type="text/javascript">totalR(<%=p.getP_id()%>)</script></span>
								</h5>
								<%if(p.getEvent().equals("yes")){ 
									int price = p.getP_price()*(100-p.getSale())/100;
								%>
								 <span class="text-muted text-decoration-line-through"><%=p.getP_price()%></span>
								 &#8361;<%=price%>
								<%}else{ %>
								&#8361;<%=p.getP_price() %>
								<%} %>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<input type="hidden" id="_quantity" value="1" >
								<button class="btn2 btn-outline-dark mt-auto" onclick="addBasket(<%=p.getP_id()%>)">Add to cart</button>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
			<br>
		</div>
	</section>




	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
</body>
</html>


