<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    	
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
		<c:forEach items="${wList }" var="wish" varStatus="i">
			<tr>
				<td>${i.count+1 }</td>
				<td><a href="ShopDetails?id=${wish.p_id }">${wish.p_name }</a></td>
				<td>${wish.ip }</td>
				<td>${wish.p_id }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>