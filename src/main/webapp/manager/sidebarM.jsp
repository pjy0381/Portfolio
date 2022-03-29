<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">재무 조회</div>
                            <a class="nav-link" href="Manager">매출 관리</a>
                            <div class="sb-sidenav-menu-heading">사이트 관리</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                	회원 관리
                                	<span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Manager?mod=addManager">관리자 등록</a>
                                    <a class="nav-link" href="Manager?mod=modMemM">회원 수정/삭제</a>
                                    <a class="nav-link" href="Manager?mod=counselListN">문의 사항</a>
                                    <a class="nav-link" href="Manager?mod=counselListY">답변 완료</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                상품 관리
                                <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        상품
                                        <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="Manager?mod=productRegist">등록</a>
                                            <a class="nav-link" href="Manager?mod=productList">수정/삭제</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        주문/배송
                                        <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="Manager?mod=orderList">주문 처리</a>
                                            <a class="nav-link" href="Manager?mod=sendList">발송 처리</a>
                                            <a class="nav-link" href="Manager?mod=returnList">반품 처리</a>
                                            <a class="nav-link" href="Manager?mod=cancleList">취소 처리</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">이벤트 품목 관리</div>
                            <a class="nav-link" href="Manager?mod=eventAdd">추가/변경</a>
                            <a class="nav-link" href="Manager?mod=eventDele">삭제</a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">관리자 : </div>
                        ${name }
                    </div>
                </nav>
            </div>
</body>
</html>