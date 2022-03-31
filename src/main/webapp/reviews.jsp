<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<div class="container mt-5 mb-5">
		<div class="d-flex justify-content-center row">
		<c:forEach items="${rList }" var="r" varStatus="i">
			<div class="col-md-10">
				<div class="row p-2 bg-white border rounded">
					<div class="col-md-3 mt-1">
						<img class="img-fluid img-responsive rounded product-image"
							src="${r.r_url }">
					</div>
					<div class="d-flex justify-content-center small text-warning mb-2">
						<c:forEach begin="1" end="${r.r_grade }" step="1" var="k">
							<span class="bi-star-fill"></span>
						</c:forEach>
						<c:if test="${r.r_grade % 1 != 0 }"><span class="bi bi-star-half"></span></c:if>
						<c:forEach begin="1" end="${5 - Math.ceil(r.r_grade) }" step="1" var="k">
							<span class="bi bi-star"></span>
						</c:forEach>
						<span>${r.r_grade }</span>
					</div>
					<div class="col-md-6 mt-1" style="width: 75%">
						<h5>${p.p_name }</h5>
						<div class="review_rating"></div>
						<div class="mt-1 mb-1 spec-1">
							<span>${r.writer }/</span> <span>${r.crdate }</span>
						</div>
						<p class="text-justify text-truncate para mb-0">${r.r_content }
							<br> <br>
						</p>

					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>

	<script type="text/javascript" src="js/mainJs.js"></script>
</body>
</html>