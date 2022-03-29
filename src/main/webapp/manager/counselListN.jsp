<%@page import="com.company.bin.CounselList"%>
<%@page import="com.company.bin.ProductList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>    
<%
ArrayList<CounselList> cList = (ArrayList<CounselList>) request.getAttribute("cList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/ManagerStyles.css" rel="stylesheet" />
</head>
<body>
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
			<%
				if (cList != null) {
					for (int i = 0; i < cList.size(); i++) {
						CounselList coun = cList.get(i);
						if(coun.getC_state().equals("답변 대기")){
			%>
				<tr>
					<td>
						<div class="col-md-3 mt-1" style="width: 100%;">
							<a href="ShowCounsel?c_id=<%=coun.getC_id()%>" style="text-decoration: none; color: black;">
								<img class="img-fluid img-responsive rounded product-image"src="<%=coun.getC_url()%>" onerror="this.parentNode.style.display='none'">
							</a>
						</div>
					</td>
					<td><%=coun.getC_id()%></td>
					<td><%=coun.getO_id() %></td>
					<td><%=coun.getC_categori()%></td>
					<td><%=coun.getId() %></td>
					<td><a href="ShowCounsel?c_id=<%=coun.getC_id()%>" style="text-decoration: none; color: black;"><%=coun.getTitle()%></a></td>
					<td><%=coun.getPhone()%></td>
					<td><%=coun.getReg() %></td>
					<td><%=coun.getC_state()%></td>
				</tr>
			<%
						}
					}
				}
			%>
			</tbody>
		</table>
	</div>
</body>
</html>