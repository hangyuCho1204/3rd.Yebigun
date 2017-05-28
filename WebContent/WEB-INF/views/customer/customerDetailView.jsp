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
    	border: 0;
    	margin-top: 3px ;
    	margin-bottom: 3px ;
    	outline: none;
    }
    
    textarea {
    	
    	width: 500px ;
    	height: 50px ; 
    	resize: none ;
    	border: 0 ;
    	outline: none;
    }
    
    button {
    	 background: yellow; 
    	 width: 120px; 
    	 height: 50px; 
    	 border-radius: 1.2em;"
    }
    
    div.icons {
    	margin-left: 29% ;
    	margin-top: 5% ;
    }
	</style>
	
	<script type="text/javascript">
$(function(){
	
	$("#click").click(function(){	
		window.location.href="cusutomerdelete";
	}); 
	$("#modi").click(function(){  
        window.location.href="/3rd.Yebigun/customer/cumodify";
    }); 
	
});
</script>

<title>Member Detail</title>
</head>
<body>
</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	<h1 align="left" style="margin-left: 300px">회원 상세보기</h1>
	</br>
	
	<div>
		<table class="medetail">
			
			<tr>
				<th colspan="2"><hr width="100%" color="gray" style="height: 2px"></th>
			</tr>
			<tbody>
			<tr style="padding-left: 10px; padding-right: 10px;">
                <td align="left">이름</td>
                <td align="center">${detailView.name}</td>
            </tr>
            <tr class="odd">
                <td align="left">이메일</td>
                <td align="center">${detailView.email}</td>
            </tr>
            <tr>
                <td align="left">휴대폰 번호</td>
                <td align="center">${detailView.phone}</td>
            </tr>
            <tr class="odd">
                <td align="left">우편번호</td>
                <td align="center">${detailView.address1}</td>
            </tr>
            <tr class="odd">
                <td align="left">상세 주소</td>
                <td align="center">${detailView.address2}</td>
            </tr>
            <tr class="odd">
                <td align="left">포인트</td>
                <td align="center">${detailView.mpoint}</td>
            </tr>
			</tbody>
		</table>
		</div>
		<div class="icons">
			<button value="회원 탈퇴" id="click">회원 탈퇴</button>
		</div>
<br>
<br>	
<%@ include file="../common/footer.jsp" %>		
</body>
</html>