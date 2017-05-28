<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<style type="text/css">
  		.form-control{
  			width: 186px;
  		}
  		.form-group{
  			margin-bottom: 0px;
  		}
  	</style>
</head>
<body>
	<label><h1>회원정보 수정</h1></label>
	<hr>
	<form name="form2" class="form-inline" method="post" action="cumodify">
		<div class="form-group">
			<label for="email">이메일:</label><br>
			<input name="email" class="form-control" type="text" value="${cumodify.email }" readonly="readonly">
		</div><br>
		<div class="form-group">
		<label for="name">이름:</label><br>
			      <input name="name" class="form-control" type="text" value="${cumodify.name }" readonly="readonly">
		</div><br>
		<div class="form-group">
		<label for="phone">휴대폰:</label><br>
			   <input name="phone" class="form-control" type="text">
		</div><br>
		<div class="form-group">
		<label for="post">우편번호:</label><br>
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input id="sample6_postcode" name="post" class="form-control" type="text" placeholder="우편번호" readonly="readonly">
	</div><br>
		<div class="form-group">
		<label for="address1">주소 :</label><br>
			     <input id="sample6_address1" name="address1.2" class="form-control" type="text" placeholder="주소" readonly="readonly">
			     <input id="sample6_address" name="address1" type="hidden">
		</div><br>
		<div class="form-group">
		<label for="address2">상세주소:</label><br>
			<input id="sample6_address2" name="address2" class="form-control" type="text" placeholder="상세주소">
		</div><br>
		<input id="submit" type="submit" class="btn btn-default" value="가입">
	</form>
	<br>
	<br>
<%@ include file="../common/footer.jsp" %>
</body>

 <script type="text/javascript">
		$(function(){
			$("#idcheck").click(function(){
				$.ajax({
					url : "/3rd.Yebigun/customer/cuIdcheck",
					type : "get",
					data : "email="+$("input[name='email']").val(),
					success : function(data) {
						$("#check").html(data);
					},
					error : function(error) {
						alert(error.statusText);
					}
				});

				return false;
			});
		});
		$(function(){
			
				$("form[name='form2']").submit(function(){
				var result = false;
				
				//email 유효성 검사
				var reg = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
				if(!reg.test($("input[name='email']").val())){
					alert("이메일을 다시 입력 해주세요.");
					$("input[name='email']").focus();
				}else{
					result = true;
				}
			
				// 휴대 전화번호 유효성 검사
				if(result==true){
					var reg = /(010|011|016|019)-\d{3,4}-\d{4}/;
					if(!reg.test($("input[name='phone']").val())){
						alert("휴대폰 번호 다시 입력 해주세요.");
						$("input[name='phone']").focus();
						result = false;
					}	
				}
				
				//우편번호 검사
				if(result==true){
					var reg = /^[0-9]{3,5}$/;
					if(!reg.test($("input[name='post']").val())){
						alert("우편번호를 다시 입력 해주세요.");
						$("input[name='post']").focus();
						result = false;
					}	
				}
			
				//주소 유효성 검사
				if(result==true){
					var reg = /^[가-힣0-9a-zA-Z-\/\s\.\0(),]{3,50}$/;
					if(!reg.test($("input[name='address1.2']").val())){
						alert("주소을 다시 입력 해주세요.");
						$("input[name='address1']").focus();
						result = false;
					}else if(!reg.test($("input[name='address2']").val())){
						alert("세부주소를 다시 입력 해주세요.");
						$("input[name='address2']").focus();
						result = false;
					}else{
						result = true;
					}
				}
				return result;
			});

	});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
 
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = data.zonecode+' '+fullAddr;
                document.getElementById('sample6_address1').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</html>