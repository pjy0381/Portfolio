<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="js/mainJs.js"></script>
<script type="text/javascript" src="js/paginate.js"></script>

</head>
<body>
	<c:set value="${param.view }" var="view"/>
	<c:if test="${param.view==null }">
		<c:set var="view" value="info"/>
	</c:if>
	<div align="center" style="margin: auto auto; height: 100%;">
		<div class="container-fluid">
			<div class="row flex-nowrap" style="margin-top: 100px;">
				<jsp:include page="myPage/sidebar.jsp" />
				<main class="col-9 py-md-3 pl-md-5 bd-content" role="main"
					style="float: left; width: 60%;">
					<jsp:include page="myPage/${view }.jsp" />
				</main>
			</div>
		</div>
	</div>
</body>
<script>

    let options = {
        numberPerPage:10, //Cantidad de datos por pagina
        goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
        pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
    };

    let filterOptions = {
        el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
    };

    paginate.init('.myTable',options,filterOptions);
</script>    
</html>