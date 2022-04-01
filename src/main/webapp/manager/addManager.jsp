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
<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 회원 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>회원 아이디</th>
							<th>회원 이름</th>
							<th>비밀 번호</th>
							<th>전화 번호</th>
							<th>주소</th>
							<th>등급</th>
							<th>가입 날짜</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mList }" var="mem" varStatus="i">
						<c:if test="${mem.grade == 'member' }">
						<tr>
							<td><input type="hidden" value="${mem.id }" class="form-control"><span>${mem.id }</span></td>
							<td><span>${mem.name }</span></td>
							<td><span>${mem.password }</span></td>
							<td><span>${mem.phone }</span></td>
							<td>
								<span>(${mem.nAd })${mem.address } ${mem.dAd }</span>
							</td>
							<td><span>${mem.grade }</span></td>
							<td><span>${mem.reg }</span></td>
							<td align="center"><button class="btn btn-primary" onclick="addManager('${mem.id }','${mem.password }'); return false;">추가</button></td>
						</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>