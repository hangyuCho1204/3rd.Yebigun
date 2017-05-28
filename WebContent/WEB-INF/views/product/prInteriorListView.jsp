<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<title>here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
.w3-sidenav a,.w3-sidenav h4 {font-weight:bold}
 .orderlist {
            width: 980px;
            border: 1;
        }
        .orderlist th {
            text-align: center;
        }
        
        .orderlist tbody tr:hover {
            background:#F3F5BB
        }
        .orderlist tbody tr.odd:hover {
            background:#F3F5BB
        }
        
        .orderlist tbody tr.odd {
            background:#f2f2f2
        }
        
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px" >

<!-- Sidenav/menu -->
<br>
<br>
<br>
<br>


<!-- !PAGE CONTENT! -->
<div class="orderlist" style="margin-left: 300px"  align="center">

  <!-- Header -->
  <header class="w3-container" id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>홈 인테리어 목록</b></h1>
  </header>
  
   <!-- First Photo Grid-->
  <div class="w3-row-padding">
  <c:forEach var="bean" items="${lists}" >
     <div class="w3-third w3-container w3-margin-bottom">
     <c:forEach var="be" items="${bean.imgName}">
      <img src="file:///C:/pic/${bean.imgName}" alt="Norway" style="width:100%" class="w3-hover-opacity">
     </c:forEach>
      <div class="w3-container w3-white">
        <p><b><a href="/3rd.Yebigun/product/prDetail?productId=${bean.productId}&productName=${bean.productName}&categoryId=${bean.categoryId}&price=${bean.price}
 						&stock=${bean.stock}&prosize=${bean.prosize}&prodate=${bean.prodate}&buyYn=${bean.buyYn}
 						&explain=${bean.explain}&count=${bean.count}&imgName=${bean.imgName}">${bean.productName}</a></b></p>
        <p>가격 : ${bean.price}</p>
      </div>
    </div>
  </c:forEach>
  </div>
  

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <ul class="w3-pagination">
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/product/interiorList?selectPage=1">첫페이지</a></li>
      <c:if test="${selectpage > 1}" >
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/product/interiorList?selectPage=${selectpage-1}">«</a></li>
      </c:if>  
      <c:forEach var="page" begin="1" step="1" end="${endpage}">
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/product/interiorList?selectPage=${page}">${page}</a> </li>
      </c:forEach>
      <c:if test="${selectpage < endpage}" >
      <li> <a class="w3-hover-black" href="/3rd.Yebigun/product/interiorList?selectPage=${selectpage+1}">»</a></li>
      </c:if>
      <li><a class="w3-hover-black" href="/3rd.Yebigun/product/interiorList?selectPage=${endpage}">마지막페이지</a> </li>
    </ul>
  </div>
  
</div>

<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
