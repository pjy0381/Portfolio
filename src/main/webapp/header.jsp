<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main_user">
	<c:choose>
		<c:when test="${name==null }">
			<ul>
				<li><a href="basketList.jsp"> 장바구니( <span style="color: red;">${basketList.size() }</span> )</a></li>
				<li><a href="index.jsp?webApp=register">회원 가입</a></li>
				<li><a href="index.jsp?webApp=login">로그인</a></li>
			</ul>
		</c:when>
		<c:otherwise>
		<ul>
			<c:if test="${power !=null && power == 'yes' }">
				<li><a href="Manager">관리</a></li>
			</c:if>
			<li><a href="basketList.jsp">장바구니( <span style="color: red;">${basketList.size() }</span> )</a></li>
			<li><a href="MyPageInfo">${name }</a></li>
			<li><a href="Logout">로그아웃</a></li>
		</ul>	
		</c:otherwise>
	</c:choose>
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