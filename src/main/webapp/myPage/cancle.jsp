<%@page import="java.util.Date"%>
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
<body onload="state(${oList.size()})">
<c:set var="agoWeek" value="<%=new Date(new Date().getTime() - 60*60*24*1000*7)%>"/>
<fmt:formatDate value="${agoWeek }" pattern="yyyy-MM-dd" var="agoWeek"/>
	<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th style="width: 50%">주문내역</th>
				<th>구매자</th>
				<th>주문 상태</th>
				<th>주문 날짜</th>
				<th>반품 신청</th>
				<th>주문 취소	</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${oList }" var="order" varStatus="i">
			<tr>
				<td>${order.o_id }</td>
				<td><a href="ShopDetails?id=${order.p_id }">${order.o_name }</a></td>
				<td>${order.name }</td>
				<td id="state${i.count-1 }">${order.state }</td>
				<td>${order.pdate }</td>
				<td>
					<c:choose>
						<c:when test="${order.state == '반품 요청' }">신청 중</c:when>
						<c:when test="${order.state == '배송 완료' }">
							<c:if test="${agoWeek>order.pdate }"><span style="color: red;">기간 초과</span></c:if>
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${order.state == '주문 요청'||order.state == '주문 확인' }"><a href="" onclick="modOrder(${order.o_id},'취소 요청')">주문 취소</a></c:when>
						<c:when test="${order.state == '반품 요청'||order.state == '취소 요청'||order.state == '취소 완료'	}"></c:when>
						<c:otherwise><span style="color: red;">취소 불가</span></c:otherwise>
					</c:choose>
				</td>
			</tr>	
		</c:forEach>
		</tbody>
	</table>
</body>
</html>