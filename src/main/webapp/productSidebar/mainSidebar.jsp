<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="js/mainJs.js"></script>
</head>
<body onload="sidebarSelect('${param.p_color}','${param.categori }')">
	<div style="padding: 10px">
		<h5>색상</h5>
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" onchange="descSearch();return false;" id="_color">
			<option value="%%">all</option>
			<option value="black">black</option>
			<option value="red">red</option>
			<option value="blue">blue</option>
			<option value="emerald">emerald</option>
			<option value="brown">brown</option>
			<option value="white">white</option>
		</select>
	</div>
	<div style="padding: 10px">
		<h5>세부 분류</h5>
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" onchange="MainDesc();return false;" id="_categori">
			<option value="%%">all</option>
			<option value="top">상의</option>
			<option value="bottom">하의</option>
			<option value="outer">아우터</option>
			<option value="shoes">신발</option>
			<option value="etc">etc</option>
		</select>
	</div>
</body>
</html>