<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>          
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
				<c:forEach items="${oList }" var="order" varStatus="i">
					<c:if test="${order.state == '발송 완료' }">
						<tr>
							<td>${order.o_id }</td>
							<td><a href="ShopDetails?id=${order.p_id }" style="text-decoration: none; color: black;">${order.o_name }</a></td>
							<td>${order.name }</td>
							<td>
								<c:set var="num" value="${order.price }"/>
								<fmt:setLocale value="ko_kr"/>
								<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
							</td>
							<td>${order.state}</td>
							<td>${order.pdate }</td>
							<td align="center"><button class="btn btn-primary" onclick="stateMod('배송 완료',${order.o_id }); return false;" >처리</button></td>
						</tr>
					</c:if>
				</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>