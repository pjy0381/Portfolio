<%@page import="com.company.bin.AnswerList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.bin.CounselList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>	
<%String id = (String)session.getAttribute("id"); 
String power = (String)session.getAttribute("power"); 
ArrayList<AnswerList> aList = (ArrayList<AnswerList>)request.getAttribute("aList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더휴먼 쇼핑몰</title>
	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>
	
</head>
<body>
<div class="main">
	<header class="header"><jsp:include page="header.jsp" /></header>
	<section style="min-height: 1200px; height: auto; ">
		<table class="table" style="width: 900px; margin-top: 50px;">
			<thead>
				<tr>
					<th width="20%">${counsel.c_state }</th>
					<th width="60%">제목 : ${counsel.title }</th>
					<th>분류 : ${counsel.c_categori }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="left">아이디 : ${counsel.id }</td>
					<td></td>
					<td align="left">작성일 : ${counsel.reg }</td>
				</tr>
				<tr>
					<td colspan="3">${counsel.content }</td>
				</tr>
				<tr>
					<td style="border: none;"></td>
					<td style="border: none;"> 
						<div class="col-md-3 mt-1" style="width: 100%;">
							<img class="img-fluid img-responsive rounded product-image"src="${counsel.c_url }" onerror="this.parentNode.style.display='none'">
						</div>
					 </td>
					<td style="border: none;"></td>
				</tr>
				<%if(aList!=null){
					for(int i = 0; i<aList.size();i++){
						AnswerList a = aList.get(i);
					%>
					<tr>
						<td>작성자 : <%=a.getId() %></td>
						<td align="left">답변 : <%=a.getContent() %></td>
						<td>작성일 : <%=a.getReg() %></td>
					</tr>
				<%}} 
				if(power!=null&&power.equals("yes")){%>
				<tr>
					<td colspan="2" align="left" ><textarea rows="" cols="" class="form-control" id="content"></textarea></td>
					<td ><input type="button" value="답변하기" class="btn btn-primary" onclick="answer('<%=id%>','${counsel.c_id }')"></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</section>
	<footer><jsp:include page="footer.jsp"/></footer>
</div>
</body>
</html>