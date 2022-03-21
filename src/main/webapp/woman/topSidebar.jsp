<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>
</head>
<body>
	<div style="padding: 10px">
		<h5>색상</h5>
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" >
			<option selected>선택하세요</option>
			<option value="black">black</option>
			<option value="red">red</option>
			<option value="blue">blue</option>
			<option value="emerald">emerald</option>
			<option value="white	">white</option>
		</select>
	</div>
	<div style="padding: 10px">
		<h5>세부 분류</h5>
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" onchange="descSearch();return false;" id="_desc">
			<option selected>선택하세요</option>
			<option value="1">티셔츠</option>
			<option value="2">후드티</option>
			<option value="3">롱슬리브</option>
		</select>
	</div>
</body>
</html>