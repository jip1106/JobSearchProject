<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>JobSearch</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/resources/css/modern-business.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume.css'/>">
<style type="text/css">
body{
	margin-left:234px;
	width: 400px;
}

table#payname{
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
}
tr{
	border: 1px solid #444444;
}
td{
	width:200px;
	border: 1px solid #444444;
}
#TitleB{
	background: #5e87f1
}
h1{
	color:white;
	font-size: 29px;
}
#bt-submit{
	width: 110px;
    height: 41px;
    border-radius: .25em;
    background: #5e87f1;
    color: white;
    font-size: 20px;
    border: none;

}
#bt-submit:hover{
	 background: #3454a5;
}

</style>

</head>
<body>
	<div id="payDiv">
	<form action="<c:url value='/company/companyprepay.do'/>" method="post">
	<input type="hidden" name="refAnnouncement" value="${param.annSeq}">
	<div id="TitleB">
		<h1>프리미엄 결제</h1>
	</div>
	<table>
		<tr>
			<td>주문자</td>
			<td>${Name}</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" value="프리미엄 공고글 등록" name="productName" readonly="readonly"></td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td>10000원 </td>
		</tr>
		<tr>
		
			<td>구매일</td>
			<td><input type='date' id='currentDate' name="priceDate" readonly="readonly"/></td>
		</tr>		
	</table>	  
  <hr>  
  <div id="total">
  	<br>
  		<p align="right">결제하실 금액 : 10,000원 </p>
  	<br>
  </div>
  <hr>
  <table>
  	<tr>
  		<td>구매방식</td>
  		<td>
	  		<select id="purchase" name="payType" style="width: 197px">
	  			<option value="">선택하세요</option>
	  			<option value="inicis">이니시스</option>
	  			<option value="danal">다날</option>
	  			<option value="LG">LG U+</option>
	  		</select>
  		</td>
  	</tr>
  </table>
  <br>
  <div align="center">
  <input id="bt-submit" type="submit" value="결제하기" >
  </div>
  </form>
<script>
  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
</script>
</div>
</body>

</html>
