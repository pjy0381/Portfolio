<%@page import="com.company.bin.ProductList"%>
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
					<th width="10%"></th>
					<th>상품 번호</th>
					<th>상품 이름</th>
					<th>가격</th>
					<th>카테고리</th>
					<th>세부 분류</th>
					<th>성별</th>
					<th width="5%"></th>
					<th width="5%"></th>
				</tr>
			</thead>
			<tbody>
			<%
				if (pList != null) {
					for (int i = 0; i < pList.size(); i++) {
						ProductList product = pList.get(i);
			%>
				<tr>
					<td>
						<div class="col-md-3 mt-1" style="width: 100%;">
							<img class="img-fluid img-responsive rounded product-image"src="<%=product.getP_url()%>">
						</div>
					</td>
					<td><%=product.getP_id()%></td>
					<td><a href="ShopDetails?id=<%=product.getP_id()%>" style="text-decoration: none; color: black;"><%=product.getP_name()%></a></td>
					<td><%=product.getP_price()%></td>
					<td><%=product.getP_categori() %></td>
					<td><%=product.getP_desc() %></td>
					<td><%=product.getP_gender()%></td>
					<td align="center"><input type="button" class="btn btn-primary" value="수정"  onclick="openPopupA('ModProduct?id=<%=product.getP_id()%>')"></td>
					<td align="center"><input type="button" class="btn btn-primary" value="삭제"  onclick="deleProduct(<%=product.getP_id()%>)"></td>
				</tr>
			<%
					}
				}
			%>
			</tbody>
		</table>
	</div>
</body>
</html>