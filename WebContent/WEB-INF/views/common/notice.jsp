<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<title>Insert title here</title>

<style>
	
	#board {
		width: 60% ;
		align: center;
		background-color: #FFE4B5;
		margin-left: 20% ;
	}
	.gul {
		width: 100%;
	}
	.num {
		width: 20%;
	}
	.jemok {
		width: 60%;
	}
	.day {
		width: 20%;
	}
	#naeyong {
		border: 0;
		width: 100%;
		resize: none;
		overflow: visible;
		text-overflow:ellipsis ;
		background-color: #FFE4B5;
	}
	textarea:focus {
 		outline: none;
	}
	button:focus {
		outline: none;
	}	
	#bin {
		background: transparent ;
		border: 0;
		width : 60px ;
		height: 60px ;
		align: right ;
	}
	#write {
		font-size:24px ;
		border-radius: 0.5em ;
		background: #28A0FF	;
		border: 1 ;
		padding: 10px ;
	}
</style>
<script>
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (20+obj.scrollHeight)+"px";
}

</script>

</head>
<body>
</br>
</br>
</br>
</br>
</br>
</br>

<div id="board" class="w3-accordion">
  <button onclick="myFunction('Demo1')" class="w3-btn-block w3-center-align" style="background: gray;">
   	<table class="gul">
   		<tr>
   			<td class="num">글번호 (No.999) 같이</td>
   			<td class="jemok">제목</td>
   			<td class="day">날짜</td>
   		</tr>
   	</table>
  </button>
  <div id="Demo1" class="w3-accordion-content w3-container">
	<div align="right">
		<button id="bin"><img src="img/bin.jpg" style="height: 40px; width: 40px; border-radius: 1.1em;"></button>
	</div>
    <div>
    	<textarea id="naeyong" onkeyup="resize(this)"></textarea>
    </div>
  </div>
  <button onclick="myFunction('Demo2')" class="w3-btn-block w3-left-align">
    Open Section 2
  </button>
  <div id="Demo2" class="w3-accordion-content w3-container">
    <p>Some text..</p>
  </div>
</div>
</br>
<DIV align="right" style="margin-right: 20%;">
		<button id="write" style="font-size:24px"
		onClick="window.open('writenotice.jsp','window','width=1800, height=800');return false;"><i class="fa fa-edit" style="color: white">글쓰기</i></button>
</DIV>
</body>
</html>