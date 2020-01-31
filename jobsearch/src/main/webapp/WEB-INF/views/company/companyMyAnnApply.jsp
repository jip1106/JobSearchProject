<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
#headB{
	background: #5e87f1;
}
#Title{
	font-weight:bold;
	font-size : 40px;
	color: white;
}
table{
	width: 500px;
}
table tr td{
	border: .25px solid grey;
	width: 200px;
}
tr{
	height: 30px;

}
#tr1{
	background: #1b00ff1f;
	font-weight: bold;
	color: #000000a3;	
}
td{
	padding-left: 15px;
}
#td1{
	width: 75%;
}
#td2{
	width: 24%;
}
</style>
<script type="text/javascript">
	function resumeView(resumeSeq){
		window.open("<c:url value='/resume/detailResume.do?resumeSeq='/>"+resumeSeq, resumeSeq+"번 이력서 상세보기", 
				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
</script>

</head>
<body>
<div id="applyList" align="center">
	<div id="headB">		
		<h2 id="Title">지원자 리스트</h2>
	</div>
	<table>
		<tr id="tr1">
			<td id="td1">이력서 제목</td>			
			<td id="td2">지원 날짜</td>
		</tr>
		<c:if test="${empty list}">
		<tr>
			<td colspan="2" align="center">
			 	아직 아무도 지원하지않았어요..
			</td>
		</tr>		
		</c:if>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td id="td1">
					<a href="#" onclick="resumeView(${vo.resumeSeq})">${vo.resumeTitle}</a>
				</td id="td2">
				<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/> </td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>

</html>
