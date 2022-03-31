<%@page import="oracle.net.aso.p"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>

<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style2.css" type="text/css">
<link rel="stylesheet" href="css/mainStyle.css"  type="text/css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<c:set var="total" value="0"/>
	<header class="header"><jsp:include page="header.jsp" /></header>
	<section style="height: auto; min-height: 1000px;">
	<div class="container">
		<div class="container mt-5 mb-5" style=" padding-top: 100px;">
			<c:forEach items="${basketList }" var="bas" varStatus="i">
				<div class="d-flex justify-content-center row">
					<div class="row p-2 bg-white border rounded">
						<div class="col-md-3 mt-1" style="width: 20%;">
							<img class="img-fluid img-responsive rounded product-image"
								src="${bas.url }">
						</div>
						<div class="col-md-6 mt-1" style="width: 80%; float: left;">
							<table class="table">
								<tr>
									<td style="width: 25%">${bas.name }</td>
									<td style="width: 25%">${bas.size }</td>
									<td style="width: 25%">${bas.quantity }</td>
									<td style="width: 25%">
										<c:set var="num" value="${bas.getPrice()*bas.getQuantity()}"/>
										<c:set var="total" value="${total+num }"/>
										<fmt:setLocale value="ko_kr"/>
										<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div style="disply: none;">
						<form action="NewOrder" id="NewOrder${i.count-1 }" method="post">
							<input type="hidden" value="${id }" id="id${i.count-1 }">
							<input type="hidden" value="${bas.p_id }"  id="p_id${i.count-1 }">
							<input type="hidden" value="${name }"  id="name${i.count-1 }">
							<input type="hidden" value="${bas.name }" id="o_name${i.count-1 }">
							<input type="hidden" value="${phone }"  id="phone${i.count-1 }">
							<input type="hidden" value="${nAd }"  id="nAd${i.count-1 }">
							<input type="hidden" value="${address }"  id="address${i.count-1 }">
							<input type="hidden" value="${dAd }" id="dAd${i.count-1 }">
							<input type="hidden" value="${num }" id="price${i.count-1 }">
						</form>
					</div>
				</div>
			</c:forEach>
			<input type="hidden"  name="payment" id="payment">
			<h5 align="right">
				<fmt:setLocale value="ko_kr"/>
				<fmt:formatNumber value="${total }" groupingUsed="true" type="currency"/>
			</h5>

		</div>
		<div style="padding-top: 50px;">
			<h3>배송지 정보</h3>
			<table class="table" style="text-align: left;">
				<tr>
					<td>받으시는 분:</td>
					<td><input type="text" name="name" value="${name }"
						class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<td>연락처:</td>
					<td><input type="text" name="phone" value="${phone }"
						class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<td>배송 주소:</td>
					<td><input type="text" name="nAd" value="${nad }"
						class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input name="address" type="text" value="${address }"
						class="form-control"></td>
					<td><button class="btn btn-primary"
							onclick="openPopupA('address.jsp'); return false;">검색</button></td>
				</tr>
				<tr>
					<td>상세 주소:</td>
					<td><input type="text" name="dAd" value="${dad }"
						class="form-control"></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px; width: 400px">
			<h3>결제 방법</h3>
			<table class="table" style="text-align: left;">
				<tr>
					<td>신용카드 결제</td>
					<td><input type="radio" name="pay" value="card" onchange="pay();return false;"></td>
				</tr>
				<tr>
					<td>토스</td>
					<td><input type="radio" name="pay" value="toss" onchange="pay();return false;"></td>
				</tr>
				<tr>
					<td>네이버 페이</td>
					<td><input type="radio" name="pay" value="naver" onchange="pay();return false;"></td>
				</tr>
				<tr>
					<td>카카오 페이</td>
					<td><input type="radio" name="pay" value="kakao" onchange="pay();return false;"></td>
				</tr>
			</table>
		</div>
			<div class="row">
				<div class="col-lg-6" style="width: 100%">
					<div class="shoping__checkout" align="left">
						<h5>가격 총합</h5>
						<ul>
							<li>가격 <span id="total">
								<fmt:setLocale value="ko_kr"/>
								<fmt:formatNumber value="${total }" groupingUsed="true" type="currency"/>
							</span></li>
						</ul>
					</div>
				</div>
				<div class="shoping__discount">
					<form action="">
						<a class="site-btn" style="margin: 10px; margin-top: 30px" onclick=" NewOrder(${basketList.size()});return false;">결제하기</a>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer><jsp:include page="footer.jsp" /></footer>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/mainJs.js"></script>
	
</body>
</html>