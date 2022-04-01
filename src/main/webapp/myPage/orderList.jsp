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
<c:set var="agoWeek" value="<%=new Date(new Date().getTime() - 60*60*24*1000*14)%>"/>
<fmt:formatDate value="${agoWeek }" pattern="yyyy-MM-dd" var="agoWeek"/>
</head>
<body>
    <div class="input-group" style="float: right;">
    	<input type="search" id="searchBox" placeholder="검색" class="form-control">
    </div>
	<table class="myTable table hover">
		<thead>
			<tr>
				<th>주문번호</th>
				<th style="width: 50%">주문내역</th>
				<th>가격</th>
				<th>배송 상태</th>
				<th>구매자</th>
				<th>리뷰</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${oList }" var="order" varStatus="i">
			<tr>
				<td>${order.o_id }</td>
				<td><a href="ShopDetails?id=${order.p_id }">${order.o_name }</a></td>
				<td>
					<c:set var="num" value="${order.price }"/>
					<fmt:setLocale value="ko_kr"/>
					<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
				</td>
				<td id="state${i.count-1 }">${order.state }</td>
				<td>${order.name }</td>
				<td>
					<c:if test="${order.state == '배송 완료'}">
					<c:choose>
						<c:when test="${order.review == 'yes' }"><span style="color: blue;">작성 완료</span></c:when>
						<c:when test="${order.review == 'no' }">
							<a href="reviewR.jsp" onclick="openPopupA(this.href+'?p_id=${order.p_id }&o_id=${order.o_id }'); return false;">리뷰 작성</a>
						</c:when>
						<c:when test="${agoWeek>order.pdate }"><span style="color: red;">기간 초과</span></c:when>
					</c:choose>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>