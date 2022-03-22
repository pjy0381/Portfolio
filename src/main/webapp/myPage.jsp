<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String view = request.getParameter("view");

if(view==null||view==""){view="myPage/info.jsp";}
else{view ="myPage/"+view+".jsp";}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:8081/ShoppingMall/js/mainJs.js"></script>

</head>
<body>
	<div align="center" style="margin: auto auto; height: 100%;">
		<div class="container-fluid">
			<div class="row flex-nowrap" style="margin-top: 100px;">
				<jsp:include page="myPage/sidebar.jsp" />
				<main class="col-9 py-md-3 pl-md-5 bd-content" role="main"
					style="float: left; width: 60%;">
					<jsp:include page="<%=view %>" />
				</main>
			</div>
		</div>
	</div>
</body>
</html>