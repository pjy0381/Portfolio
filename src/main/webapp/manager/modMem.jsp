<%@page import="com.company.bin.MemberBin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>    
<%
ArrayList<MemberBin> mList = (ArrayList<MemberBin>) request.getAttribute("mList");
%>    
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
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (mList != null) {
							for (int i = 0; i < mList.size(); i++) {
								MemberBin mem = mList.get(i);
						%>
						<tr>
							<td><input type="text" value="<%=mem.getId()%>" class="form-control"><span style="visibility: hidden;"><%=mem.getId()%></span></td>
							<td><input type="text" value="<%=mem.getName() %>" class="form-control"><span style="visibility: hidden;"><%=mem.getName()%></span></td>
							<td><input type="text" value="<%=mem.getPassword() %>" class="form-control"><span style="visibility: hidden;"><%=mem.getPassword()%></span></td>
							<td><input type="text" value="<%=mem.getPhone() %>" class="form-control"><span style="visibility: hidden;"><%=mem.getPhone()%></span></td>
							<td>
								<input type="button" class="form-control" value="검색" style="width: 20%;" onclick="openPopupA('address.jsp'); return false;"> 
								<span>(<%=mem.getnAd() %>)<%=mem.getAddress() %> <%=mem.getdAd() %></span>
							</td>
							<td align="center"><button class="btn btn-primary">수정</button></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>