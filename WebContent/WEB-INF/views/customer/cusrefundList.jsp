<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<title>취소 교환 반품</title>
	
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
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	<h1 align="left" style="margin-left: 297px">주문 목록</h1>
	</br>
	
	
	
		<table class="orderlist" align="center" border="0" >
			<thead>
			<tr style="padding-left: 10px; padding-right: 10px;">
				 <td align="center">번호</td>
                 <td align="center">처리타입</td>
                 <td align="center">제품ID</td>
                 <td align="center">주문번호</td>
                 <td align="center">수량</td>
                 <td align="center">신청들어온 날짜</td>
                 <td align="center">신청 이유</td>
                 <td align="center">처리 상태</td>
                 
			</tr>
			<tr>
				<th colspan="8"><hr width="990" color="gray" style="height: 1px; padding-top: -5px;"/></th>
			</tr>
			</thead>
			<tbody>
            <c:forEach var="list" items="${refund}">
				<tr class="odd">
				<td align="center">${list.refundSeq}</td>
                                <td align="center">${list.requestType}</td>
                                <td align="center">${list.product_id}</td>
                                <td align="center">${list.order_number}</td>
                                <td align="center">${list.stock}</td>
                                <td align="center">${list.receiptdate}</td>
                                <td align="center">${list.note}</td>
                                <td align="center">${list.proc_state}</td>
                                <td align="center">
                                 <a href="redelete?refundSeq=${list.refundSeq}">삭제</a>
                                </td>
				</tr>
                                </c:forEach>
                                
			</tbody>
			
   
		</table>
   <div class="w3-center w3-padding-32">
    <ul class="w3-pagination">
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/customer/customerrefundList?selectPage=1">첫페이지</a></li>
      <c:if test="${selectpage > 1}" >
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/customer/customerrefundList?selectPage=${selectpage-1}">«</a></li>
      </c:if>  
      <c:forEach var="page" begin="1" step="1" end="${endpage}">
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/customer/customerrefundList?selectPage=${page}">${page}</a> </li>
      </c:forEach>
      <c:if test="${selectpage < endpage}" >
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/customer/customerrefundList?selectPage=${selectpage+1}">»</a></li>
      </c:if>
      <li><a class="w3-hover-black" href="/3rd.Yebigun/customer/customerrefundList?selectPage=${endpage}">마지막페이지</a> </li>
    </ul>
  </div> 
	   </br>
	   </br>	

<%@ include file="../common/footer.jsp" %>
</body>
</html>