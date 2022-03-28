<%@page import="com.company.bin.ProductList"%>
<%@page import="com.company.bin.OrderList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>    
<%
ArrayList<ProductList> pList = (ArrayList<ProductList>) request.getAttribute("pList");
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
					<th width="10%">상품 번호</th>
					<th>상품</th>
					<th>가격</th>
					<th>카테고리</th>
					<th>할인율</th>
					<th width="10%"></th>
				</tr>
			</thead>
			<tbody>
			<%
				if (pList != null) {
					for (int i = 0; i < pList.size(); i++) {
						ProductList product = pList.get(i);
						if(product.getEvent().equals("yes")){
			%>
				<tr>
					<td><%=product.getP_id()%></td>
					<td><a href="ShopDetails?id=<%=product.getP_id()%>" style="text-decoration: none; color: black;"><%=product.getP_name()%></a></td>
					<td><%=product.getP_price()%></td>
					<td><%=product.getP_categori() %></td>
					<td><%=product.getSale()%>%</td>
					<td align="center"><input type="button" class="btn btn-primary" value="삭제"  onclick="updateEvent('no',<%=product.getP_id()%>)"></td>
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