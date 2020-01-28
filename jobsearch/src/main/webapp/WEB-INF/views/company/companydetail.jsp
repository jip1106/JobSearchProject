<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />
<style type="text/css">
body{
	width: 1200px;
}
#comdeHead{
	text-align: center;
}
#comdeHeadDetail{
	display:inline-block;	
}


#logos{
	float:left;
	margin-right: 40px;
}
#comNamePlate{
	
}
#details{
	 clear: both;	
	 text-align: center;
	 margin-top: 150px;
}
#detailst{
	display: inline-block;
}
.comde{
	float:left;
	border: .25px solid;
	width: 200px;
	height:200px;
	margin: 10px;
	padding-top: 70px;
}
.comde:hover{
	background:#343a40;
	color: white;
}

.in_detail {
    font-size: 35px;
    font-weight: bold;
}

#comdeMain{
	clear: both;
}
#comdeMainIndex{	
	height: 400px;
	background: #343a40;
	color:white;
}
#comdeMainCont{
		
}
#images{
	height: 400px;
    width: auto;
    margin-left: 282px;
}
tr{
	height: 50px;
}
td{
	padding:10px;
}
.tdTitle{
	font-weight: bold;
	font-size: 20px;
}
.tdDesc{
	font-weight: bold;
}

</style>


<body>
<!-- section start -->
<h1>${companyVo.comName} 기업상세보기</h1>
<div id="comdeHead">
	<div id="comdeHeadDetail">
		<div id="logos">
		<img alt="로고이미지" src="<c:url value='/resources/upload_images/${companyVo.comRenameimage}'/>" style="width: 200px;height: 200px;">
		</div>
		<table id="comNamePlate">
			<tr>
				<td>
					${companyVo.comName}|기업상세
				</td>				
			</tr>	
		</table>
	</div>	
</div>
<hr>
<div id="details">
	<div id="detailst">
		<div id="detail1" class="comde">
			<fmt:parseDate value='${companyVo.setupDate}' var='setupDate' pattern="yyyy-MM-dd"/>
			<h1 class="in_detail"><fmt:formatDate value='${setupDate}' pattern="yyyy-MM-dd"/></h1>
			<p>설립일</p>
		</div>
		<div id="detail2" class="comde">
			<h1 class="in_detail">${companyVo.comType} </h1>
			<p>기업형태</p>
		</div>
		<div id="detail3" class="comde">
			<h1 class="in_detail">${companyVo.ceoName}</h1>
			<p>CEO이름</p>
		</div>
		<div id="detail4" class="comde">
			<h1 class="in_detail">${companyVo.comSales}</h1>
			<p>매출액</p>
		</div>
		<div id="detail5" class="comde">
			<h1 class="in_detail">${companyVo.employeeNum}</h1>
			<p>사원수</p>
		</div>
	</div>
</div>
<div id="comdeMain">
<div id="comdeMainIndex">
	<img id="images" alt="회사 이미지" src="<c:url value='/resources/images/company.jpg'/>" align="absmiddle">
	<span>전화번호: ${companyVo.comTel}</span>
</div>
<div id="comdeMainCont" align="center">
	<h1>회사설명</h1>
	<span>${companyVo.comDesc}</span>
	<hr>
	<table style="text-align: center">
		<tr>
			<td class="tdTitle">업종</td>
			<td class="tdDesc">${companyVo.comField}</td>
		</tr>
		<tr>
			<td  class="tdTitle">회사 위치 </td>
			<td class="tdDesc">${memberVo.address}</td> 
		</tr>
	</table>
	<hr>
	<span>약도</span>		
	<c:import url="/company/KakaoMap.do"/>

</div>
</div>
<!-- section end -->
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>