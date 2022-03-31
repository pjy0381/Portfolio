<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<form action="FindPW" method="post">
		<table class="table">
			<tr>
				<td><input name="name" class="form-control"
					placeholder="이름을 입력하세요" value="${name }"></td>
			</tr>
			<tr>
				<td><input name="id" class="form-control"
					placeholder="아이디를 입력하세요" value="${name }"></td>
			</tr>
			<tr>
				<td>
					<div class="input-group-btn" align="center">
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>