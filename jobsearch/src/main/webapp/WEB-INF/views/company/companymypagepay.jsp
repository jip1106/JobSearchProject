<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume.css'/>">


<style type="text/css">
table#payname{
	border: solid 1px;
}

</style>
<c:import url="/WEB-INF/views/include/headend.jsp" />
<!-- head end -->

<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />

<!-- section start -->
	<table id="payname">
		<tr>
			<td>상품1</td>
			<td>상품2</td>
			<td>상품3</td>
			<td>상품4</td>
		</tr>
	</table>
	</div>
	<div class="card mb-4-bt-edit" style="height: 800px">
		<table>
			<tr>
				<td>상품명</td>
				<td>상품이름입니당~~</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="구매하기"></td>
			</tr>
		</table>
	
      
  
    	
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
