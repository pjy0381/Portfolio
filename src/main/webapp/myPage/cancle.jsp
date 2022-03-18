<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.company.bin.OrderList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<OrderList> oList = (ArrayList<OrderList>) request.getAttribute("oList");
Date date = new	Date();
date.setDate(date.getDate()-7);
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
				<th>구매자</th>
				<th>주문 날짜</th>
				<th>반품 신청</th>
				<th>주문 취소	</th>
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
			<td><%=order.getName()%></td>
			<td><%=order.getPdate()%></td>
			<td><%if(order.getPdate().compareTo(date)==1){%>
				<a>반품 신청</a>
				<%}else{ %>
				기간 초과
				<%} %>
			</td>
			<td>
				<%if(order.getState().equals("주문 신청")||order.getState().equals("주문 확인")){ %>
				<a>주문 취소</a>
				<%}else{ %>
					취소가 불가능합니다.
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