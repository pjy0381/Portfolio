<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    	<c:if test="${name == null || id == null }">
    		<c:redirect url="index.jsp"/>
    	</c:if>

</head>
<body>

	<div align="center">
		<h3>비밀번호 찾기</h3>
		<form action="NewPW" method="post" name="newPW">
			<table class="table">
				<tr>
					<td><input type="text" value="${id }" name="id" readonly="readonly" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="text" value="${name }" name="name" readonly="readonly" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="password" name="password" placeholder="새로운 비밀번호를 입력하세요(8~16/특수문자 포함)" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="password" name="chkPw" placeholder="비밀번호를 한번 더 입력하세요" class="form-control"></td>
				</tr>
				<tr>
					<td align="center"><input type="button" value="비밀번호 변경" class="btn btn-primary" onclick="newP();return false;"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>