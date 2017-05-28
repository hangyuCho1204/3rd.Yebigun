<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/3rd.Yebigun/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	 
	$(function(){
		$("#bu1").click(function(){
			$.ajax({
				url : "/3rd.Yebigun/customer/login",
				type : "post",
				data : $("form[name='form1']").serialize(),
				success : function(data) {
					alert(data);
					if(data=="로그인 성공"){
						location.href="/3rd.Yebigun/customer/close";
					}else{
						location.href="/3rd.Yebigun/customer/close";
					}
				},
				error : function(error) {
					alert(error.statusText);
				}
			});
		});
		
	});
	$(function(){
		$("#bu2").click(function(){
			window.location.href="cuInsert";
		});
		
	});
</script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>



	<form name="form1" class="form-inline" method="post" action="login">
		<div class="form-group">
			<label for="email">Email:</label><br>
			<input name="email" class="form-control" type="text" value="hikari@naver.com"/><br>
		</div><br>
		<div class="form-group">
			
			<label for="passwd">password:</label><br>
			<input name="passwd" class="form-control" type="password"/><br>
		</div>
			
			
	</form>
	<br>
	<input id="bu1" type="button" class="btn btn-default" value="로그인 ">
	<input id="bu2" type="button" class="btn btn-default" value="회원가입">
	
</body>
</html>