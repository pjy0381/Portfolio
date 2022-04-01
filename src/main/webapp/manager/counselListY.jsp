<%@page import="com.company.common.MainURL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/ManagerStyles.css" rel="stylesheet" />
</head>
<body>
	<c:set value="<%=MainURL.getM_url() %>" var="mainUrl"/>
	<div class="card-body">
		<table id="datatablesSimple">
			<thead>
				<tr>
					<th width="10%"></th>
					<th width="7%">문의 번호</th>
					<th width="7%">주문 번호</th>
					<th>문의 유형</th>
					<th>작성자</th>
					<th width="25%">제목</th>
					<th >연락처</th>
					<th>작성일</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cList }" var="coun" varStatus="i">
			<c:if test="${coun.c_state == '답변 완료' }">
				<tr>
					<td>
						<div class="col-md-3 mt-1" style="width: 100%;">
							<a href="ShowCounsel?c_id=${coun.c_id }" style="text-decoration: none; color: black;">
								<img class="img-fluid img-responsive rounded product-image"src="${mainUrl}${coun.c_url }" onerror="this.parentNode.style.display='none'">
							</a>
						</div>
					</td>
					<td>${coun.c_id }</td>
					<td>${coun.o_id }</td>
					<td>${coun.c_categori }</td>
					<td>${coun.id }</td>
					<td><a href="ShowCounsel?c_id=${coun.c_id }" style="text-decoration: none; color: black;">${coun.title }</a></td>
					<td>${coun.phone }</td>
					<td>${coun.reg }</td>
					<td>${coun.c_state }</td>
				</tr>
			</c:if>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>