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
<body onload="sidebarDescSelect('${param.p_color}','${param.p_desc }')">
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
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" onchange="SideDesc();return false;" id="_desc">
			<option value="%%">all</option>
			<option value="clock">시계</option>
			<option value="necklace">목걸이</option>
			<option value="bag">가방</option>
			<option value="socks">양말</option>
			<option value="etc">etc</option>
		</select>
	</div>
</body>
</html>