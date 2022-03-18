<%@page import="com.company.bin.MemberBin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>	
<%
ArrayList<MemberBin> memList = (ArrayList<MemberBin>) request.getAttribute("memList");
String name = (String)request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%
	
		if (memList != null) {
			%>
			<b><%=name%>의 검색결과</b> 
			<table class="table">
			<%
			if(memList.size()==0){
				%>
				<tr>
					<td>해당하는 아이디가 없습니다.</td>
				</tr>
				<% 
			}
			for (int i = 0; i < memList.size(); i++) {
				MemberBin mem = memList.get(i);
				name = mem.getName();
		%>

		<tr>
			<td>ID : <%=mem.getId()%></td>
		</tr>

		<%
		}
		}
		%>
	</table>
</body>
</html>