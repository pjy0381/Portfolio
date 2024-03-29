<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
	<c:set var="mode" value="${param.mode }"/>
	<c:if test="${param.mode == null}">
		<c:set value="main" var="mode"/>
	</c:if>
		
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/ManagerStyles.css" rel="stylesheet" />
        
    	<c:if test="${power != 'yes' }">
    		<c:redirect url="index.jsp"/>
    	</c:if>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
           <jsp:include page="manager/headerM.jsp"/>
        </nav>
        <div id="layoutSidenav">
           <jsp:include page="manager/sidebarM.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <jsp:include page="manager/${mode }.jsp"/>
                </main>
                <footer class="py-4 bg-light mt-auto">
                	<jsp:include page="manager/footerM.jsp"/>
                </footer>
            </div>
        </div>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" ></script>
        <script type="text/javascript" src="js/mainJs.js"></script>
    </body>
</html>
