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

  <title>${myResume['MEMBER_NAME']} 님 이력서 정보</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/resources/css/modern-business.css" rel="stylesheet">

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 

<style type="text/css">
ol#breadcrumb_id {
    padding: 17px 19px;
    background-color: #007bff;
    height: 57px;
    margin-bottom: 0px;
}
body {
    padding: 42px;
}
.container {
    max-width: 880px;
}
.col-lg-6 {
    max-width: 100%;
}
.company_title {
    display: inline-block;
    font-size: 18px;
    vertical-align: middle;
}
ol.breadcrumb {
    padding: 17px 19px;
    background-color: #ffffff;
}
.c_title {
    width: 100%;
}
.company_title2 {
    margin-top: 4px;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: -1.5px;
    line-height: 34px;
}
.cont .col {
    float: left;
    padding: 25px 0 3px;
    width: 368px;
    border-top: 1px solid #e5e6eb;
    font-size: 14px;
    letter-spacing: -0.5px;
}
.cont .col+.col {
    margin-left: 37px;
}
.cont .col>dl {
    display: block;
    position: relative;
    margin-top: 5px;
    padding-left: 109px;
    min-height: 22px;
}
.cont .col>dl>dt {
    position: absolute;
    top: 0;
    left: 0;
    color: #888;
    line-height: 23px;
    font-size: 17px;
}
.cont .col>dl>dd {
    color: #444;
    line-height: 23px;
    font-size: 17px;
}
.cont .col>dl>dd strong {
    color: #4c78ea;
    font-weight: normal;
    font-size: 17px;
}
.cont .meta {
    clear: both;
    position: relative;
    padding-top: 12px;
    border-top: 1px solid #e5e6eb;
    font-size: 0;
    line-height: 18px;
    text-align: right;
}
.cont .meta>li {
    display: inline-block;
    position: relative;
    color: #888;
    font-size: 13px;
}
.cont .meta>li>strong {
    color: #666;
    font-weight: bold;
    letter-spacing: 0;
}
.top_title {
    margin-bottom: 26px;
}
.card-body {
    padding-right:2.3em;
    padding-left:2.3em;
    padding-top: 13px;
    
}
.card-footer.text-muted_photo {
    width: 100%;
    height: 19em;
}
.card-footer.text-muted {
    background-color: white;
}
.apply_term {
    margin-bottom: 14px;
    color: #222;
    font-size: 20px;
    font-weight: bold;
    letter-spacing: -1px;
    line-height: 22px;
}
.info_timer {
    font-size: 21px;
    font-weight: bold;
    margin-bottom: 22px;
}
dt.day {
    font-size: 18px;
}
dd.date {
    font-size: 19px;
}
.cont box {
    padding: 29px 29px 0;
    border: 1px solid #ebebeb;
    border-top-color: #999;
}
.jv_cont {
    position: relative;
    z-index: 1;
}
.jv_howto {
    padding-bottom: 28px;
}
.jv_title {
    margin-bottom: 14px;
    color: #222;
    font-size: 20px;
    font-weight: bold;
    letter-spacing: -1px;
    line-height: 22px;
}
.jv_howto .cont.box {
    padding: 0;
}
.jv_cont>.box {
    padding: 29px 29px 0;
    border: 1px solid #ebebeb;
    border-top-color: #999;
}
.jv_howto .status {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 30px 0 20px;
    width: 289px;
    box-sizing: border-box;
    text-align: center;
    vertical-align: middle;
}
.jv_howto .guide {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 22px 30px;
    width: 580px;
    box-sizing: border-box;
    font-size: 14px;
    background: #f8f9fa;
}
.jv_howto .guide>dt {
    display: block;
    float: left;
    margin-top: 4px;
    width: 88px;
    color: #888;
    line-height: 28px;
}
.jv_howto .guide>dd {
    display: block;
    float: left;
    margin-top: 4px;
    width: 432px;
    min-height: 28px;
    color: #666;
    line-height: 28px;
}
.jv_howto .guide>dd.method>button, .jv_howto .guide>dd.method>a {
    display: inline-block;
    overflow: visible;
    line-height: normal;
    text-decoration: underline;
}
.jv_howto .guide {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 22px 30px;
    width: 580px;
    box-sizing: border-box;
    font-size: 14px;
    background: #f8f9fa;
}
.jv_howto .noti {
    position: absolute;
    bottom: -28px;
    left: 0;
    padding-left: 20px;
    color: #888;
    font-size: 13px;
    line-height: 28px;
}
.jv_company .wrap_info .title {
    margin-bottom: 15px;
    height: 28px;
    font-size: 0;
}
.jv_company>.box {
    padding: 24px 14px;
}
.jv_company .wrap_info {
    padding: 0 15px;
    width: 810px;
}
.jv_company .wrap_info .title {
    margin-bottom: 15px;
    height: 28px;
    font-size: 0;
}.jv_company .wrap_info .company_name {
    display: inline-block;
    overflow: hidden;
    margin-right: 5px;
    padding-right: 2px;
    max-width: 540px;
    color: #222;
    font-size: 18px;
    line-height: 25px;
    text-overflow: ellipsis;
    vertical-align: top;
    white-space: nowrap;
}
.jview .btn_jview {
    display: inline-block;
    padding: 0 9px 3px;
    height: 28px;
    border: 1px solid #e4e4e4;
    box-sizing: border-box;
    font-size: 0;
    vertical-align: top;
    background-color: #fff;
}
.jview .btn_jview span {
    color: #666;
    font-size: 13px;
    font-weight: normal;
    letter-spacing: -1px;
}
/* .jv_howto .status_left {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 30px 0 20px;
    width: 269px;
    box-sizing: border-box;
    text-align: center;
    vertical-align: middle;
    background: #efefef;
} */
.jv_howto .status_left {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 30px 0 20px;
    width: 269px;
    box-sizing: border-box;
    text-align: center;
    vertical-align: middle;
    border-right: 1px solid #bbbbbb;
}
span.cn {
    margin-right: 24px;
    font-size: 15px;
    font-weight: bold;
}
span.cn2 {
    margin-right: 42px;
    font-size: 17px;
    font-weight: bold;
}
span.cna {
    font-size: 15px;
}
.comn {
    margin-bottom: 14px;
}
.info_company {
    font-size: 18px;
    margin-bottom: 13px;
}
.info_company_left {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 30px 0px 29px 31px;
    box-sizing: border-box;
    vertical-align: middle;
}
.ci-right {
    position: relative;
    top: 21px;
}
.sri_btn_lg span.sri_btn_immediately {
    border:0;
    outline:0;
    color: #fff;
    background: #ff8d5a;
    
}
.sri_btn_lg span {
    display: inline-block;
    width: 122px;
    height: 54px;
    border: 1px solid #dce2ef;
    color: #8a92a6;
    font-family: "Malgun Gothic",sans-serif !important;
    font-size: 20px !important;
    font-weight: bold;
    letter-spacing: -2px;
    line-height: 54px;
    background: #fff;
}

