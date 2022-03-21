<%@page import="com.company.bin.MemberBin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberBin mem = (MemberBin) request.getAttribute("mem");
if(mem==null){
	response.sendRedirect("index.jsp");
}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>
</head>
<body>
<div >
		<table class="table" style="width: 600px;">
			<tr>
				<td>아이디</td>			
				<td colspan="2"><input type="text" name="id"  class="form-control" readonly="readonly" value="<%=mem.getId()%>" id="_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"  class="form-control" value="<%=mem.getPassword()%>" id="_password"></td>
				<td align="center"><button type="submit" class="btn btn-default"  onclick="modify('password')">수정</button></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" class="form-control" value="<%=mem.getName()%>" id="_name"></td>
				<td align="center" ><button type="submit" class="btn btn-default" onclick="modify('name')" >수정</button></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td ><input type="text" name="phone"  class="form-control" value="<%=mem.getPhone()%>" id="_phone"></td>
				<td align="center" ><button type="submit" class="btn btn-default" onclick="modify('phone')" >수정</button></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="nAd"  class="form-control" readonly="readonly" value="<%=mem.getnAd()%>" id="_nAd">
				</td>
				<td align="center"><button type="submit" class="btn btn-default" onclick="openPopupA('address.jsp'); return false;" >검색</button></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="text" name="address"  class="form-control" readonly="readonly" value="<%=mem.getAddress()%>" id="_address">
				</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td>
					<input type="text" name="dAd" class="form-control" value="<%=mem.getdAd()%>" id="_dAd">
				</td>
				<td align="center"><button type="submit" class="btn btn-default" onclick="modifyA()">수정</button></td>
			</tr>
		</table>
		<%} %>
		</div>
		<script type="text/javascript" src="js/mainJs.js"></script>
</body>
</html>