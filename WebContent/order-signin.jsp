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

<title>order-signin</title>
</head>
<body>
</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	<h1 align="left" style="margin-left: 300px">주문하기 (등록)</h1>
	</br>
	</br>
	
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
				<td><input type="text" id="name" style="width: 450px; height: 50px; margin-bottom: 20px;"></td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="text" id="email" style="width: 450px; height: 50px; margin-bottom: 20px;">
			</tr>
			<tr>
				<td>휴대폰 번호</td>
			</tr>
			<tr>
				<td><input type="text" id="phone" style="width: 450px; height: 50px; margin-bottom: 20px;"></td>
			</tr>
			<tr>
				<td>우편번호</td>
			</tr>
			<tr>
				<td><input type="text" id="zipcode" style="width: 450px; height: 50px; margin-bottom: 20px;"></td>
			</tr>
			<tr>
				<td>주소</td>
			</tr>
			<tr>
				<td><input type="text" id="address" style="width: 450px; height: 50px; margin-bottom: 20px;"></td>
			</tr>
			<tr>
				<td>상세주소</td>
			</tr>
			<tr>
				<td><input type="text" id="address2" style="width: 450px; height: 50px; margin-bottom: 20px;"></td>
			</tr>
			<tr>
				<td>배송정보</td>
			</tr>
			<tr>
				<td><input type="text" id="diliveryinfo" style="width: 450px; height: 150px;"></td>
			</tr>
		</table>
	</div>
	
		<div style="border: 0px solid gold; float: left; width:50%; height: 800px;">
		<table align="center" width="450" border="0" style="margin-right: 400px">
			<tr>
				<td colspan="2">주문리스트/결제총액</td>
			</tr>
			<tr>
				<td colspan="2"><hr width="450" color="gray" style="height: 2px"></td>
			</tr>
			<tr>
				<td width="100" height="auto"><img src="img/daemuri2.jpg" alt="잇템오류 01" width="64"
				height="64"></td>
				<td>상품 내용이 들어갈 자리</td>
			</tr>
			<tr>
				<td><img src="img/daemuri2.jpg" alt="잇템오류 01" width="64"
				height="64"></td>
				<td>상품 내용이 들어갈 자리</td>
			</tr>
			<tr>
				<td><img src="img/daemuri2.jpg" alt="잇템오류 01" width="64"
				height="64"></td>
				<td>상품 내용이 들어갈 자리</td>
			</tr>
			<tr>
			<td colspan="2"></br></td>
			</tr>
			<tr>
				<td>장바구니 합계</td>
				<td align="right">$000,000</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td align="right">$000,000</td>
			</tr>
			<tr>
				<td>point</td>
				<td align="right">$000,000</td>
			</tr>
			<tr>
				<td colspan="2"><hr width="450" color="gray" style="height: 1px"></td>
			</tr>
			<tr>
			<td colspan="2"></br></td>
			</tr>
			<tr>
				<td>총 결제 금액</td>
				<td align="right">$000,000</td>
			</tr>
			<tr>
			<td colspan="2"></br></td>
			</tr>
			<tr>
				<td colspan="2"><button value="결제하기" style="background-color: yellow; width: 450px; height: 64px; border-radius: 1.4em;">결제하기 vs 호갱되기</button></td>
			</tr>
			
		</table>
	</div>
</body>
</html>