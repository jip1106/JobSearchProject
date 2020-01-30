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

</style>

</head>
<body>
	<h1>지원자 리스트</h1>
	<table>
		<tr>
			<td>이력서 제목</td>
			<td>지원날짜</td>
			<td></td>
		</tr>
		<c:if test="${empty list}">
		<tr>
			<td colspan="2">
			 	아직 아무도 지원하지않았어요..
			</td>
		</tr>		
		</c:if>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>
					${vo.resumeTitle}
				</td>
				<td>${vo.introduceTitle }</td>
			</tr>
		</c:forEach>
	</table>
</body>

</html>
