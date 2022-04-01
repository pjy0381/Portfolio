<%@page import="com.company.common.MainURL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${p.p_name }</title>


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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body onload="pickView('${sessionScope.id }',${p.p_id })">

	<header class="header"><jsp:include page="header.jsp" />
	</header>
	<c:set value="<%=MainURL.getM_url() %>" var="mainUrl"/>
	<!-- Product Details Section Begin -->
	<section class="product-details spad"
		style="height: auto; padding-bottom: 250px">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${mainUrl }${p.p_url }" alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
						<c:forEach items="${iList }" var="img" >
							<img data-imgbigurl="${mainUrl }${img.url }" src="${mainUrl }${img.url }" alt=""> 
						</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<div class="text-center">
							<h3>${p.p_name }</h3>
							<div class="d-flex justify-content-center small text-warning mb-2" onloadstart="totalR(${p.p_id });">
								<c:forEach begin="1" end="${avgG }" step="1" var="k">
									<span class="bi-star-fill"></span>
								</c:forEach>
								<c:if test="${avgG % 1 != 0 }"><span class="bi bi-star-half"></span></c:if>
								<c:forEach begin="1" end="${5 - Math.ceil(avgG) }" step="1" var="k">
									<span class="bi bi-star"></span>
								</c:forEach>
								<span>${Math.round((avgG * 100))/100 }</span> <span>(${rList.size() }reviews)</span>
							</div>
						</div>
						<div class="product__details__price">
							<c:set var="num" value="${p.p_price }"/>
							<c:if test="${p.event == 'yes' }">
								<c:set var="num" value="${p.p_price  * (100 - p.sale) / 100}"/>
							</c:if>
							<fmt:setLocale value="ko_kr"/>
							<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
						</div>
						<p>${p.p_info }</p>
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
						<a  class="primary-btn" onclick="addBasket(${p.p_id })">ADD TO CARD</a> <a href="#"
							class="heart-icon" onclick="pick('${sessionScope.id }',${p.p_id },'${p.p_name }')"><span class="bi bi-heart-fill" id="heart"></span></a>
					</div>
				</div>
				
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">상세 설명</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">리뷰 <span>(${rList.size() })
								</span></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<p>
									<c:forEach items="${iList }" var="img" >
										<img src="${mainUrl }${img.url }" alt=""> 
									</c:forEach>
									</p>
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