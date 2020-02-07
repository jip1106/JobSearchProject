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
.complete_premium {
    border: 2px solid #d0d0d0;
    border-radius: 4px;
    width: 25em;
    padding: 56px 0;
}
.layout {
    font-size: 26px;
    font-weight: 600;
}
img.complete {
    margin-bottom: 52px;
}
span.text {
    color: #487aeb;
}.Thankyou {
    margin-top: 30px;
    font-size: 18px;
    background-color: #ececec;
    width: 279px;
    text-align: left;
    padding: 16px 22px;
}
body {
    padding-top: 95px;
}
.Thankyou {
    margin-top: 30px;
    font-size: 16px;
    letter-spacing: 1px;
    background-color: #f1f1f1;
    width: 279px;
    text-align: left;
    padding: 22px 28px;
}
</style>
</head>
<body>
	<div align="center">
		<div class="complete_premium">
			<img class="complete" src="<c:url value='/resources/images/complete.png'/>">
			<div class="layout">
				<span class="text">결제가 완료</span>
				<span class="text2">되었습니다.</span>
			</div>
			<div class="Thankyou">프리미엄공고등록을 이용해주셔서 감사합니다.</div>
		</div>
	</div>
</body>

</html>
