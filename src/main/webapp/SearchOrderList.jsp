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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>

	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th >주문 번호</th>
							<th>상품</th>
							<th>주문자</th>
							<th>가격</th>
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
							<td><%=order.getPdate() %></td>
							<td align="center"><button class="btn btn-primary" onclick="selectO_id(<%=order.getO_id() %>); return false;" >선택</button></td>
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