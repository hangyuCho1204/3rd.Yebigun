<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	<h1 align="left" style="margin-left: 297px">주문 목록</h1>
	</br>
	
	<div class="search" align=left style="margin-left: 297px">
		<INPUT TYPE=text NAME=howmany SIZE=20 VALUE='0000개 검색됨' READONLY style="border: 0">
		<div align="right" style="margin-right: 310px">
		 <select name="searchorder" style="height: 26px;">
		 	<option value="신상품순" selected="selected">전체</option>
    		<option value="높은가격순">상품명</option>
    		<option value="낮은가격순">주문번호</option>
    		<option value="낮은가격순">주문일자</option>
		 </select>
		 <input type=text name=productname label="상품명" size=30>
		 <input type="button" value="검색">
		 </div>
	</div>
	</br>
	</br>
		<table class="orderlist" align="center">
			<thead>
			<tr style="padding-left: 65px; padding-right: 65px;">
				<th>주문번호</th>
				<th>주문일자</th>
				<th>상품명</th>
				<th>총 결제 금액</th>
				<th>배송비</th>
			</tr>
			<tr>
				<th colspan="5"><hr width="980" color="gray" style="height: 1px; padding-top: -5px;"/></th>
			</tr>
			</thead>
			<tbody>
				<tr class="odd">
				<td align="center">000</td>
				<td align="center">870528</td>
				<td align="center">문명6 스페셜 에디션</td>
				<td align="right">99,999,999</td>
				<td align="right">78,956,464</td>
				</tr>
				<tr>
				<td align="center">001</td>
				<td align="center">870628</td>
				<td align="center">지옥의 토마토 다이어트 50kg세트</td>
				<td align="right">88,888,888</td>
				<td align="right">65,384</td>
				</tr>
			</tbody>
		</table>	
	</br>
	</br>	
		<div class="errimg" align="center"><img src="img/error.png" width="600px" height="250px" alt="에러"></div>

</body>
</html>