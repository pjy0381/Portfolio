<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://apis.google.com/js/platform.js"></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta name="google-signin-client_id" content="640788995305-tdcdf0pn2606kj766a53mlmbf1na5and.apps.googleusercontent.com">
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
		<a href="" onclick="kakaoLogin();return false;"><img alt="" src="img/kakao_login_medium_narrow.png" style="min-width: 231px;margin-top: 10px"></a>
		</div >
		<div id="naver_id_login"></div>
		<div id="my-signin2" data-onsuccess="onSignIn" ></div>
	</div>
	
	<form action="index.jsp?webApp=register" id="hiddenF" method="post"> 
		<input type="hidden" id="h_id" name="h_id">
		<input type="hidden" id="h_name" name="h_name">
	</form>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="js/mainJs.js"></script>
	<script type="text/javascript" src="js/kakao.js"></script>
	<script type="text/javascript" src="js/naver.js"></script>
	<script type="text/javascript" src="js/google.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=renderButton"></script>
</body>
</html>