button.sri_btn_lg.for_btn_event {
    border: 0;
    outline: 0;
    background-color: #ff8d59;
    position: absolute;
    left: 42em;
    top: 16px;
}
.cont .meta {
    clear: both;
    position: relative;
    padding-top: 12px;
    border-top: 1px solid #e5e6eb;
    font-size: 0;
    line-height: 18px;
    text-align: right;
    margin-bottom: -6px;
}
img.scrapY {
    resize: both;
    width: 31px;
}
img.scrapN {
    resize: both;
    width: 31px;
   
}

span.star-border {
    position: absolute;
    top: 21px;
    left: 38.2em;
    border: 1px solid #d2d2d2;
    padding: 10px 10px;
}
#modal{
	 display: none; 
     position: fixed; 
     z-index: 3;
     left: 0;
     top: 0;
     width: 100%;
     height: 100%; 
     overflow: auto; 
     background-color: rgba(0,0,0,0.4); 
}
#modal_apply {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 50%;                         
}
#apply_close{
    background: none;
    margin-left: 90%;
    margin-top: 25px;
    border: none;
}
#notEnd{
	display: none;
}
</style>
</head>
<body>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->

    <ol class="breadcrumb" id="breadcrumb_id"></ol>

    <!-- Blog Post -->
		<div class="card mb-4">
			<div class="card-body">			
			<div class="top_title">
				 <div class="c_title">
			    	<span class="company_title">${myResume['MEMBER_NAME']}님의 이력서 입니다.</span>
			     </div>			  	  	   	
			        <span class="company_title2">${myResume['RESUME_TITLE']}</span>

			        <c:if test="${loginMember.regType == 1}">
				        <div id="notEnd">
					        <c:if test="${scrapYN > 0}">
						        <span class="star-border">
						        	<img id="scrap" class="scrapY" src="<c:url value='/resources/images/yellow_star.png'/>" style="cursor: pointer;">
						        </span>
					        </c:if>
					        <c:if test="${scrapYN == 0 || empty scrapYN}">
						        <span class="star-border">
						        	<img id="scrap" class="scrapN" src="<c:url value='/resources/images/gray_star.png'/>" style="cursor: pointer;">
						        </span>
					        </c:if>
					        <button class="sri_btn_lg for_btn_event" onclick="apply()">
								<span class="sri_btn_immediately">즉시지원</span>
							</button>
						</div>
				

					</c:if>
		    </div>
		    
				<div class="cont">
					<div class="col">
						<dl>
							<dt>경력여부</dt>
							<dd>
								<strong>${myResume['CAREER_TYPE']}</strong>
							</dd>
						</dl>
						<dl>
							<dt>성별 / 최종학력 </dt>
							<dd>
								<strong>
									${myResume['GENDER_TYPE']} / ${myResume['EDU_TYPE'] }
								</strong>
							</dd>
						</dl>
					</div>
					<div class="col">
						<dl>
							<dt>희망급여</dt>
							<dd><strong>${myResume['HOPE_SALARY']}</strong></dd>
						</dl>
						<dl>
							<dt>희망근무형태</dt>
							<dd>
								<strong>${myResume['HOPE_EMPTYPE']}</strong>
							</dd>
						</dl>
						<dl>
							<dt>희망근무지역</dt>
							<dd><strong>${myResume['LOCATION_NAME']}</strong></dd>
						</dl>
					</div>
				</div>

			</div>			
			<div class="card-footer text-muted_photo">
				 <div>자기소개서</div>
				 <div>${myResume['INTRODUCE_TITLE'] }</div> 
				 <div>${myResume['INTRODUCE_DESC'] }</div>
			</div>
			
			<div class="card-footer text-muted">
				<div class="jv_cont jv_howto">
					<div class="jv_title">학력사항(상세)</div>
					
					<c:forEach var="eduVo" items="${eduInfo}">
						<div class="cont box">
							<div class="status_left">
								<dl class="info_period">
										<dd class="date">${eduVo['EDU_NAME']}</dd>
								</dl> 
							</div>
							
							<div class="info_company_left">
								<div class="info_company">
									<span class="txt">${vo.comName }</span> 
								</div>
								<div class="comn"><span class="cn">재학기간</span><span class="cna">${eduVo['PERIOD_STDT']} ~ ${eduVo['PERIOD_ENDT']}</span></div>							
								<!-- 대학교인 경우 -->
								<c:if test = "${eduVo['EDU_TYPE'] == '2' }">
									<div class="comn">
										<span class="cn">구분 : </span>
										<span class="cna">
										    <c:set var = "edutype" value = "${eduVo['UNIV_TYPE']}"/>
										       <c:choose>
										         <c:when test = "${edutype == '1'}">
										            	대학(2,3 년제)
										         </c:when>
										         <c:when test = "${edutype == '2'}">
										            	대학(4년제)
										         </c:when>
										      </c:choose>
										</span>
									</div>
									<div class="comn"><span class="cn">전공 : </span><span class="cna">${eduVo['UNIV_MAJOR'] }</span></div>
									<div class="comn"><span class="cn">학점 : </span><span class="cna">${eduVo['UNIV_SCORE'] }</span></div>
								</c:if>
								<c:if test="${eduVo['EDU_TYPE'] == '3'}">
																		<div class="comn">
										<span class="cn">구분 : </span>
										<span class="cna">
										    <c:set var = "edutype" value = "${eduVo['UNIV_TYPE']}"/>
										       <c:choose>
										         <c:when test = "${edutype == '3'}">
										            	대학원(석사)
										         </c:when>
										         <c:when test = "${edutype == '4'}">
										            	대학원(박사)
										         </c:when>
										      </c:choose>
										</span>
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
					
					
				</div>
			</div>
			
		</div>

	</div>
  <!-- /.container -->

	
 
</body>

</html>
