<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/header.jsp" %>
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

<title>order-done</title>
</head>
<body>

<br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <h1 align="left" style="margin-left: 300px">주문 완료</h1>
   <br>
   <br>
   
   <div style="border: 0px solid gold; float: left; width:50%; height: 800px;">
      <table align="center" width="450" border="0" style="margin-left: 300px">
         <tr>
         <td colspan="2">결제 정보</td>
         </tr>
         <tr>
            <td colspan="2"><hr width="450" color="gray" style="height: 2px"></td>
         </tr>
         <tr>
            <td>결제 방법</td>
            <td align="right">무통장 입금</td>
            
         </tr>
         <tr>
            <td>총 주문 금액</td>
            <td align="right">${oiDto.orderPrice}</td>
         </tr>
         <tr>
            <td>배송비</td>
            <td align="right">${oiDto.deliveryPrice}</td>
         </tr>
         <tr>
            <td>최종 결제 금액</td>
            <td align="right"><label id="totalsum"></label></td>
         </tr>
         <tr>
            <td height="70"></td>
            <td></td>
         </tr>
         <tr>
            <td colspan="2">배송정보</td>
         </tr>
         <tr>
            <td colspan="2"><hr width="450" color="gray" style="height: 2px"></td>
         </tr>
         <tr>
            <td>이름</td>
            <td align="right">${member.name}</td>
         </tr>
         <tr>
            <td>주소</td>
            <td align="right">${member.address1}</td>
         </tr>
         <tr>
            <td>상세 주소</td>
            <td align="right">${member.address2}</td>
         </tr>
         <tr>
            <td>배송 메모</td>
            <td align="right">${member.mpoint}</td>
         </tr>
      </table>
   </div>
   
      <div style="border: 0px solid gold; float: left; width:50%; height: 800px;">
      <table align="center" width="450" border="0" style="margin-right: 400px">
         <tr>
            <td colspan="4">주문리스트</td>
         </tr>
         <tr>
            <td colspan="4"><hr width="450" color="gray" style="height: 2px"></td>
         </tr>
         <tr>
            <td width="100" height="auto"><img src="img/daemuri2.jpg" alt="그림" width="64"
            height="64"></td>
            <td>${oiDto.orderStock}</td>
            <td align="right"><label id="totalsum2"></label></td>
            <td align="center"><button value="후기작" style="background-color: yellow; width: 80px; height: 40px; border-radius: 1.2em;">후기 작성</button></td>
         </tr>
      </table>
   </div>
   <script type="text/javascript">
   $(function(){
	   
		$("#totalsum").html((${oiDto.orderPrice}+${oiDto.deliveryPrice}));
		$("#totalsum2").html((${oiDto.orderPrice}+${oiDto.deliveryPrice}));
	});
   </script>
</body>
</html>