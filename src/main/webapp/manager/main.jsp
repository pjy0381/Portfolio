<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid px-4">
		<h1 class="mt-4">수익 현황</h1>
		<div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area me-1"></i> 일 매출
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 월 매출
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 주문 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>주문 번호</th>
							<th>상품</th>
							<th>주문자</th>
							<th>가격</th>
							<th>주문 방법</th>
							<th>주문 날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${oList }" var="order" varStatus="i">
						<tr>
							<td>${order.o_id }</td>
							<td><a href="ShopDetails?id=${order.p_id }" style="text-decoration: none; color: black;">${order.o_name }</a></td>
							<td>${order.o_name }</td>
							<td>${order.price }</td>
							<td>${order.pay }</td>
							<td>${order.pdate }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>