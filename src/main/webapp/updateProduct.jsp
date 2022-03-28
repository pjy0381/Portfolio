<%@page import="com.company.bin.ImgList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.bin.ProductList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>    
<%
ProductList p = (ProductList)request.getAttribute("p"); 
ArrayList<ImgList> iList = (ArrayList<ImgList>)request.getAttribute("iList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.form-control{
width: 50%;
display: inline-block;
}
.firT{
width: 20%;
}
</style>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/ManagerStyles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>
</head>
<body onload="selcetVal('<%=p.getP_categori()%>','<%=p.getP_gender()%>','<%=p.getP_color()%>')">
	<form enctype="multipart/form-data" name="formWithFiles" id="formWithFiles" action="UpdateProduct" method="post" style="margin-top: 20px">
		<h1 align="center" style="margin-bottom: 20px">상품 등록</h1>
		<table class="table">
			<tr >
				<td class="firT" style="border: none;">상품 이름 : </td>
				<td style="border: none;"><input type="text" name="p_name" class="form-control" value="<%=p.getP_name()%>"></td>
			</tr>
			<tr>
				<td class="firT" style="border: none;">상품 가격 : </td>
				<td style="border: none;"><input type="text" name="p_price" class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=p.getP_price()%>"></td>
			</tr>
			<tr>
				<td class="firT" style="border: none;">카테고리 : </td>
				<td style="border: none;">
					<select name="p_categori" class="form-control" id="p_categori">
						<option value="top">상의</option>
						<option value="bottom">하의</option>
						<option value="outer">아우터</option>
						<option value="shoes">신발</option>
						<option value="etc">ETC.</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td class="firT" style="border: none;">사용 성별 : </td>
				<td style="border: none;">
					<select name="p_gender" class="form-control" id="p_gender">
						<option value="man">남성</option>
						<option value="woman">여성</option>
						<option value="public">무관</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="firT" style="border: none;">색상 : </td>
				<td style="border: none;">
					<select name="p_color" class="form-control" id="p_color">
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
				<td style="border: none;">상세 분류 : </td>
				<td style="border: none;"><input type="text" name="p_desc" class="form-control" value="<%=p.getP_desc()%>"></td>
			</tr>
			<tr>
				<td class="firT" style="border: none;">제품 설명 : </td>
				<td style="border: none;">
					<textarea class="form-control" name="p_info"><%=p.getP_info()%></textarea>
				</td>
			</tr>
			<tr>
				<td class="firT" style="border: none;"> 메인 사진 : </td>
				<td style="border: none;">
					<div class="col-md-3 mt-1" style="width: 100%;">
						<img class="img-fluid img-responsive rounded product-image" src="<%=p.getP_url()%>" id="mainImg" onerror="this.parentNode.style.display='none'">
					</div>
				</td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td style="border: none;"><input type="file"  name="filename1" class="form-control" onchange="alterImg()" id="filename1"></td>
			</tr>
		</table>
	</form>	
	<table class="table">
		<tr>
			<td class="firT" style="border: none;">상세 사진 : </td>
			<td style="border: none;">
				<input type="button" value="사진 추가" onclick="addImg(<%=4-iList.size() %>)" class="btn btn-primary">
				<input type="button" value="사진 제거" onclick="minusImg()" class="btn btn-primary">
				<%for(int i = 0; i<4-iList.size();i++){ %>
					<form enctype="multipart/form-data" name="formWithFiles" id="formWithFiles<%=i%>" style="display: none;">
						<input type="file"  name="filename1" class="form-control">
					</form>
				<%} %>
			</td>
		</tr>
	<%for(int i = 0; i<iList.size(); i++){ 
				ImgList img = iList.get(i);
			%>
			<tr>
			<td style="border: none;"><input type="button" value="X" onclick="deleImg(<%=img.getId() %>)" class="form-control"></td>
			<td style="border: none;">
				<div class="col-md-3 mt-1" style="width: 100%;">
					<img class="img-fluid img-responsive rounded product-image" src="<%=img.getUrl()%>" onerror="this.parentNode.style.display='none'">
				</div>
			</td>
			</tr>
			<%} %>
		<tr>
			<td colspan="2" style="border: none;" align="center"><input type="button" value="상품 등록" onclick="updateProduct($('#quan').val(),<%=p.getP_id() %>)" class="btn btn-primary"></td>
		</tr>
	</table>
	<input type="hidden" id="quan" value="0">

</body>
</html>