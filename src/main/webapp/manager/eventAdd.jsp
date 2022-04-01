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
	<div class="card-body" >
		<table id="datatablesSimple">
			<thead>
				<tr>
					<th width="10%">상품 번호</th>
					<th>상품</th>
					<th>가격</th>
					<th>카테고리</th>
					<th width="5%">이벤트</th>
					<th width="20%">할인율</th>
					<th width="10%"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${pList }" var="p" varStatus="i">
				<tr>
					<td>${p.p_id }</td>
					<td><a href="ShopDetails?id=${p.p_id }" style="text-decoration: none; color: black;">${p.p_name }</a></td>
					<td>
						<c:set var="num" value="${p.p_price }"/>
						<fmt:setLocale value="ko_kr"/>
						<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
					</td>
					<td>${p.p_categori}</td>
					<td> <span id="event${i.count - 1 }">${p.event }</span></td>
					<td>
						<input type="text" class="form-control" style="display: inline-block; width: 80%" value="${p.sale }" id="_sale${p.p_id}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<span style="display: none;">${p.sale }</span>
						<span> % </span>
					</td>
					<td align="center"><input type="button" class="btn btn-primary" value="전송" onclick="updateEvent('yes',${p.p_id })"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>