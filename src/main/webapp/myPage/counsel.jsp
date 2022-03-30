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
				<th>문의 유형</th>
				<th style="width: 50%">내용</th>
				<th>주문번호</th>
				<th>작성일</th>
				<th>처리 상태</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${cList }" var="coun" >
			<tr>
				<td>${coun.c_categori }</td>
				<td><a href="ShowCounsel?c_id=${coun.c_id }">${coun.title }</a></td>
				<td>${coun.o_id }</td>
				<td>${coun.reg }</td>
				<td>${coun.c_state }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<button class="btn btn-primary" onclick="openPopupA('inquiry.jsp')">1:1 문의하기</button>
</body>
</html>