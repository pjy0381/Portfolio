<%@page import="com.company.bin.CounselList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>    
<%ArrayList<CounselList> cList = (ArrayList<CounselList>)request.getAttribute("cList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>문의 유형</th>
				<th style="width: 50%">내용</th>
				<th>주문번호</th>
				<th>작성일</th>
				<th>처리 상태</th>
			</tr>
		</thead>
		<tbody>
		<%if(cList!=null){
			for(int i = 0; i<cList.size();i++){
				CounselList coun = cList.get(i);
				%>
				<tr>
					<td><%=coun.getC_categori() %></td>
					<td><a href="ShowCounsel?c_id=<%=coun.getC_id()%>"><%=coun.getTitle() %></a></td>
					<td><%=coun.getO_id() %></td>
					<td><%=coun.getReg() %></td>
					<td><%=coun.getC_state() %></td>
				</tr>
				<% 
			}
		} %>
		</tbody>
	</table>
	<button class="btn btn-primary" onclick="openPopupA('inquiry.jsp')">1:1 문의하기</button>
</body>
</html>