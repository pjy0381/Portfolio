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
					<th width="10%">상품 번호</th>
					<th>상품</th>
					<th>가격</th>
					<th>카테고리</th>
					<th>할인율</th>
					<th width="10%"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${pList }" var="p" varStatus="i">
			<c:if test="${p.event == 'yes' }">
				<tr>
					<td>${p.p_id }</td>
					<td><a href="ShopDetails?id=${p.p_id }" style="text-decoration: none; color: black;">${p.p_name }</a></td>
					<td>
						<c:set var="num" value="${p.p_price }"/>
						<fmt:setLocale value="ko_kr"/>
						<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
					</td>
					<td>${p.p_categori}</td>
					<td>${p.sale}%</td>
					<td align="center"><input type="button" class="btn btn-primary" value="삭제"  onclick="updateEvent('no',${p.p_id })"></td>
				</tr>
			</c:if>	
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>