<%@page import="com.company.bin.ReviewsList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.bin.ProductList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
double avgG = (double) request.getAttribute("avgG");
ProductList p = (ProductList) request.getAttribute("p");
ArrayList<ReviewsList> rList = (ArrayList<ReviewsList>) request.getAttribute("rList");
int price = p.getP_price() * (100 - p.getSale()) / 100;
double number = Math.round((avgG * 100));
String id = (String)session.getAttribute("id");
int p_id = Integer.parseInt(request.getParameter("id")) ;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title><%=p.getP_name()%></title>


<!-- Css Styles -->
<link rel="stylesheet" href="css/mainStyle.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style2.css" type="text/css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">


<script type="text/javascript" src="js/mainJs.js"></script>	
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>

	<header class="header"><jsp:include page="header.jsp" />
	</header>

	<!-- Product Details Section Begin -->
	<section class="product-details spad"
		style="height: auto; padding-bottom: 250px">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="<%=p.getP_url()%>" alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
							<img data-imgbigurl="<%=p.getP_url()%>" src="<%=p.getP_url()%>"
								alt=""> <img data-imgbigurl="<%=p.getP_url()%>"
								src="<%=p.getP_url()%>" alt=""> <img
								data-imgbigurl="<%=p.getP_url()%>" src="<%=p.getP_url()%>"
								alt=""> <img data-imgbigurl="<%=p.getP_url()%>"
								src="<%=p.getP_url()%>" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<div class="text-center">
							<h3><%=p.getP_name()%></h3>
							<div
								class="d-flex justify-content-center small text-warning mb-2"
								onloadstart="totalR(<%=p.getP_id()%>)">
								<%
								for (int k = 1; k <= avgG; k++) {
								%>
								<span class="bi-star-fill"></span>
								<%
								}
								if (avgG % 1 != 0) {
								%>
								<span class="bi bi-star-half"></span>
								<%
								} else  if(avgG!=5){
								%>
								<span class="bi bi-star"></span>
								<%
								for (int k = 1; k < 5 - avgG; k++) {
								%>
								<span class="bi bi-star"></span>
								<%
								}
								}
								%>
								<span><%=number / 100%></span> <span>(<%=rList.size()%>
									reviews)
								</span>
							</div>
						</div>
						<div class="product__details__price">
							<%
							if (p.getEvent().equals("yes")) {
							%>&#8361;<%=price%>
							<%
							} else {
							%>&#8361;<%=p.getP_price()%>
							<%
							}
							%>
						</div>
						<p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar
							a. Vestibulum ac diam sit amet quam vehicula elementum sed sit
							amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet
							quam vehicula elementum sed sit amet dui. Proin eget tortor
							risus.</p>
						<select class="primary-btn" id="_size"> 
								<option selected>사이즈 선택</option> 
								<option value="S">S</option> 
								<option value="M">M</option> 
								<option value="L">L</option> 
								<option value="XL">XL</option> 
							</select> 
							
						<div class="product__details__quantity" >
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1" id="_quantity">
								</div>
							</div>
						</div>
						<a  class="primary-btn" onclick="addBasket(<%=p.getP_id()%>)">ADD TO CARD</a> <a href="#"
							class="heart-icon" onclick="pick('<%=id%>',<%=p_id%>)"><span class="bi bi-heart-fill" id="heart"></span></a>
					</div>
				</div>
				
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(<%=rList.size()%>)
								</span></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Products Infomation</h6>
									<p>Vestibulum ac diam sit amet quam vehicula elementum sed
										sit amet dui. Pellentesque in ipsum id orci porta dapibus.
										Proin eget tortor risus. Vivamus suscipit tortor eget felis
										porttitor volutpat. Vestibulum ac diam sit amet quam vehicula
										elementum sed sit amet dui. Donec rutrum congue leo eget
										malesuada. Vivamus suscipit tortor eget felis porttitor
										volutpat. Curabitur arcu erat, accumsan id imperdiet et,
										porttitor at sem. Praesent sapien massa, convallis a
										pellentesque nec, egestas non nisi. Vestibulum ac diam sit
										amet quam vehicula elementum sed sit amet dui. Vestibulum ante
										ipsum primis in faucibus orci luctus et ultrices posuere
										cubilia Curae; Donec velit neque, auctor sit amet aliquam vel,
										ullamcorper sit amet ligula. Proin eget tortor risus.</p>
									<p>Praesent sapien massa, convallis a pellentesque nec,
										egestas non nisi. Lorem ipsum dolor sit amet, consectetur
										adipiscing elit. Mauris blandit aliquet elit, eget tincidunt
										nibh pulvinar a. Cras ultricies ligula sed magna dictum porta.
										Cras ultricies ligula sed magna dictum porta. Sed porttitor
										lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh
										pulvinar a. Vestibulum ac diam sit amet quam vehicula
										elementum sed sit amet dui. Sed porttitor lectus nibh.
										Vestibulum ac diam sit amet quam vehicula elementum sed sit
										amet dui. Proin eget tortor risus.</p>
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<p><jsp:include page="reviews.jsp" /></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->
	<footer><jsp:include page="footer.jsp" />
	</footer>

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>


</body>

</html>