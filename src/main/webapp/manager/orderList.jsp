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
	<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th width="10%">주문 번호</th>
							<th>상품</th>
							<th>주문자</th>
							<th>가격</th>
							<th>주문 상태</th>
							<th>주문 날짜</th>
							<th width="10%"></th>
						</tr>
					</thead>
					<tbody>
						<%
						if (oList != null) {
							for (int i = 0; i < oList.size(); i++) {
								OrderList order = oList.get(i);
								if(order.getState().equals("주문 요청")){
						%>
						<tr>
							<td><%=order.getO_id()%></td>
							<td><a href="ShopDetails?id=<%=order.getP_id()%>" style="text-decoration: none; color: black;"><%=order.getO_name()%></a></td>
							<td><%=order.getName() %></td>
							<td><%=order.getPrice() %></td>
							<td><%=order.getState() %></td>
							<td><%=order.getPdate() %></td>
							<td align="center"><button class="btn btn-primary" onclick="stateMod('주문 확인',<%=order.getO_id() %>); return false;" >처리</button></td>
						</tr>
						<%
								}
						}
						}
						%>
					</tbody>
				</table>
			</div>
</body>
</html>