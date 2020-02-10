<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />
<style type="text/css">
body{
	width: 1200px;
}
#img-logos {
    border: 1px solid #e0e0e0;
}

#details{
	 clear: both;	
	 text-align: center;
	 margin-top: 150px;
}
#detailst{
	display: inline-block;
}
.comde {
    float: left;
    /* border: .25px solid; */
    width: 200px;
    height: 200px;
    margin: 10px;
    background-color: white;
}
.comde:hover{
	background:#343a40;
	color: white;
}

.in_detail {
    font-size: 26px;
    font-weight: bold;
    text-align: center;
}

#comdeMain{
	clear: both;
}
#comdeMainIndex{	
	height: 400px;
	background: #343a40;
	color:white;
}
#images{
	height: 400px;
    width: auto;
    margin-left: 282px;
}
body {
    padding: 0;
}
.comdetailCont {
    margin-left: 22px;
}
span.cont1_span {
    font-size: 30px;
    font-weight: 700;
}
.cont2 {
    margin-top: 6px;
}
.cont3 {
    margin-top: 6px;
}
span.cont2_span {
    font-size: 18px;
    letter-spacing: 4px;
}
span.cont2_span2 {
    font-size: 18px;
}
span.cont3_span {
    font-size: 18px;
    letter-spacing: 4px;
}
span.cont3_span2 {
    font-size: 18px;
}
#details {
    clear: both;
    text-align: center;
    margin-top: 0;
    padding: 50px 0;
    height: 320px;
    background: url(/jobsearch/resources/images/building_sky.jpg) center no-repeat;
}
span.phone {
    font-size: 17px;
    margin-left: 30px;
}
img.com-img1 {
    resize: both;
    height: 104px;
    margin-top: 14px;
}
span.location {
    font-size: 30px;
    font-weight: 700;
    position: relative;
    top: 28px;
}
div#comdeHeadDetail {
    display: flex;
    margin: 50px 300px 50px 300px;
}
.comName_div {
    background-color: #4876ef;
    height: 145px;
    padding: 37px 0;
    font-size: 45px;
    text-align: center;
    font-weight: bold;
    color: white;
    text-shadow: 4px 4px 2px black;
}
</style>


<body>
<!-- section start -->
<div class="comName_div">${vo.comName} 기업상세</div>
<div id="comdeHead">
	<div id="comdeHeadDetail">
		<div id="logos">
			<img id="img-logos" alt="로고이미지" src="<c:url value='/resources/upload_images/${vo.comRenameimage}'/>" style="max-width: 300px;max-height: 150px;">
		</div>
		<div class="comdetailCont">
			<div class="cont1">
				<span class="cont1_span">${vo.comName}</span>
			</div>
			<div class="cont2">
				<span class="cont2_span">업종:</span>
				<span class="cont2_span2">${vo.comField}</span>
			</div>
			<div class="cont3">
				<span class="cont3_span">위치:</span>
				<span class="cont3_span2">${memberVo.address}</span>
			</div>
		</div>
	</div>	
</div>
<div id="details">
	<div id="detailst">
		<div id="detail1" class="comde">
			<img class="com-img1" src="<c:url value='/resources/images/comestablish.png'/>">
			<fmt:parseDate value='${vo.setupDate}' var='setupDate' pattern="yyyy-MM-dd"/>
			<div class="in_detail"><fmt:formatDate value='${setupDate}' pattern="yyyy-MM-dd"/></div>
			<p>설립일</p>
		</div>
		<div id="detail2" class="comde">
			<img class="com-img1" src="<c:url value='/resources/images/comtype.png'/>">
			<div class="in_detail">${vo.comType} </div>
			<p>기업형태</p>
		</div>
		<div id="detail3" class="comde">
			<img class="com-img1" src="<c:url value='/resources/images/comCEO.png'/>">
			<div class="in_detail">${vo.ceoName}</div>
			<p>CEO이름</p>
		</div>
		<div id="detail4" class="comde">
			<img class="com-img1" src="<c:url value='/resources/images/commoney.png'/>">
			<div class="in_detail">${vo.comSales}</div>
			<p>매출액</p>
		</div>
		<div id="detail5" class="comde">
			<img class="com-img1" src="<c:url value='/resources/images/comemployee.png'/>">
			<div class="in_detail">${vo.employeeNum}</div>
			<p>사원수</p>
		</div>
	</div>
</div>

<div id="comdeMain">
<div id="comdeMainIndex">
	<img id="images" alt="회사 이미지" src="<c:url value='/resources/images/company.jpg'/>" align="absmiddle">
	<span class="phone">전화번호: ${vo.comTel}</span>
</div>
<c:if test="${!empty memberVo.address}">
<div id="comdeMainCont" align="center">	
	<span class="location" >위치</span>	
	<c:import url="/company/KakaoMap.do"/>
</div>
</c:if>
</div>
<!-- section end -->
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>