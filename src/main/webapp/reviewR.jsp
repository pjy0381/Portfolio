<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style2.css" type="text/css">
<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="Upload"  name="myform" id="myform">
		<table class="table">
			<tr>
				<td>상품번호:<input type="text" value="${param.p_id }" class="form-control" readonly="readonly" name="p_id"> <input type="hidden" value="${param.o_id }" name="o_id"> </td>
				<td>작성자:<input type="text" value="${name }" class="form-control" readonly="readonly" name="writer"></td>
			</tr>
			<tr>
				<td colspan="2">
					<fieldset>
						<input type="radio" name="r_grade" value="5" id="rate1"><label for="rate1">⭐</label> 
						<input type="radio" name="r_grade" value="4" id="rate2"><label for="rate2">⭐</label> 
						<input type="radio" name="r_grade" value="3" id="rate3"><label for="rate3">⭐</label> 
						<input type="radio" name="r_grade" value="2" id="rate4"><label for="rate4">⭐</label> 
						<input type="radio" name="r_grade" value="1" id="rate5"><label for="rate5">⭐</label>
					</fieldset>
				</td>
			</tr>
			<tr >
				<td colspan="2" ><textarea rows="" cols="" class="form-control" placeholder="리뷰를 작성해주세요" style="height: 200px" name="r_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				 <input type="file" name="filename1" size=40 class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="업로드" class="form-control"></td>
			</tr>
		</table>
	</form>
</body>
</html>