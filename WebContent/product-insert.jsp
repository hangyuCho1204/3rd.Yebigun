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
	
	<style type="text/css">
	
	.medetail {
	
	width: 450 ; 
	margin-left: 300px ;
	
	}
	
	td, tr {
    padding-right: 20px;
    }
        
    input {
    	width: 500px ;
    	border: 1;
    	margin-top: 3px ;
    	margin-bottom: 3px ;
    }
    
    textarea {
    	
    	width: 500px ;
    	height: 150px ; 
    	resize: none ;
    	border: 1 ;
    }
    
    button.btn1 {
    
    	height: 25px ;
    	width: 130px ;
    	border-radius: 1.2em;
    }
    
    button.btn2 {
    	 background: yellow; 
    	 width: 120px; 
    	 height: 50px; 
    	 border-radius: 1.2em;
    }
    
    div.icons {
    	margin-left: 29% ;
    	margin-top: 5% ;
    }
	</style>
	
	<script type="text/javascript">
$(function(){
	
	$("#click").click(function(){	
		window.open("modcancle.jsp", "modify canceled", "width=800,height=300");
		
		return false;
	}); 
	
	$("#imginsert").click(function(){	
		window.open("modcancle.jsp", "Image insert", "width=800,height=300");
		
		return false;
	}); 
	
});
</script>

<title>product insert</title>
</head>
<body>
</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	<h1 align="left" style="margin-left: 300px">제품등록_관리자 </h1>
	</br>
	
	<div>
		<table class="medetail">
			
			<tr>
				<th colspan="2"><hr width="100%" color="gray" style="height: 2px"></th>
			</tr>
			<tbody>
			<tr>
				<td>상품 ID</td>
				<td><input class="info" type="text" id="name"></td>
			</tr>
			<tr class="odd">
				<td>상품명</td>
				<td><input class="info" type="text" id="name"></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><input class="info" type="text" id="name"></td>
				<td><button class="btn1" value="이미지 등록" id="imginsert">이미지 등록</button></td>
			</tr>
			<tr class="odd">
				<td>상품가격</td>
				<td><input class="info" type="text" id="name"></td>
			</tr>
			<tr>
				<td>재고 수량</td>
				<td><input class="info" type="text" id="name"></td>
			</tr>
			<tr>
				<td>제품 규격</td>
				<td><input class="info" type="text" id="name"></td>
			</tr>
			
			<tr>
				<td>구매 가능 여부</td>
				<td>
				<input class="info" type="text" id="name">
				</td>
			</tr>
			<tr class="odd">
				<td>판매된 수량</td>
				<td><input class="info" type="text" id="name"></td>
			</tr>
			<tr class="odd">
				<td>상품 설명</td>
				<td><textarea class="info" type="textarea" id="name"></textarea></td>
			</tr>
			</tbody>
		</table>
		</div>
		<div class="icons">
			<button class="btn2" value="제품등록">제품 등록</button>
			<button class="btn2" value="등록 취소" id="click">등록 취소</button>
		</div>
	
		
</body>
</html>