<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="./../common/header.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/3rd.Yebigun/js/jquery-3.1.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resource/css/header.css" />

<title>order List</title>
   
   <style>
      
      .orderlist {
         width: 980px;
         border: 1;
      }
      .orderlist th {
         text-align: center;
      }
      
      .orderlist tbody tr:hover {
         background:#F3F5BB
      }
      .orderlist tbody tr.odd:hover {
         background:#F3F5BB
      }
      
      .orderlist tbody tr.odd {
         background:#f2f2f2
      }
      
   </style>
</head>
<body>
   <br>
   <br>
   <br>
   <br>
   <label>주문번호        : </label><label>${bean.orderNumber}</label><br>
   <label>주문날짜         : </label><label>${bean.orderDate}</label><br>
   <label>주문자 이메일 : </label><label>${bean.email}</label><br>
   <fieldset></fieldset><br>
    <c:forEach var="be" items="${bean.oiList}">
    <label>주문항목번호: </label><label>${be.orderItemId}</label><br>
    <label>상품번호      : </label><label>${be.productId}</label><br>
    <label>주문수량      : </label><label>${be.request}</label><br>
    <label>요청사항      : </label><label>${be.orderStock}</label><br>
    <label>주문가격      : </label><label>${be.orderPrice}</label><br>
    <label>배송비         : </label><label>${be.deliveryPrice}</label><br>
    </c:forEach>
   <input id="closeBu" type="button" value="닫기">
   <script type="text/javascript">
   $(function(){
	   $("#closeBu").click(function(){
		   history.back(-1);
	   });
   });
   </script>
</body>
</html>