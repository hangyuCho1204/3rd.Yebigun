<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/3rd.Yebigun/js/jquery-3.1.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
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
   <br>
   <br>
   <h1 align="left" style="margin-left: 297px">주문 목록</h1>
   <br>
   
   <div class="search" align=left style="margin-left: 297px">
      <!-- <INPUT TYPE=text NAME=howmany SIZE=20 VALUE='0000개 검색됨' READONLY style="border: 0"> -->
      <!-- <div align="right" style="margin-right: 310px">
       <select name="searchorder" style="height: 26px;">
          <option value="신상품순" selected="selected">전체</option>
          <option value="높은가격순">상품명</option>
          <option value="낮은가격순">주문번호</option>
          <option value="낮은가격순">주문일자</option>
       </select>
 		<input type=text name=productname label="상품명" size=30>
       <input type="button" value="검색">

       </div> -->
   </div>
   <br>
   <br>
      <table class="orderlist" align="center">
         <thead>
         <tr style="padding-left: 65px; padding-right: 65px;">
            <th>주문번호</th>
            <th>주문일자</th>
            <th>상품명</th>
         </tr>
         <tr>
            <th colspan="5"><hr width="980" color="gray" style="height: 1px; padding-top: -5px;"/></th>
         </tr>
         </thead>
         <tbody>
         
         <c:forEach var="bean" items="${lists}">
         
            <tr class="odd">
            	<td align="center">${bean.orderNumber}</td>
            	<td align="center">
            	<a id="goOrDetail" href="/3rd.Yebigun/order/orDetail?id=${bean.orderNumber}">${bean.orderDate}</a>
            	<input id="param" type="hidden" > 
            	</td>
            	<td align="center">${bean.email}</td>
            </tr>
         </c:forEach>
            
         </tbody>
      </table>  
       <div class="w3-center w3-padding-32">
    <ul class="w3-pagination">
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/order/orList?selectPage=1">첫페이지</a></li>
      <c:if test="${selectpage > 1}" >
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/order/orList?selectPage=${selectpage-1}">«</a></li>
      </c:if>  
      <c:forEach var="page" begin="1" step="1" end="${endpage}">
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/order/orList?selectPage=${page}">${page}</a> </li>
      </c:forEach>
      <c:if test="${selectpage < endpage}" >
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/order/orList?selectPage=${selectpage+1}">»</a></li>
      </c:if>
      <li><a class="w3-hover-black" href="/3rd.Yebigun/order/orList?selectPage=${endpage}">마지막페이지</a> </li>
    </ul>
  </div>  
   <br>
   <br>   
      <div class="errimg" align="center"><img src="img/error.png" width="600px" height="250px" alt="에러"></div>
	<script type="text/javascript">
	$(function(){
		
		$("#goOrDetail").click(function() {
			$("#param").attr("value", $("#goOrDetail").val());
			alert($("#goOrDetail").val());
					 window.open("/3rd.Yebigun/order/orDetail?id="+$("#param").val(), "window",
							"width=800,height=300");
					return false;
			});
	});
	
		
	</script>
</body>
</html>