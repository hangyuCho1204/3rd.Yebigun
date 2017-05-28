<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>basket</title>
	
<style>
	.basket tbody tr:hover {
			background:#F3F5BB
		}
	.basket tbody tr.odd:hover {
			background:#F3F5BB
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
    
	<h1 align="left" style="margin-left: 297px">장바구니</h1>
	</br>
	<div> 
	<input TYPE="text" NAME=qwer SIZE=50 VALUE='총 0000개의 상품이 있습니다.' READONLY style="border: 0; margin-left: 300px;">
	</div>
 	<hr width="996" color="gray" style="height: 2px; margin-right: 306px;" >
	<table class="basket" width="990" cellspacing="0"
		cellpadding="0" border="0" align="center">
		<tbody>
		<tr height="128">
			<td align="center" width="30"><input type="checkbox" height="20" width="20"></td>
			<td width="64"><img src="img/ititem1.jpg" alt="잇템오류 01" width="96"
				height="96" style="margin-bottom: 10px;"></td>
			<td width="600">상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명</td>
			<td align="center">
			<div class="quantity">											
				<a href="javascript:;" onclick="javascript:eaUpDown(-1);">
				<img src="img/minus.png" width="20px" height="20px">
				</a>
				<input type="text" name="v_prbuyea" id="v_prbuyea" onkeyup="eacheck(this);" onkeydown="return onlyNumber2(event);" style="width: 40px; ime-mode:disabled;" title="수량" value="1" maxlength="3">
				<a href="javascript:;" onclick="javascript:eaUpDown(1);">
				<img src="img/plus.png" width="20px" height="20px">
				</a>	
			</div>
			</td>
		</tr>
		<tr class="odd" height="128">
			<td align="center" width="30"><input type="checkbox" height="20" width="20"></td>
			<td width="64"><img src="img/ititem1.jpg" alt="잇템오류 01" width="96"
				height="96" style="margin-bottom: 10px;"></td>
			<td width="600">상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명</td>
			<td align="center">
			<div class="quantity">											
				<a href="javascript:;" onclick="javascript:eaUpDown(-1);">
				<img src="img/minus.png" width="20px" height="20px">
				</a>
				<input type="text" name="v_prbuyea" id="v_prbuyea" onkeyup="eacheck(this);" onkeydown="return onlyNumber2(event);" style="width: 40px; ime-mode:disabled;" title="수량" value="1" maxlength="3">
				<a href="javascript:;" onclick="javascript:eaUpDown(1);">
				<img src="img/plus.png" width="20px" height="20px">
				</a>	
			</div>
			</td>
		</tr>
		</tbody>
	</table>
	<hr width="996" color="gray" style="height: 2px; margin-right: 306px;">
	<div align="right" style="margin-right: 19%;">
	<input type="text" value="장바구니 합계" style="border:none;">
	<input type="text" name="baskettotal" value="$ 98,657,642,865" border="0" style="text-align: right; border:none;">
	</div>
	</br>
	</br>
	<div align="center" style="margin-right: 2%">
		<table border="0" width="65%" height="60px">
			<tr align="right">
				<td><a href="#">
				<button value="결제하기" style="background-color: yellow; width: 50%; height: 100%; border-radius: 1.4em;">선택항목 삭제</button>
				</a></td>
				
				<td><a href="#">
				<button value="결제하기" style="background-color: yellow; width: 50%; height: 100%; border-radius: 1.4em;">쇼핑 계속하기</button>
				</a></td>
				
				<td><a href="#">
				<button value="결제하기" style="background-color: yellow; width: 50%; height: 100%; border-radius: 1.4em;">주문하기</button>
				</a></td>
			</tr>
		</table>
	</div>
	</br>
	</br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>