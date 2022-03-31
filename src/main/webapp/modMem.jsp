<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<div>
		<h1 align="center">회원 정보 변경</h1>
		<table class="table" style="width: 600px; margin-top: 30px;">
			<tr >
				<td>아이디</td>
				<td colspan="2">
					<input type="text" name="id" class="form-control" value="${member.id }" id="_id" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td >비밀번호</td>
				<td ><input type="password" name="password" class="form-control"value="${member.password }" id="_password"></td>
				<td align="center"><button type="submit" class="btn btn-default" onclick="modify('password')">수정</button></td>
			</tr>
			<tr>
				<td >이름</td>
				<td ><input type="text" name="name" class="form-control" value="${member.name }" id="_name"></td>
				<td align="center"><button type="submit" class="btn btn-default" onclick="modify('name')">수정</button></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone" class="form-control" value="${member.phone }" id="_phone"></td>
				<td align="center"><button type="submit" class="btn btn-default" onclick="modify('phone')">수정</button></td>
			</tr>
			<tr>
				<td >주소</td>
				<td ><input type="text" name="nAd" class="form-control" readonly="readonly" value="${member.nAd }" id="_nAd"></td>
				<td align="center"><button type="submit" class="btn btn-primary" onclick="openPopup('address.jsp'); return false;">검색</button></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="address" class="form-control" readonly="readonly" value="${member.address }" id="_address"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td ><input type="text" name="dAd" class="form-control" value="${member.dAd }" id="_dAd"></td>
				<td align="center"><button type="submit" class="btn btn-default" onclick="modifyA()">수정</button></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><button class="btn btn-primary" onclick="modM()" style="width: 40%; margin-top: 20px">닫기</button></td>
			</tr>
		</table>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>
</body>
</html>