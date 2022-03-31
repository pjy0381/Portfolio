<%@page import="java.util.ArrayList"%>
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
		<c:forEach items="${adList }" var="ad" varStatus="i">
		<c:set var="address" value="${ad.sido+=' '+=ad.gugun+=' '+=ad.dong+=' '+=ad.ri }"/>
		<tr>
			<td>${ad.zipcode }</td>
			<td>${ad.sido }</td>
			<td>${ad.gugun }</td>
			<td>${ad.dong }</td>
			<td>${ad.ri }</td>
			<td>
				<button class="btn btn-default"
					onclick="select('${ad.zipcode }','${address }')"
					type="button">선택</button>
			</td>
		</tr>
		</c:forEach>
	</table>
	<script type="text/javascript" src="js/mainJs.js"></script>
</body>
</html>