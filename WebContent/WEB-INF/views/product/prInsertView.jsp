<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>

</head>
<body>
<br>
<br>
<br>
<br>
	<div align="left"><h4>장난감 상품등록</h4></div>
	<div style="height: 600px;">
	<form name="myform" method="post" enctype="multipart/form-data" >
	
	<!--
	to : toy
	ds : design stationary
	hi : home interior
	 -->
	 <!-- <input name="fakecategoryId" type="text" readonly="readonly" value="ss"> -->
	<table align="left">
	<tr align="center">
	<td align="left">
	<label>상품ID</label><br>
	<select name="productId1" >
		<option id="def" selected="selected" value="se" >선택</option>
		<option id="토이" value="to">토이</option>
		<option id="디자인문구" value="ds">디자인문구</option>
		<option id="홈인테리어" value="hi">홈인테리어</option>
	</select>
	<input name="productId2" type="text"><span>숫자는 항목 별 다음에 들어가야할 숫자 임</span><br>
	<label>상품명</label><br><input name="productName" type="text" value="자동차"><br>
	<label>상품이미지</label><br><input name="imgName" type="file">
	
	<input name="categoryId" type="hidden"><br>
	<label>상품가격</label><br><input name="price" type="text" value="4000"><br>
	<label>재고수량</label><br><input name="stock" type="text" value="200"><br>
	<label>제품규격</label><br><input name="prosize" type="text" value="200*100*50"><br>
	<input name="prodate" type="hidden" value=" ">
	<input name="imgPath" type="hidden">
	<label>구매가능여부</label><br><input name="buyYn" type="text" value="Y"><br>
	<label>판매된 수량</label><br><input name="count" type="text" value="100"><br>
	<label>상품설명</label><br><textarea name="explain" cols="50" rows="10">gg</textarea><br>
	<input type="submit" value="등록"><br>
	</td>
	</tr>
	</table> 
	</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	 $(function(){
				
		$("form[name='myform']").submit(function(){
			$("input[name='imgPath']").attr("value","c:\\\\pic\\\\"+$(this).val());
			$("select[name='productId1']>option").each(function(){
				 if($("select[name='productId1']").val()==$(this).val()){
					$("input[name='fakecategoryId']").attr("value",$(this).attr("id"));
					$("input[name='categoryId']").attr("value",$(this).attr("id"));
				 }
			});
			return true;
		});
		
		
		$("select[name='productId1']").change(function(){
			
			$.ajax({
				url : "/3rd.Yebigun/product/idNumCreater",
				type : "post",
				data : "item="+$("select[name='productId1']").val(),
				success : function(data) {
					$("input[name='productId2']").attr("value", data);
				},
				error : function(error) {
					alert(error.statusText);
				}
				
			});
		});
		
		$("input[name='productId2']").blur(function(){
			 $("select[name='productId1']>option").each(function(){
				 if($("select[name='productId1']").val()==$(this).val()){
					$("input[name='fakecategoryId']").attr("value",$(this).attr("id"));
					$("input[name='categoryId']").attr("value",$(this).attr("id"));
					
				} 
			});
		});
		
		$("input[name='productId1']").change(function(){
			 $("select[name='productId1']>option").each(function(){
				 if($("select[name='productId1']").val()==$(this).val()){
					$("input[name='fakecategoryId']").attr("value",$(this).attr("id"));
					$("input[name='categoryId']").attr("value",$(this).attr("id"));
					
				} 
			});
		});
	 });
	
</script>
</body>

</html>