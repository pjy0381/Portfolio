<%@page import="com.company.bin.BasketList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%!@SuppressWarnings("unchecked")%>
<%String name = (String)session.getAttribute("name"); 
String id = (String)session.getAttribute("id");
String power = (String)session.getAttribute("power");
String password = (String)session.getAttribute("password");
ArrayList<BasketList> basketList = (ArrayList<BasketList>) session.getAttribute("basketList");
if(basketList==null){basketList = new ArrayList<BasketList>();}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main_user">
	<%if(name==null){ %>
		<ul>
			<li><a href="basketList.jsp"> 장바구니( <span style="color: red;"><%=basketList.size() %></span> )</a></li>
			<li><a href="index.jsp?webApp=register">회원 가입</a></li>
			<li><a href="index.jsp?webApp=login">로그인</a></li>
		</ul>
		<%}else{ %>
		<ul>
			<%if(power!=null&&power.equals("yes")){ %>
			<li><a href="Manager">관리</a></li>
			<%} %>
			<li><a href="basketList.jsp">장바구니( <span style="color: red;"><%=basketList.size() %></span> )</a></li>
			<li><a href="MyPageInfo"><%=name %></a></li>
			<li><a href="Logout">로그아웃</a></li>

		</ul>
		<%} %>
	</div>
	<div class="shop_menu">
		<div class="logo">
			<a href="index.jsp"> <img alt="" src="./img/logo.png"></a>
		</div>
		<ul>
			<li class="menu_H">
				<a href="NewP">신상품</a>
				<div class="newM">
					<ul>
						<li><a href="NewP?categori=top">상의</a></li>
						<li><a href="NewP?categori=bottom">하의</a></li>
						<li><a href="NewP?categori=outer">아우터</a></li>
						<li><a href="NewP?categori=shoes">신발</a></li>
						<li><a href="NewP?categori=etc">ETC.</a></li>
					</ul>
				</div>
			</li>
			<li class="menu_H">
				<a href="ManP">남성</a>
				<div class="newM">
					<ul>
						<li><a  href="ManP?categori=top">상의</a></li>
						<li><a href="ManP?categori=bottom">하의</a></li>
						<li><a href="ManP?categori=outer">아우터</a></li>
						<li><a href="ManP?categori=shoes">신발</a></li>
						<li><a href="ManP?categori=etc">ETC.</a></li>
					</ul>
				</div>
			</li>
			<li class="menu_H">
				<a href="WomanP">여성</a>
				<div class="newM">
					<ul>
						<li><a href="WomanP?categori=top">상의</a></li>
						<li><a href="WomanP?categori=bottom">하의</a></li>
						<li><a href="WomanP?categori=outer">아우터</a></li>
						<li><a href="WomanP?categori=shoes">신발</a></li>
						<li><a href="WomanP?categori=etc">ETC.</a></li>
					</ul>
				</div>
			</li>
			<li class="menu_H">
				<a href="SaleP">이벤트</a>
				<div class="newM">
					<ul>
						<li><a href="SaleP?categori=top">상의</a></li>
						<li><a href="SaleP?categori=bottom">하의</a></li>
						<li><a href="SaleP?categori=outer">아우터</a></li>
						<li><a href="SaleP?categori=shoes">신발</a></li>
						<li><a href="SaleP?categori=etc">ETC.</a></li>
					</ul>
				</div>
			</li>
		</ul>
		<form class="navbar-form pull-left"  style="margin-top: 20px; width: 20%; float: right" action="SearchList" method="get">
			<div class="input-group" style="float: right;">
				<input type="text" class="form-control" placeholder="Search" name="keyword">
				<div class="input-group-btn">
					<button type="submit" class="btn btn-default">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>
			</div>
		</form>
		
	</div>
	
</body>
</html>