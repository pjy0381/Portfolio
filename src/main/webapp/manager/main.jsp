<%@page import="com.company.bin.OrderList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<OrderList> oList = (ArrayList<OrderList>) request.getAttribute("oList");
%>
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
						<%
						if (oList != null) {
							for (int i = 0; i < oList.size(); i++) {
								OrderList order = oList.get(i);
						%>
						<tr>
							<td><%=order.getO_id()%></td>
							<td><a href="ShopDetails?id=<%=order.getP_id()%>" style="text-decoration: none; color: black;"><%=order.getO_name()%></a></td>
							<td><%=order.getName() %></td>
							<td><%=order.getPrice() %></td>
							<td><%=order.getPay() %></td>
							<td><%=order.getPdate() %></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>