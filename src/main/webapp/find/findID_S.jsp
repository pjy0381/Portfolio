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
	<c:if test="${memList.size()!=null }">
		<b>${name }의 검색 결과</b>
		<table class="table">
		<c:if test="${memList.size()==0 }">
			<tr>
				<td>해당하는 아이디가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${memList }" var="mem">
			<tr>
				<td>${mem.id }</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	
</body>
</html>