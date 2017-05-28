<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
    src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>회원 리스트보기</title>
    
    <style>
        
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
</head>
<body>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
    <h1 align="left" style="margin-left: 297px">회원 목록</h1>
    <br>
    
        <table class="orderlist" align="center" border="0">
            <thead>
            <tr style="padding-left: 10px; padding-right: 10px;">
                 <td align="center">아이디</td>
                 <td align="center">이름</td>
                 <td align="center">전화번호</td>
                 <td align="center">우편번호</td>
                 <td align="center">상세주소</td>
                 <td align="center">mpoint</td>
            </tr>
            <tr>
                <th colspan="8"><hr width="990" color="gray" style="height: 1px; padding-top: -5px;"/></th>
            </tr>
            </thead>
            <tbody>
                               <c:forEach var="list" items="${customer}">
   <tr class="odd">
   <td align="center">${list.email}</td>
   <td align="center">${list.name}</td>
   <td align="center">${list.phone}</td>
   <td align="center">${list.address1}</td>
   <td align="center">${list.address2}</td>
   <td align="center">${list.mpoint}</td>
   <td align="center">
   <a href="cumodify?email=${list.email}">수정</a>
   </td>
   <td align="right">
   <a href="cusdelete?email=${list.email}">삭제</a>
   </td>
   <td align="right">
   <a href="cudetail?email=${list.email}">상세</a>
   </td>
   </tr>
   </c:forEach>                         
            </tbody>
        </table>
        
    <br>
    <br>   
    <div class="w3-center w3-padding-32">
    <ul class="w3-pagination">
      <li> <a class="w3-hover-black" href="cusList?selectPage=1">첫페이지</a></li>
      <c:if test="${selectpage > 1}" >
      <li> <a class="w3-hover-black" href="cusList?selectPage=${selectpage-1}">«</a></li>
      </c:if>  
      <c:forEach var="page" begin="1" step="1" end="${endpage}">
      <li> <a class="w3-hover-black" href="cusList?selectPage=${page}">${page}</a> </li>
      </c:forEach>
      <c:if test="${selectpage < endpage}" >
      <li> <a class="w3-hover-black" href="cusList?selectPage=${selectpage+1}">»</a></li>
      </c:if>
      <li><a class="w3-hover-black" href="cusList?selectPage=${endpage}">마지막페이지</a> </li>
    </ul>
  </div> 
<%@ include file="./common/footer.jsp" %>
</body>