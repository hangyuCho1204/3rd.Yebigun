<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
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

<title>order-signin</title>
</head>
<body>
<br>
	<br>
	<h1 align="left" style="margin-left: 300px">주문하기 (등록)</h1>
	<br>
	<br>
	<form method="post">
	<div style="border: 0px solid gold; float: left; width:50%; height: 800px;">
		<table align="center" width="450" border="0" style="margin-left: 300px">
		
			<tr>
				<td colspan="2">주문/배송정보</td>
			</tr>
			<tr>
				<td colspan="2"><hr width="450" color="gray" style="height: 2px"></td>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" name="name" style="width: 450px; height: 50px; margin-bottom: 20px;" value="${member.name}"></td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="text" name="email" style="width: 450px; height: 50px; margin-bottom: 20px;" value="${member.email}">
			</tr>
			<tr>
				<td>휴대폰 번호</td>
			</tr>
			<tr>
				<td><input type="text" name="phone" style="width: 450px; height: 50px; margin-bottom: 20px;" value="${member.phone}"></td>
			</tr>
			<tr>
				<td>우편번호</td>
			</tr>
			<tr>
				<td><input type="text" name="zipcode" style="width: 450px; height: 50px; margin-bottom: 20px;" value="${post}"></td>
			</tr>
			<tr>
				<td>주소</td>
			</tr>
			<tr>
				<td><input type="text" name="address" style="width: 450px; height: 50px; margin-bottom: 20px;" value="${member.address1}"></td>
			</tr>
			<tr>
				<td>상세주소</td>
			</tr>
			<tr>
				<td><input type="text" name="address2" style="width: 450px; height: 50px; margin-bottom: 20px;" value="${member.address2}"></td>
			</tr>
			<tr>
				<td>배송정보</td>
			</tr>
			<tr>
				<td><input type="text" name="request" style="width: 450px; height: 150px;" value="ㅎㅎ"></td>
			</tr>
		</table>
	</div>
	
		<div style="border: 0px solid gold; float: left; width:50%; height: 800px;">
		<table align="center" width="450" border="0" style="margin-right: 400px">
		
			<tr>
				<td colspan="4">주문리스트/결제총액</td>
			</tr>
			<tr>
				<td colspan="4"><hr width="450" color="gray"
						style="height: 2px"></td>
			</tr>
			<tr>
				<td align="center">사진</td>
				<td align="center">품명</td>
				<td align="center">수량</td>
				<td align="center">가격</td>
			</tr>
			<c:forEach var="bean" items="shoppingBasket">
				<tr>
					<td width="100" height="auto"><img src="../img/daemuri2.jpg"alt="잇템오류 01" width="64" height="64"></td>
					<td align="center">${product.productName}</td>
					<td align="center">
						${domain.orderStock}
						<input name="qty" type="hidden" value="${domain.orderStock}">
					</td>
					<td align="right">
						${product.price}
						<input name="item" type="hidden" value="${product.price}">
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4"><br></td>
			</tr>
			<tr>
				<td>장바구니 합계</td>
				<td></td>
				<td></td>
				<td align="right">
					<label id="sbsumlb"></label>
					<input name="sbsum" type="hidden" value="">
				</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td></td>
				<td></td>
				<td align="right">
					<label>4000</label>
					<input name="dc" type="hidden" value="4000" >
				</td>
			</tr>
			<%-- <tr>
				<td>point</td>
				<td></td>
				<td></td>
				<td align="right">${member.mpoint}</td>
			</tr> --%>
			<tr>
				<td colspan="4"><hr width="450" color="gray" style="height: 1px"></td>
			</tr>
			<tr>
			<td colspan="4"><br></td>
			</tr>
			<tr>
				<td>총 결제 금액</td>
				<td align="right" colspan="3">
					<label id="totalsumlb"></label>
					<input name="totalsum" type="hidden" value="" >
				</td>
			</tr>
			<tr>
			<td colspan="4"><br></td>
			</tr>
			<tr>
				<td colspan="4">
				
				<input type="submit" id="submit" value="결제하기" style="background-color: yellow; width: 450px; height: 64px;">
			</td>
			</tr>
			
		</table>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
		
		
		$("input[name='totalsum']").attr("value", ( (($("input[name='item']").val()-0)*($("input[name='qty']").val()-0))+($("input[name='dc']").val()-0)) );
		$("#totalsumlb").html($("input[name='totalsum']").val());
		
		
		/* $("#submit").click(function(){
			location.href="/3rd.Yebigun/order/orDone"
			return false;
		}); */
	});
	</script>
</body>
</html>