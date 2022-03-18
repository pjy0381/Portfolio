<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<h1>회원가입</h1>
		<form name="reg" action="Register" method="post">
		<table class="table" style="width: 400px;">
			<tr>
				<td><input type="text" name="id" placeholder="아이디를 입력해 주세요." class="form-control" id="_id" onblur="ckId();return false;"></td>
				<td> <p id="chkId"></p> </td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호 (8~16/특수문자 포함)" class="form-control"  id="_pw" onblur="ckPw();return false;"></td>
				<td> <p id="chkPw"></p> </td>
			</tr>
			<tr>
				<td><input type="password"  name="chkPw" placeholder="비밀번호를 다시 입력해 주세요." class="form-control" onblur="checkPw()"></td>
				<td> <p id="chkPw2"></p> </td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="이름을 입력해 주세요." class="form-control"  onblur="checkName()"></td>
				<td> <p id="chkName"></p> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="phone" placeholder="휴대폰 번호를 입력해 주세요." class="form-control"></td>
			</tr>
			<tr>
				<td>
					<input type="text" name="nAd" placeholder="주소를 입력해 주세요." class="form-control" readonly="readonly">
				</td>
				<td> <button class="btn btn-primary" onclick="openPopupA('address.jsp'); return false;">찾기</button></td>	
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="address" placeholder="주소를 입력해 주세요." class="form-control" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="dAd" placeholder="상세 주소를 입력해 주세요." class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-primary" type="button" onclick="check_reg()">회원가입</button></td>
			</tr>
		</table>
		</form>
		
	<script type="text/javascript" src="js/mainJs.js">

	</script>
</body>
</html>