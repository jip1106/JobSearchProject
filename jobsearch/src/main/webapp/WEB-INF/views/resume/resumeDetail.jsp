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

dd.date {
    font-size: 19px;
    margin: auto;
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
    margin-bottom: 8px;
    color: #222;
    font-size: 23px;
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
.jv_howto .status_left {
    display: table-cell;
    position: relative;
    z-index: 2;
    width: 268px;
    text-align: center;
}
span.cn {
    margin-right: 13px;
    font-size: 17px;
    font-weight: bold;
}
span.cn2 {
    margin-right: 42px;
    font-size: 17px;
    font-weight: bold;
}
span.cna {
    font-size: 17px;
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
    padding: 9px 14px;
    border-left: 1px solid #cccccc;
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
/* 이력서 수정 */
.member_info {
    width: 100%;
    display: flex;
}
span.resume_title {
    font-size: 27px;
    font-weight: bold;
}
hr.titl_hr {
    margin-top: 6px;
}
span.memberName {
    font-size: 23px;
    font-weight: bold;
    margin-right: 7px;
}
img.emptyphoto {
    margin-right: 14px;
    border: 1px solid #e5e5e5;
}
img.photoname {
    margin-right: 14px;
}
span.base_info_span {
    font-size: 17px;
}
.email {
    font-size: 17px;
    margin-bottom: 5px;
}
.phone {
    margin-bottom: 5px;
}
.address_div {
    font-size: 17px;
}
img.icon {
    opacity: 0.7;
}
span.email_span {
    margin-left: 8px;
}
span.phone_span {
    margin-left: 8px;
}
span.address {
    margin-left: 4px;
}
.base_info {
    margin-bottom: 11px;
}
.photo_div {
    margin-right: 6px;
}
.info2 {
    border: 1px solid #ececec;;
    display: flex;
    padding: 21px 24px;
    text-align: center;
    margin-bottom: 37px;
}
.if {
    width: 145px;
    border-right: 1px solid gainsboro;
}
div#if_end {
    border-right: none;
}
.if_title {
    margin-bottom: 12px;
    font-weight: bold;
}
.school_name {
    width: 269px;
    border-right: 1px solid #cccccc;
    text-align: center;
    font-size: 18px;
    height: 43px;
    padding: 8px 0;
}
.school_cont {
    width: 65%;
    text-align: center;
    font-size: 18px;
    height: 43px;
    padding: 8px 0;
}
.table_title {
    display: flex;
    border: 1px solid #cccccc;
    background: #f1f1f1;
}
.cont.box {
    border-top: none;
    border-bottom: 1px solid #cccccc;
    border-right: 1px solid #cccccc;
    border-left: 1px solid #cccccc;
}
.comn {
    margin-bottom: 2px;
}
span.sc_name {
    font-size: 18px;
    font-weight: 700;
}
.introduce {
    margin-top: 32px;
}
.introduce_box {
    border: 1px solid #cccccc;
    padding: 9px 13px;
}
.intro_title {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 3px;
}

</style>
</head>
<body>

  <div class="container">
		<div class="card mb-4">
			<div class="card-body">			
			<div class="top_title">
				 <span class="resume_title">${myResume['RESUMETITLE']}</span>
				 <hr class="titl_hr">
				 <div class="member_info">
					<div class="photo_div">
						<c:if test="${empty myResume['PROFILE'] }">
				        	<img class="emptyphoto" src="<c:url value="/resources/images/emptyphoto.png"/>" alt="등록된 사진이 없습니다.">
		        	    </c:if>
						<c:if test="${!empty myResume['PROFILE'] }">
				        	<img class="photoname" src="<c:url value="/resources/upload_images/${myResume['PROFILE']}"/>" alt="${myResume['PROFILE']} 로고">
		        	    </c:if>
			        </div>
			        <div class="info_div">
			        	<div class="base_info">
					    	<span class="memberName">${myResume['MEMBER_NAME']}</span>
					    	<span class="base_info_span">
						    	<span class="birthday">
							    	<fmt:formatDate value="${myResume['BIRTHDAY']}" pattern="yyyy.MM.dd" />&nbsp;|&nbsp;
				    	    	</span>
						    	<span class="age">(${myResume['AGE']}세)&nbsp;|</span>
						    	<span class="gender">${myResume['GENDER_TYPE']}</span>
					    	</span>
				    	</div>
				    	<div class="email">
				    		<img class="icon" src="<c:url value='/resources/images/email.png'/>">
				    		<span class="email_span">${myResume['EMAIL']}</span>
				    	</div>
				    	
				    	<div class="phone">
				    		<img class="icon" src="<c:url value='/resources/images/phone.png'/>">
				    		<span class="phone_span">${myResume['PHONE']}</span> 
				    	</div>
				    	<div class="address_div">
				    		<img class="icon" src="<c:url value='/resources/images/address.png'/>">
				    		<span class="address">${myResume['ADDRESS']}</span>
				    		<span class="daddress">${myResume['DADDRESS']}</span>
				    	</div>
			    	</div>
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
		    
		    <div class="info2">
		    	<div class=if>
		    		<div class=if_title>경력여부</div>
		    		<div class=if_cont>${myResume['CAREER_TYPE']}</div>
		    	</div>
		    	<div class=if>
		    		<div class=if_title>최종학력</div>
		    		<div class=if_cont>${myResume['EDU_TYPE'] }</div>
		    	</div>
		    	<div class=if>
		    		<div class=if_title>희망급여</div>
		    		<div class=if_cont>${myResume['HOPE_SALARY']}</div>
		    	</div>
		    	<div class=if>
		    		<div class=if_title>희망근무형태</div>
		    		<div class=if_cont>${myResume['HOPE_EMPTYPE']}</div>
		    	</div>
		    	<div class=if id="if_end">
		    		<div class=if_title>희망근무지역</div>
		    		<div class=if_cont>${myResume['LOCATION_NAME']}</div>
		    	</div>
		    	
		    </div>

			<!-- <div class="card-footer text-muted"> -->
				<div class="jv_cont jv_howto">
					<div class="jv_title">학력사항</div>
					<div class="table_title">
						<div class="school_name">학교명</div>
						<div class="school_cont">상세내용</div>
					</div>					
					<c:forEach var="eduVo" items="${eduInfo}">
						<div class="cont box">
							<div class="status_left">
										<span class="sc_name">${eduVo['EDU_NAME']}</span>
							</div>
							
							<div class="info_company_left">
								<div class="comn"><span class="cn">재학기간:</span><span class="cna">${eduVo['PERIOD_STDT']} ~ ${eduVo['PERIOD_ENDT']}</span></div>							
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
									<div class="comn"><span class="cn">학점 : </span><span class="cna">${eduVo['UNIV_SCORE'] } /4.5</span></div>
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
					
			<div class="introduce">
			 	 <div class="jv_title">자기소개</div>
			 	 <div class="introduce_box">
				 	<div class="intro_title">[${myResume['INTRODUCE_TITLE'] }]</div> 
				 	<div class="intro_cont">${myResume['INTRODUCE_DESC'] }</div>
				 </div>
			</div>
			
					
				</div>
		<!-- 	</div> -->
			
		</div>

	</div>
	</div>
  <!-- /.container -->

	
 
</body>

</html>
