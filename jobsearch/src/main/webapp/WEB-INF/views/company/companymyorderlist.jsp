<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
<style type="text/css">

table tr td{
	border: .5px solid;
}
tr td{
	height:40px;
	text-align: center;
}
.content{
	width: 100%;
}
h2{
	font-size:26px;
	font-weight: bold;
}
#ListTitle{
	background: #8080802e;
}

</style>
<script type="text/javascript">
	
</script>

<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->
<div align="center">
<h2>결제내역</h2>
<hr>
	<div class="row mb-4 mt-4_text"> 
		<!--<div class="col-lg-4-2t">공고글  </div>  -->															
		<div class="content">
		<c:forEach var="vo" items="${list}">
			<table style="width: 70%; margin: auto;">
				<tr>
					<td id="ListTitle">결제 일자</td>
					<td id="ListDesc">${vo.priceDate}</td>																													
				</tr>
				<tr>
					<td id="ListTitle">상품명</td>
					<td id="ListDesc">${vo.productName}</td>																					
				</tr>
				<tr>
					<td id="ListTitle">결제 금액</td>
					<td id="ListDesc">10,000원</td>									
				</tr>
				<tr>
					<td id="ListTitle">결제 방식</td>
					<td id="ListDesc">${vo.payType}</td>									
				</tr>									
			</table>
			<hr>
			<br>
		</c:forEach>
		</div> 							
	</div>			
</div>				
 
 <script>
</script>
<!-- collapsible function   -->
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />	
</body>
</html>
