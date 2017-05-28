<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
	<style>

		/* 메뉴 전체영역에 대한 스타일 */
		#nav {
			list-style-type: none;	/* 불릿 기호 없앰 */
			height: 11%;
			width: 100%;
			padding: 5px 0px;
			margin-top: -2px;
			margin-left: 0%;
			
			background: skyblue;
			position: fixed;
			z-index: 1;
			
		}

		/* 서브메뉴 영역에 대한 스타일 */
		#nav ul {
			margin: 0;
			padding: 0;
			list-style: none;
			position: absolute;
			left: 0;
			top: 45px;
			width: 150px;
			background: #DDDDDD;
			border: 1px solid #B4B4B4;
			border-radius: 8px;
			-webkit-box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
			-moz-box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
			box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
			opacity: 0;
			
		}

		/* 서브메뉴 링크 스타일 */
		#nav ul a {
			font-weight: normal;
			text-shadow: 0 1px 0 #FFFFFF;
			color: #333333;
		}

		/* 서브메뉴 각 항목의 스타일 */
		#nav ul li {
			float: none;
			margin: 0;
			padding: 0;
		}

		/* 서브메뉴 각 항목 위로 마우스를 올렸을 때 */
		#nav ul li:hover a {
			background: #0078FF;
			color: #FFFFFF;
			text-shadow: 0 1px RGBA(0, 0, 0, 0.1);
			border-radius: 0;
		}

		/* 서브메뉴 첫번째 항목의 스타일 */
		#nav ul li:first-child > a {
			-webkit-border-top-left-radius: 8px;
			-moz-border-radius-topleft: 8px;
			-webkit-border-top-right-radius: 8px;
			-moz-border-radius-topright: 8px;
		}

		/* 서브메뉴 마지막 항목의 스타일 */
		#nav ul li:last-child > a {
			-webkit-border-bottom-left-radius: 8px;
			-moz-border-radius-bottomleft: 8px;
			-webkit-border-bottom-right-radius: 8px;
			-moz-border-radius-bottomright: 8px;
		}

		/* 메뉴 각 항목에 대한 스타일 */
		#nav li {
			float: right;			/* li 각 항목을 왼쪽정렬시키기 */
			position: relative;		/* 순서대로 표시 */
			margin: 5px;
			margin-right: 3%;
			padding: 0;
		}

		/* 메뉴의 링크에 대한 스타일 */
		#nav li a {
			display: block;			/* 영역을 만듦 */
			font-family: "굴림";
			font-weight: 600;
			font-size: 1em;
			padding: 10px 20px;
			color: #E7E5E5;
			text-decoration: none;
			margin-top: 0;
			border-radius: 1.4em;
			text-shadow: 0 1px 1px RGBA(0, 0, 0, 0.3);	/* 그림자 효과 */
		}

		/* 메인 메뉴 위로 마우스 포인터를 가져갔을 때 서브 메뉴 스타일 */
		#nav li:hover ul {
			opacity: 1;
		}

		/* 메뉴 항목 위로 마우스를 올렸을 때 스타일 */
		#nav li:hover a {
			background: #EBEBEB;
			color: #444444;
			text-shadow: 0 1px 1px RGBA(255, 255, 255, 1);
			border-radius: 1em;
			/*-webkit-box-shadow: 0 1px 1px RGBA(0, 0, 0, 0.2);
			-moz-box-shadow: 0 1px 1px RGBA(0, 0, 0, 0.2);*/
		}
		
	</style>
<script type="text/javascript" src="/3rd.Yebigun/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#login").click(function(){	
		window.open("/3rd.Yebigun/customer/login", "window", "width=800,height=300");
		
		return false;
	}); 	
	//
	$("#cuDetail").click(function(){
		if($("#loginfo").val()==" "||$("#loginfo").val()==null||$("#loginfo").val()==""){
			window.open("customer/login", "window", "width=800,height=300");
			return false;
		}else{
			return true;
		}
		return false;
	});
});
</script>
</head>
<body>

	<input id="loginfo" type="hidden" value="${loginfo}">
	
	<ul id="nav">
	    <a href="/3rd.Yebigun/"><img src="img/home2.png" alt="홈버튼" width="200"
                height="50" style="margin-left: 200px; margin-top: 10px"></a>
		<li>
		<c:if test="${loginfo==null}">
			<a class="blc" id=login href="/3rd.Yebigun/customer/login" style="margin-top: 7%">로그인</a>
		</c:if>
		<c:if test="${loginfo!=null}">
		<a href="/3rd.Yebigun/customer/logout" style="margin-top: 7px">로그아웃</a>
		<li><a id=cuDetail style="margin-top: 7%">마이페이지</a>
            <ul>
                <li><a href="/3rd.Yebigun/order/orList">주문 현황</a></li>
                <li><a href="/3rd.Yebigun/customer/customerDetailView">고객 정보</a></li>
                <li><a href="/3rd.Yebigun/customer/cusmodify">고객 정보수정</a></li>
            </ul>
        </li>
        <c:if test="${loginfo.email eq 'hikari@naver.com'}">
            <li>
            <a style="margin-top: 7%;">관리자 메뉴</a>
            <ul>
                <li><a href="/3rd.Yebigun/product/prInsert">상품 등록</a></li>
                <li><a href="/3rd.Yebigun/product/prList">상품 현황</a></li>
                <li><a href="/3rd.Yebigun/order/orList">주문 현황</a></li>
                <li><a href="/3rd.Yebigun/customer/cusList">고객 현황</a></li>
            </ul>
        </li>
        </c:if>
		</c:if>
		</li>
		<li>
			<a href="#" style="margin-top: 7%">카테고리</a>
			<ul>
			    <li><a href="/3rd.Yebigun/product/prList">상품 전체</a></li>
                <li><a href="/3rd.Yebigun/product/toyList">토이</a></li>
                <li><a href="/3rd.Yebigun/product/designList">디자인 문구</a></li>
                <li><a href="/3rd.Yebigun/product/interiorList">홈 인테리어</a></li>
            </ul>
		</li>
		<li>
			<a href="/3rd.Yebigun/customer/location" style="margin-top: 7%">매장안내</a>
		</li>
		
	
	</ul>
</body>
</html>