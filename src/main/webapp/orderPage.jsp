<%@page import="oracle.net.aso.p"%>
<%@page import="com.company.bin.BasketList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<BasketList> basketList = (ArrayList<BasketList>) session.getAttribute("basketList");
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
String address = (String) session.getAttribute("address");
String nad = (String) session.getAttribute("nad");
String dad = (String) session.getAttribute("dad");
String phone = (String) session.getAttribute("phone");
if (name == null) {
	name = "";
	address = "";
	nad = "";
	dad = "";
	phone = "";
}
%>
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
<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<header class="header"><jsp:include page="header.jsp" /></header>
	<section style="height: auto; min-height: 1000px;">
	<div class="container">
		<div class="container mt-5 mb-5"
			style=" padding-top: 100px; ">
			<%
			if (basketList != null) {
				int total = 0;
				String o_name = "";
				for (int i = 0; i < basketList.size(); i++) {
					BasketList bas = basketList.get(i);
					total += bas.getPrice()*bas.getQuantity();
					o_name += bas.getName()+"("+bas.getSize()+") "+bas.getQuantity()+"개 ";
			%>
			<div class="d-flex justify-content-center row">
				<div class="row p-2 bg-white border rounded">
					<div class="col-md-3 mt-1" style="width: 20%;">
						<img class="img-fluid img-responsive rounded product-image"
							src="<%=bas.getUrl()%>">
					</div>
					<div class="col-md-6 mt-1" style="width: 80%; float: left;">
						<table class="table">
							<tr>
								<td style="width: 25%"><%=bas.getName()%></td>
								<td style="width: 25%"><%=bas.getSize()%></td>
								<td style="width: 25%"><%=bas.getQuantity()%></td>
								<td style="width: 25%">&#8361;<%=bas.getPrice()*bas.getQuantity()%></td>
							</tr>
						</table>
					</div>
				</div>
				<div style="disply: none;">
					<form action="NewOrder" id="NewOrder<%=i %>" method="post">
						<input type="hidden" value="<%=id %>" name="id" id="id<%=i%>">
						<input type="hidden" value="<%=bas.getP_id() %>" name="p_id" id="p_id<%=i%>">
						<input type="hidden" value="<%=name %>" name="name" id="name<%=i%>">
						<input type="hidden" value="<%=bas.getName() %>" name="o_name" id="o_name<%=i%>">
						<input type="hidden" value="<%=phone %>" name="phone" id="phone<%=i%>">
						<input type="hidden" value="<%=nad %>" name="nAd" id="nAd<%=i%>">
						<input type="hidden" value="<%=address %>" name="address" id="address<%=i%>">
						<input type="hidden" value="<%=dad %>" name="dAd" id="dAd<%=i%>">
						<input type="hidden"  name="payment" id="payment" id="payment<%=i%>">
						<input type="hidden" value="<%=bas.getPrice()*bas.getQuantity() %>" name="price" id="price<%=i%>">
					</form>
				</div>
			</div>
			<%
			}
			%>
			<h5 align="right">
				총합: &#8361;<%=total%></h5>

		</div>
		<div style="padding-top: 50px;">
			<h3>배송지 정보</h3>
			<table class="table" style="text-align: left;">
				<tr>
					<td>받으시는 분:</td>
					<td><input type="text" name="name" value="<%=name%>"
						class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<td>연락처:</td>
					<td><input type="text" name="phone" value="<%=phone%>"
						class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<td>배송 주소:</td>
					<td><input type="text" name="nAd" value="<%=nad%>"
						class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input name="address" type="text" value="<%=address%>"
						class="form-control"></td>
					<td><button class="btn btn-primary"
							onclick="openPopupA('address.jsp'); return false;">검색</button></td>
				</tr>
				<tr>
					<td>상세 주소:</td>
					<td><input type="text" name="dAd" value="<%=dad%>"
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
							<li>가격 <span id="total">&#8361;<%=total%></span></li>
						</ul>
					</div>
				</div>
				<div class="shoping__discount">
					<form action="">
						<a class="site-btn" style="margin: 10px; margin-top: 30px" onclick=" NewOrder(<%=basketList.size()%>);return false;">결제하기</a>
					</form>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</section>
	<footer><jsp:include page="footer.jsp" /></footer>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script type="text/javascript" src="js/mainJs.js"></script>
</body>
</html>