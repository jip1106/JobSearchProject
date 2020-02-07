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
td.td1 {
    width: 71px;
    font-weight: 600;
    color: #1b2f9c;
}
td.td2 {
    width: 292px;
    height: 40px;
}
td.td3 {
    width: 292px;
    height: 40px;
}
td.td4 {
    width: 292px;
    height: 40px;
}
td.td5 {
    width: 292px;
    height: 40px;
}
tr.tr{
	border: 1px solid #444444;
}
td.td {
    width: 100px;
    border: 2px solid #5e87f1;
}
td.tdc {
    width: 100px;
    border: 2px solid #5e87f1;
    background-color: #e1f1ff;
}
table.pay_type {
    margin-left: 65px;
    margin-top: 25px;
    text-align: center;
}
#TitleB{
	background: #5e87f1
}
#bt-submit:hover{
	 background: #3454a5;
}
.button {
    margin-bottom: 24px;
}
.pay_title {
    text-align: center;
    font-size: 28px;
    font-weight: 700;
    background-color: #5e87f1;
    color: white;
    height: 53px;
    padding: 6px 0px;
}
div#payDiv {
    border: 1px solid darkgrey;
    width: 437px;
    margin-left: 25%;
    margin-right: 0;
}
tr.line_tr {
    border-top: 1px solid black;
    border-bottom: 1px solid black;
}
table.pay_table {
    margin-left: 35px;
    margin-top: 13px;
}
tr.line_tr {
    border-top: 1px solid #c3c3c3;
    border-bottom: 1px solid #c3c3c3;
}
input.pdName_input {
    border: none;
}
input#currentDate {
    border: none;
}
select#purchase {
    border: none;
}
.caution {
    text-align: center;
    font-size: 14px;
    color: #E91E63;
    border: 20px 0;
    margin-top: 29px;
    margin-bottom: 29px;
}
#bt-submit {
    width: 100px;
    height: 50px;
    border-radius: .25em;
    background: #5e87f1;
    color: white;
    font-size: 17px;
    border: none;
}
body {
    padding-top: 83px;
}
</style>

</head>
<body>
	<div id="payDiv">
	<form action="<c:url value='/company/companyprepay.do'/>" method="post">
	<input type="hidden" name="refAnnouncement" value="${param.annSeq}">
		<div class="pay_title">결제서비스</div>
	<table class="pay_table">
		<tr class="line_tr">
			<td class="td1">&nbsp;상품명:</td>
			<td class="td2"><input class="pdName_input" type="text" value="프리미엄 공고글 등록" name="productName" readonly="readonly"></td>
		</tr>
		<tr class="line_tr">
			<td class="td1">&nbsp;금 &nbsp;  액:</td>
			<td class="td2">10,000원 </td>
		</tr>
		<tr class="line_tr">
			<td class="td1">&nbsp;주문자:</td>
			<td class="td2">${Name}</td>
		</tr>
		<tr class="line_tr">
			<td class="td1">&nbsp;구매일:</td>
			<td class="td2"><input type='date' class="Date_input" id='currentDate' name="priceDate" readonly="readonly"/></td>
		</tr>		
	</table>	  
		
  <!-- <hr>  
  <div id="total">
  	<br>
  		<p align="right">결제하실 금액 : 10,000원 </p>
  	<br>
  </div>
  <hr> -->
  <table class="pay_type">
  		<tr class="tr">
	  		<td class="tdc">결제방식</td>
	  		<td class="td">
		  		<select id="purchase" name="payType" style="width: 197px">
		  			<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택하세요</option>
		  			<option value="inicis">
		  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  			이니시스</option>
		  			<option value="danal">
		  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  			다날</option>
		  			<option value="LG">
		  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  			LG U+</option>
		  		</select>
	  		</td>
  		</tr>
  		<tr>
			<td class="tdc">할부개월</td>
			<td class="td">일시불</td>
		</tr>
  </table>
  <div class="caution">*결제하실 방식을 반드시 선택 후 결제를 진행해 주세요.</div>
  <div class="button" align="center">
  	<input id="bt-submit" type="submit" value="결제하기" >
  </div>
  </form>
<script>
  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
</script>
</div>
</body>

</html>
