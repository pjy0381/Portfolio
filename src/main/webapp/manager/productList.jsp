<%@page import="com.company.common.MainURL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/ManagerStyles.css" rel="stylesheet" />
</head>
<body>
	<c:set value="<%=MainURL.getM_url() %>" var="mainUrl"/>
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
			<c:forEach items="${pList }" var="p" varStatus="i">
				<tr>
					<td>
						<div class="col-md-3 mt-1" style="width: 100%;">
							<a href="ShopDetails?id=${p.p_id }" style="text-decoration: none; color: black;">
								<img class="img-fluid img-responsive rounded product-image"src="${mainUrl}${p.p_url }">
							</a>
						</div>
					</td>
					<td>${p.p_id }</td>
					<td><a href="ShopDetails?id=${p.p_id }" style="text-decoration: none; color: black;">${p.p_name }</a></td>
					<td>
						<c:set var="num" value="${p.p_price }"/>
						<fmt:setLocale value="ko_kr"/>
						<fmt:formatNumber value="${num }" groupingUsed="true" type="currency"/>
					</td>
					<td>${p.p_categori }</td>
					<td>${p.p_desc }</td>
					<td>${p.p_gender }</td>
					<td align="center"><input type="button" class="btn btn-primary" value="수정"  onclick="openPopupA('ModProduct?id=${p.p_id }')"></td>
					<td align="center"><input type="button" class="btn btn-primary" value="삭제"  onclick="deleProduct(${p.p_id })"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>