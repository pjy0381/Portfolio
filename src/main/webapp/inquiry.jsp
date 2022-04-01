<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="js/mainJs.js"></script>
	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<h1 align="center">1:1 문의</h1>
	<form method="post" enctype="multipart/form-data" action="CounselReg"  id="counselAdd">
	<table class="table" style="margin-top: 30px;">
		<tr>
			<td>문의 유형 : </td>
			<td>
				<select class="form-control" name="c_categori" id="c_categori">
					<option selected="selected">---문의 유형 선택---</option>
					<option value="배송">배송</option>
					<option value="A/S">A/S</option>
					<option value="주문/결제">주문/결제</option>
					<option value="회원관련">회원관련</option>
					<option value="기타 문의">기타 문의</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주문번호 : </td>
			<td>
				<input type="text" class="form-control" style="float: left; width: 80%;" name="o_id" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="o_id">
				<input type="text" class="btn btn-primary" style="float: left; width: 20%;" value="조회" onclick="openPopup('OrderListPro')">
			</td>
		</tr>
		<tr>
			<td>작성자 : </td>
			<td><input type="text" class="form-control" value="${id}" name="id" id="id"></td>
		</tr>
		<tr>
			<td>연락처 : </td>
			<td><input type="text" class="form-control" name="phone" value="${phone}" id="phone"></td>
		</tr>
		<tr>
			<td>제목 : </td>
			<td><input type="text" class="form-control" name="title" id="title"></td>
		</tr>
		<tr>
			<td>문의 내용 : </td>
			<td><textarea class="form-control" name="content" id="content"></textarea></td>
		</tr>
		<tr>
			<td>사진 : </td>
			<td><input type="file" class="form-control" name="c_url"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="작성하기" class="btn btn-primary" onclick="counsel();return false;"></td>
		</tr>
	</table>
	</form>
</body>
</html>