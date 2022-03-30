<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		int totalCount=Integer.parseInt(request.getParameter("totalCount"));
		int pg=Integer.parseInt(request.getParameter("pg"));
		String gender = request.getParameter("gender");
		int countList = 12; // 한 페이지에 출력될 게시물 수(10개를 기준으로 잡음)
		int countPage = 10; // 한 화면에 출력될 페이지 수(통상적으로 10개 페이지를 나오게 함)
		int totalPage = totalCount / countList; // totalPage는 전체 페이지 수 (전체 게시물 / 한 페이지에 출력될 게시물 수)
		
		if (totalCount % countList > 0) {
			// totalCount를 countList로 나눈 나머지 값이 존재한다는 것은 한 페이지가 더 있다는 의미이다.
			totalPage++;
		}
		
		if (totalPage < pg) {// 현재 페이지가 전체 페이지보다 크다면 이는 출력될 페이지 범위를 벗어난 현제 페이지를 의미
			// 따라서 현재페이지를 가장 끝 페이지인 totalPage로 이동시킨다.
			pg = totalPage;
		}
		
		int startPage = ((pg - 1) / 10) * 10 + 1;
		// 현재 페이지를 기준으로 한 화면에서 시작 페이지 값을 보여준다.

		int endPage = startPage + countPage - 1;
		// 현재 페이지를 기준으로 한 화면에서 끝 페이지 값을 보여준다.
		
		// 전체 게시물이 255개 기준으로 할 경우 전체 페이지는 26개가 나온다. 내가 보려고 하는 현재
		// 페이지가 22페이지라고 했을 때 21에서 30까지 나오면 전체 페이지는 26까지 있기 때문에 실제
		// 리스트를 가지고 있지 않은 페이지가 발생한다. (27,28,29,30 페이지 해당)
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		if (startPage > 1) {%>
			<a href="<%=gender%>?page=1">처음</a>
		<% }
		
		if (pg > 1) {%>
			<a href="<%=gender%>?page=<%=pg-1%>">이전</a>
		<% }
		
		for (int iCount = startPage; iCount <= endPage; iCount++) {
			if (iCount == pg) {%>
				
				<b><%=iCount %></b>&nbsp;
			
			<% } else { %>
				
				&nbsp;<a href="<%=gender%>?page=<%=iCount%>"><%=iCount %></a>&nbsp;
			
			<% }
		}
		
		if (pg < totalPage) { %>
			<a href="<%=gender%>?page=<%=pg+1%>">다음</a>
		<% }

		if (endPage < totalPage) { %>
			<a href="<%=gender%>?page=<%=totalPage%>">끝</a>
		<% }
		
		%>