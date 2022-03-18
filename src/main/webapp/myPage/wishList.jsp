<%@page import="com.company.bin.WishList"%>
<%@page import="java.util.Date"%>
<%@page import="com.company.bin.OrderList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<WishList> wList = (ArrayList<WishList>) request.getAttribute("wList");
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
				<th>번호</th>
				<th width="50%">위시리스트</th>
				<th>아이피</th>
				<th>상품 번호</th>
			</tr>
		</thead>
		<tbody>
		<%
		if (wList != null) {
			for (int i = 0; i < wList.size(); i++) {
				WishList wish = wList.get(i);
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><a href="ShopDetails?id=<%=wish.getP_id()%>"><%=wish.getP_name()%></a></td>
			<td><%=wish.getIp()%></td>
			<td><%=wish.getP_id() %></td>
		</tr>
		<%
		}	}
		%>
		</tbody>
	</table>
</body>
</html>