<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>
<style type="text/css">
.form-control{
width: 50%;
display: inline-block;
}
.firT{
width: 10%;
}

</style>

</head>
<body>
	<form enctype="multipart/form-data" name="formWithFiles" id="formWithFiles" action="ProductRegister" method="post" style="margin-top: 50px">
		<h1 align="center" style="margin-bottom: 50px">상품 등록</h1>
		<table class="table">
			<tr >
				<td width="30%;" style="border: none;"></td>
				<td class="firT" style="border: none;">상품 이름 : </td>
				<td style="border: none;"><input type="text" name="p_name" class="form-control"></td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td class="firT" style="border: none;">상품 가격 : </td>
				<td style="border: none;"><input type="text" name="p_price" class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td class="firT" style="border: none;">카테고리 : </td>
				<td style="border: none;">
					<select name="p_categori" class="form-control">
						<option value="top">상의</option>
						<option value="bottom">하의</option>
						<option value="outer">아우터</option>
						<option value="shoes">신발</option>
						<option value="etc">ETC.</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td class="firT" style="border: none;">사용 성별 : </td>
				<td style="border: none;">
					<select name="p_gender" class="form-control">
						<option value="man">남성</option>
						<option value="woman">여성</option>
						<option value="public">무관</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td class="firT" style="border: none;">색상 : </td>
				<td style="border: none;">
					<select name="p_color" class="form-control">
						<option value="black">black</option>
						<option value="white">white</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="brown">brown</option>
						<option value="ivory">ivory</option>
						<option value="emerald">emerald</option>
						<option value="gray">gray</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td style="border: none;">상세 분류 : </td>
				<td style="border: none;"><input type="text" name="p_desc" class="form-control"></td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td class="firT" style="border: none;">제품 설명 : </td>
				<td style="border: none;">
					<textarea class="form-control" name="p_info"></textarea>
				</td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td class="firT" style="border: none;"> 메인 사진 : </td>
				<td style="border: none;"><input type="file"  name="filename1" class="form-control"></td>
			</tr>
		</table>
	</form>	
	<table class="table">
		<tr>
			<td width="30%;" style="border: none;"></td>
			<td class="firT" style="border: none;">상세 사진 : </td>
			<td style="border: none;">
				<input type="button" value="사진 추가" onclick="addImg(4)" class="btn btn-primary">
				<input type="button" value="사진 제거" onclick="minusImg()" class="btn btn-primary">
				<%for(int i = 0; i<4;i++){ %>
					<form enctype="multipart/form-data" name="formWithFiles" id="formWithFiles<%=i%>" style="display: none;">
						<input type="file"  name="filename1" class="form-control">
					</form>
				<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="border: none;" align="center"><input type="button" value="상품 등록" onclick="productReg($('#quan').val(),0)" class="btn btn-primary"></td>
		</tr>
	</table>
	<input type="hidden" id="quan" value="0">
</body>
</html>