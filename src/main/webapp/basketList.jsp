<%@page import="com.company.bin.BasketList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<%ArrayList<BasketList> basketList = (ArrayList<BasketList>) session.getAttribute("basketList");
if(basketList == null){basketList = new ArrayList<BasketList>(); }
int total=0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>장바구니</title>


    <!-- Css Styles -->
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style2.css" type="text/css">
    <link href="css/mainStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	
	<script type="text/javascript" src="js/mainJs.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<div class="main">
	<header class="header"><jsp:include page="header.jsp"/></header>
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad" style="height: auto; min-height: 1100px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" style="text-align: center; width: 18%">제품</th>
                                    <th style="text-align: center; width: 18%">가격</th>
                                    <th style="text-align: center; width: 18%">사이즈</th>
                                    <th style="text-align: center; width: 18%">수량</th>
                                    <th style="text-align: center; width: 18%">총합</th>
                                    <th style="text-align: center;"> <span class="bi bi-x" onclick="allDrop();return false;"></span></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%if(basketList!=null){
                           		for(int i = 0; i<basketList.size(); i++){
                            	BasketList bas = basketList.get(i);
                            	%>
                                <tr>
                                    <td class="col-md-3 mt-1" >
                                        <img src="<%=bas.getUrl() %>" alt="" class="img-fluid img-responsive rounded product-image">
                                        <h5><%=bas.getName()%></h5>
                                    </td>
                                    <td class="shoping__cart__price" >
                                         &#8361;<%=bas.getPrice() %>
                                    </td>
                                    <td class="shoping__cart__price">
                                       <%=bas.getSize()%>
                                    </td>
                                    <td >
                                    	<b><%=bas.getQuantity() %></b>
                                    </td>
                                    <td class="shoping__cart__total">
                                         &#8361;<%=bas.getPrice()*bas.getQuantity() %>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="bi bi-x" onclick="dropBasket(<%=i%>);return false;"></span>
                                    </td>
                                </tr>
                                <%
                                total +=bas.getPrice()*bas.getQuantity();
 								}} 
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="index.jsp" class="primary-btn cart-btn cart-btn-right"><span class="bi bi-cart-plus"></span>
                            쇼핑 계속하기</a>
                    </div>
                </div>
                <div class="col-lg-6" style="width: 100%" >
                    <div class="shoping__checkout" align="left" >
                        <h5>가격 총합</h5>
                        <ul >
                            <li>가격 <span id="total">&#8361;<%=total%></span></li>
                        </ul>
                    </div>
                </div>
               	<div class="shoping__discount" >
               		<form action="">
                		<a class="site-btn" style="margin: 10px; margin-top: 30px" onclick="movePay(<%=basketList.size()%>);return false" >결제하기</a>
					</form>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
	<footer><jsp:include page="footer.jsp"/></footer>
</div>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>