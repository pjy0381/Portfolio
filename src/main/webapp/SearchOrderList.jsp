<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="js/mainJs.js"></script>

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
					<c:forEach items="${oList }" var="order" varStatus="i">
						<tr>
							<td>${order.o_id }</td>
							<td><a href="ShopDetails?id=${order.p_id }" style="text-decoration: none; color: black;">${order.o_name }</a></td>
							<td>${order.name }</td>
							<td>${order.price }</td>
							<td>${order.pdate }</td>
							<td align="center"><button class="btn btn-primary" onclick="selectO_id(${order.o_id }); return false;" >선택</button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
</body>
</html>