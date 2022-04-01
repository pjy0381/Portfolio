<%@page import="com.company.common.MainURL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더휴먼 쇼핑몰</title>
	<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/mainJs.js"></script>
</head>
<body>
<c:set value="<%=MainURL.getM_url() %>" var="mainUrl"/>
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
							<img class="img-fluid img-responsive rounded product-image"src="${mainUrl }${counsel.c_url }" onerror="this.parentNode.style.display='none'">
						</div>
					 </td>
					<td style="border: none;"></td>
				</tr>
				<c:forEach items="${aList }" var="a" >
					<tr>
						<td>작성자 : ${a.id }</td>
						<td align="left">답변 : ${a.content }</td>
						<td>작성일 : ${a.reg }</td>
					</tr>
				</c:forEach>	
				<c:if test="${power == 'yes' }">
					<tr>
						<td colspan="2" align="left" ><textarea rows="" cols="" class="form-control" id="content"></textarea></td>
						<td ><input type="button" value="답변하기" class="btn btn-primary" onclick="answer('${sessionScope.id }','${counsel.c_id }')"></td>
					</tr>
				</c:if>
				
			</tbody>
		</table>
	</section>
	<footer><jsp:include page="footer.jsp"/></footer>
</div>
</body>
</html>