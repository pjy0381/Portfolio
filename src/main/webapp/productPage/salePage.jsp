<%@page import="com.company.common.MainURL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="js/mainJs.js"></script>
	
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
	<c:set value="<%=MainURL.getM_url() %>" var="mainUrl"/>
	<!-- Section-->
	<section class="py-5" style="float: left;height: auto;">
		<div class="container px-4 px-lg-5 mt-5" style="float: left;height: auto;">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${pList }" var="p" varStatus="i">
				<div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                           <a href="ShopDetails?id=${p.p_id}"><img class="card-img-top" src="${mainUrl }${p.p_url }" alt="..." /></a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">no.${p.p_id}</h5>
                                    
                                    <h5 class="fw-bolder">${p.p_name}
                                    <span id="${p.p_id}"><script type="text/javascript">totalR(${p.p_id})</script></span>
                                    </h5>
                                   
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">${p.p_price }</span>
									<c:set var="num" value="${(p.p_price*(100-p.sale))/100 }"/>
									<fmt:setLocale value="ko_kr"/>
									<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            	<input type="hidden" id="_quantity" value="1" >
                                <button class="btn2 btn-outline-dark mt-auto" onclick="addBasket(${p.p_id})">Add to cart</button>
                            </div>
                        </div>
                    </div>
			</c:forEach>
			</div>
		</div>
	</section>




	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
</body>
</html>


