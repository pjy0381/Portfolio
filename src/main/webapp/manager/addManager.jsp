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
							<th>등급</th>
							<th>가입 날짜</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						if (mList != null) {
							for (int i = 0; i < mList.size(); i++) {
								MemberBin mem = mList.get(i);
								if(mem.getGrade().equals("member")){
						%>
						<tr>
							<td><input type="hidden" value="<%=mem.getId()%>" class="form-control"><span><%=mem.getId()%></span></td>
							<td><span><%=mem.getName()%></span></td>
							<td><span><%=mem.getPassword()%></span></td>
							<td><span><%=mem.getPhone()%></span></td>
							<td>
								<span>(<%=mem.getnAd() %>)<%=mem.getAddress() %> <%=mem.getdAd() %></span>
							</td>
							<td><span><%=mem.getGrade()%></span></td>
							<td><span><%=mem.getReg()%></span></td>
							<td align="center"><button class="btn btn-primary" onclick="addManager('<%=mem.getId() %>','<%=mem.getPassword() %>'); return false;">추가</button></td>
						</tr>
						<%}
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>