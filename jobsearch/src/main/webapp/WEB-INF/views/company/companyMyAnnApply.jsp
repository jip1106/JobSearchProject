<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
div#ATitle {
    background-color: white;
    font-size: 29px;
    font-weight: bold;
    margin-bottom: 30px;
}
.applyer_layout {
    display: flex;
    border: 1px solid #d6d6d6;
    max-width: 60%;
    border-radius: 1px;
    margin-bottom: 7px;
    padding: 10px 10px;
}
img.picture {
    resize: both;
    height: 125px;
    margin-right: 17px;
}
span.Mname_sp {
    font-size: 16px;
    font-weight: bold;
}
.cont {
    text-align: left;
}
span.Mgender_sp {
    font-size: 15px;
    color: #848484;
}
span.Mage_sp {
    font-size: 15px;
    color: #848484;
}
.resumeTitle {
    font-size: 20px;
    font-weight: 600;
    margin: 5px 0;
}
.emptyList {
    padding: 45px 0;
    border-top: 1px solid gainsboro;
    border-bottom: 1px solid gainsboro;
    max-width: 60%;
}
</style>
<script type="text/javascript">
	function resumeView(resumeSeq, annSeq){
		window.open("<c:url value='/resume/detailResume.do?resumeSeq='/>"+resumeSeq +"&annSeq="+annSeq, resumeSeq+"번 이력서 상세보기", 
				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
</script>

</head>
<body>
<div id="applyList" align="center">
		<div id="ATitle">지원현황</div>
		<!-- <hr class="hr_line"> -->
		
		<c:if test="${empty list}">
	 		<div class="emptyList">해당공고의 지원자가 없습니다.</div>
		</c:if>
		<c:if test="${!empty list}">
		<c:forEach var="vo" items="${list}">
			<div class="applyer_layout">
				<div class="photoImg">
					<c:if test="${empty vo.profileRenameimg}">
						<img class="picture" src="<c:url value="/resources/images/emptyphoto.png"/>" alt="등록된 사진이 없습니다."> 
					</c:if>
					<c:if test="${!empty vo.profileRenameimg}">
						<img class="picture" src="<c:url value='/resources/upload_images/${vo.profileRenameimg}'/>">
					</c:if>
				</div>
				<div class="cont">
					<div class="Mname">
						<span class="Mname_sp">
							${vo.memberName}
						</span>
						<span class="Mgender_sp">
							(${vo.genderType},
						</span>
						<span class="Mage_sp">
							${vo.memberAge}세)
						</span>
					</div>
					<div class="Mmail">
						${vo.memberId}
					</div>
					<div class="resumeTitle">
						<a href="#" onclick="resumeView(${vo.resumeSeq}, ${param.annSeq })">
						<c:if test="${fn:length(vo.resumeTitle)>10}">
								${fn:substring(vo.resumeTitle, 0, 10)}...
			     			</c:if>
							<c:if test="${fn:length(vo.resumeTitle)<=10}">
			          			${vo.resumeTitle}
						</c:if>	
						</a>
					</div>
					<div class="intTitle">
						<c:if test="${fn:length(vo.introduceTitle)>14}">
								${fn:substring(vo.introduceTitle, 0, 14)}...
			     			</c:if>
							<c:if test="${fn:length(vo.introduceTitle)<=14}">
			          			${vo.introduceTitle}
						</c:if>	
					</div>
				</div>
			</div>
		</c:forEach>
		</c:if>
</div>
</body>

</html>
