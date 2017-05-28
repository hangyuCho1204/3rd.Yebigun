<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="../js/jquery-3.1.0.min"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>
.upper {
	width: 20%;
	float: left;
	border: 1px;
}

.middle {
	width: 60%;
	margin-left: 16%;
}

.bottom {
	width: 61%;
	margin-left: 16%;
}

.uptable {
	width: 100%;
}

.uptable tr, td {
	padding: 5px;
}

#productex {
	width: 100%;
	border: 0;
	resize: none;
}

#deatgle {
	width: 100%;
	height: 80px;
	border: 0;
	resize: none;
}

#productinfo {
	width: 250px;
	border: 0;
	resize: none;
}

.deatgle2 tbody tr.odd {
	background: #f2f2f2
}
</style>

</head>
<body>
	<form method="get">
	<input type="hidden" value="${bean}">
	<input type="hidden" value="${img}">
	<input type="hidden" >
	
	</form>
	<div class="upper" style="margin-left: 16%">
		<a href="#"><img width="100%" height="100%" src="${img}"></a>
	</div>
	<div class="upper" style="margin-left: 50%; margin-top: 10%;">
			<table class="uptable" border="0">
			
				<tr>
					<td>제품명</td>
					<td>${bean.productName}</td>
				</tr>

				<tr>
					<td>가격</td>
					<td>${bean.price}</td>
				</tr>
				<tr>
					<td colspan="2"><hr width="100%" color="gray"
							style="height: 1px"></td>
				</tr>
				<tr>
					<td>제품 정보</td>
					<td><textarea id="productinfo" readonly="readonly">${bean.explain}</textarea></td>
				</tr>
				<tr>
					<td>개수</td>
					<td><input type="button" id="button1" width="20px"height="20px" value="-"> 
					<input type="text" name="v_prbuyea" id="v_prbuyea" style="width: 40px; ime-mode: disabled;" title="수량"value="1" maxlength="3">
					<input type="button" id="button2" width="20px" height="20px" value="+"></td>
					
				</tr>
				<form method="post" name="myform">
				<tr>
				
					<input type="hidden" name="prbuyea" value="">
				
					<td><input name="submit" type="submit" value="결제하기" style="background-color: yellow; width: 80px; height: 30px; border-radius: 1.2em;"></td>
					<td><input type="button" value="장바구니"
						style="background-color: yellow; width: 80px; height: 30px; border-radius: 1.2em;"></td>
				</tr>
				</form>
			</table>
	</div>
	<div style="clear: both"></div>
	<br>
	<br>
	<div class="middle">
		<h2>제품 상세보기</h2>
		<textarea id="productex"></textarea>
	</div>
	<br>
	<div class="middle">
		<img src="../img/daemuri2.jpg">
	</div>
	<br>
	<br>
	<div class="bottom">
		<table width="100%">
			<tr>
				<td><textarea id="deatgle" style="resize: none; border: 1px solid gray"></textarea></td>
				<td width="12px">
					<input type="button" value="댓글등록" style="background-color: yellow; width: 120px; height: 80px;">
				</td>
		</table>
		<table class="deatgle2" width="100%" border="0">
			<tr style="border-bottom: 1px solid gray;">
				<td><textarea id="deatgle"></textarea></td>
				<td width="120px" align="center">
					<button style="border: 0; padding: 0;">
						<img src="../img/bin.jpg" height="50px" width="50px">
					</button>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid gray;">
				<td><textarea id="deatgle"></textarea></td>
				<td width="120px" align="center">
					<button style="border: 0; padding: 0;">
						<img src="../img/bin.jpg" height="50px" width="50px">
					</button>
				</td>
			</tr>
		</table>
		<br> <br> <br>
	</div>
	
	<script type="text/javascript">
	
		$(function() {
			$("input[name='prbuyea']").attr("value", $("#v_prbuyea").val());
			$("#button1").click(function() {
				if(($("#v_prbuyea").val()-0)>1){
				$("#v_prbuyea").attr("value", ($("#v_prbuyea").val()-0)-1 );
				$("input[name='prbuyea']").attr("value", $("#v_prbuyea").val());
			}
			});
			$("#button2").click(function() {
				$("#v_prbuyea").attr("value", ($("#v_prbuyea").val()-0)+1 );
				$("input[name='prbuyea']").attr("value", $("#v_prbuyea").val());
			});
		})
	</script>
</body>
</html>