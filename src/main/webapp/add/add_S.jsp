<%@page import="com.company.bin.AddressList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%
ArrayList<AddressList> adList = (ArrayList<AddressList>) request.getAttribute("adList");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<%
		if (adList != null) {
			for (int i = 0; i < adList.size(); i++) {
				AddressList ad = adList.get(i);
				String address = ad.getSido() + " " + ad.getGugun() + " " + ad.getDong() + " " + ad.getRi();
		%>
		<tr>
			<td><%=ad.getZipcode()%></td>
			<td><%=ad.getSido()%></td>
			<td><%=ad.getGugun()%></td>
			<td><%=ad.getDong()%></td>
			<td><%=ad.getRi()%></td>
			<td>
				<button class="btn btn-default"
					onclick="select('<%=ad.getZipcode()%>','<%=address%>')"
					type="button">선택</button>
			</td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<script type="text/javascript" src="js/mainJs.js"></script>
</body>
</html>