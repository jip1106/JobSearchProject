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
	margin-left:50px;
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
</style>

</head>
<body>
	<form action="<c:url value='/company/companyprepay.do'/>" method="post">
	<input type="hidden" name="refAnnouncement" value="${param.annSeq}">
	<h1>결제하기</h1>
	<table>
		<tr>
			<td>주문자</td>
			<td>${Name}</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" value="프리미엄 공고글 등록" name="productName"></td>
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
	  		<select id="purchase" name="payType">
	  			<option value="">선택하세요</option>
	  			<option value="카드">카드</option>
	  			<option value="핸드폰">핸드폰</option>
	  			<option value="카카오페이">카카오페이</option>
	  		</select>
  		</td>
  	</tr>
  </table>
  <input type="submit" value="결제하기" >
  </form>
<script>
  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
</script>
</body>

</html>
