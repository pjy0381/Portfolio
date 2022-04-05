<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<div style="width: 400px">
		<h1>로그인</h1>
		<form action="Login" method="post">
			<table class="table">
				<tr>
					<td>
						<input type="text" name="id" placeholder="아이디를 입력해 주세요."class="form-control" >
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="password"placeholder="비밀번호를 입력해 주세요." class="form-control" id="password">
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
		<div style="float: left; width: 100%;">
		<a href="" onclick="kakaoLogin();return false;"><img alt="" src="img/kakao_login_medium_narrow.png" style="max-width: 180px;margin-top: 10px"></a>
		</div >
		<div style="float: left; width: 100%;">
		<a href=""><img alt="" src="img/btnG_완성형.png" style="max-width: 180px;margin-top: 10px"></a>
		</div>
	</div>
	
	<form action="index.jsp?webApp=register" id="hiddenF" method="post"> 
		<input type="hidden" id="h_id" name="h_id">
		<input type="hidden" id="h_name" name="h_name">
	</form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="js/kakao.js"></script>
</body>
</html>