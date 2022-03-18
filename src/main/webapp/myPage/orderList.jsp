<%@page import="java.util.Date"%>
<%@page import="com.company.bin.OrderList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<OrderList> oList = (ArrayList<OrderList>) request.getAttribute("oList");
Date date = new	Date();
date.setDate(date.getDate()-14);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th style="width: 50%">주문내역</th>
				<th>가격</th>
				<th>배송 상태</th>
				<th>구매자</th>
				<th>리뷰</th>
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
			<td><a href="ShopDetails?id=<%=order.getP_id()%>"><%=order.getO_name()%></a></td>
			<td><%=order.getPrice()%></td>
			<td><%=order.getState()%></td>
			<td><%=order.getName()%></td>
			<td>
			<%if(order.getReview().equals("no")){ 
				if(order.getPdate().compareTo(date)==1)
			%>
			<%if(order.getPdate().compareTo(date)==1){%>
				<a>리뷰 작성</a>
				<%}else{ %>
				기간초과
			<%}}else{ %>
				작성완료
				<%} %>
			</td>
		</tr>
		<%
		}	}
		%>
		</tbody>
	</table>
</body>
</html>