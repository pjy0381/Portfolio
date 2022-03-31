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
<c:set var="totalCount" value="${param.totalCount }"/>
<c:set var="pg" value="${param.pg }"/>
<c:set var="countList" value="12"/>
<c:set var="countPage" value="10"/>
<c:set var="totalPage" value="${Math.floor(totalCount/countList) }"/>

<c:set var="startPage" value="${Math.floor((pg - 1)/10) }"/>
<c:set var="startPage" value="${startPage * 10+1  }"/>

<c:set var="endPage" value="${startPage + countPage - 1 }"/>
<c:if test="${totalCount % countList > 0 }">
	<c:set var="totalPage" value="${totalPage+1 }"/>
</c:if>
<c:if test="${totalPage< pg }">
	<c:set var="pg" value="${totalPage }"/>
</c:if>
<c:if test="${endPage > totalPage }">
	<c:set var="endPage" value="${totalPage }"/>
</c:if>
<c:if test="${startPage > 1 }">
	<a href="" onclick="GoPage(${pg},${1 });return false">처음</a>
</c:if>
<c:if test="${pg > 1 }">
	<a href="" onclick="GoPage(${pg},${pg-1 });return false">이전</a>
</c:if>
<c:forEach begin="${startPage }" end="${endPage}" step="1" varStatus="i" var="iCount"> 
	<c:choose>
		<c:when test="${i.count == pg}"><b>${i.count }</b>&nbsp;</c:when>
		<c:otherwise>&nbsp;<a href="" onclick="GoPage(${pg},${i.count });return false">${i.count }</a>&nbsp;</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pg < totalPage}">
	<a href="" onclick="GoPage(${pg},${pg+1 });return false">다음</a>
</c:if>
<c:if test="${endPage < totalPage }">
	<a href="" onclick="GoPage(${pg},${totalPage });return false">끝${countPage }</a>
</c:if>
</body>
</html>