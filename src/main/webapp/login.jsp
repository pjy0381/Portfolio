<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div style="width: 400px">
		<h1>로그인</h1>
		<form action="Login" method="post">
			<table class="table">
				<tr>
					<td>
						<input type="text" name="id" placeholder="아이디를 입력해 주세요."class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="password"placeholder="비밀번호를 입력해 주세요." class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-primary">로그인</button>
					</td>
				</tr>
			</table>
		</form>
		<a href="findID.jsp" onclick="openPopup(this.href); return false;">아이디 찾기</a>
		<a href="findPW.jsp" onclick="openPopup(this.href); return false;">비밀번호 찾기</a>
		<a href="index.jsp?webApp=register">회원가입</a>
	</div>
	<script type="text/javascript" src="js/mainJs.js"></script>
</body>
</html>