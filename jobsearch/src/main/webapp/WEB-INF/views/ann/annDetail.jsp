<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>[${vo.comName }] ${vo.annTitle }</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/resources/css/modern-business.css" rel="stylesheet">

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 

<style type="text/css">
div#breadcrumb_id {
    padding: 8px 32px;
    background-color: #4876ef;
    height: 57px;
    margin-bottom: 0px;
    border-radius: 0;
    width: 850px;
    margin: auto;
}
body {
    padding: 42px;
    background-color: #f1f3f9;
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
    margin-left: 8px;
    margin-bottom: 5px;
}
.company_title2 {
    margin-top: 4px;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: -1.5px;
    line-height: 34px;
    margin-left: 6px;
}
.cont .col {
    float: left;
    padding: 14px 24px;
    width: 368px;
    border-top: 1px solid #e5e6eb;
    font-size: 14px;
}
.cont .col+.col {
    margin-left: 37px;
}
.cont .col>dl {
    display: block;
    position: relative;
    margin-top: 5px;
    padding-left: 102px;
    min-height: 22px;
}
.cont .col>dl>dt {
    position: absolute;
    top: 0;
    left: 0;
    color: #a2a2a2;
    line-height: 23px;
    font-size: 16px;
    font-weight: 500;
}
.cont .col>dl>dd {
    color: #777;
    line-height: 23px;
    font-size: 16px;
}
.cont .col>dl>dd strong {
    color: #4876ef;
    font-weight: normal;
    font-size: 16px;
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
    margin-top: -1px;
    margin-bottom: 14px;
}
.card-body {
    padding-right:2.3em;
    padding-left:2.3em;
    padding-top: 13px;
    padding-bottom: 4px;
    
}
.card-footer.text-muted_photo {
    width: 100%;
    height: 35em;
    overflow-y: scroll;
    min-height: 19em;
    background-color: white;
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
span#timer {
    color: #4876ef;
}
span#reamin_term {
    color: #4876ef;
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
    margin-bottom: 12px;
    color: #222;
    font-size: 20px;
    font-weight: bold;
    letter-spacing: -1px;
    line-height: 22px;
    margin-top: 4px;
    margin-left: 7px;
}
.jv_howto .cont.box {
    padding: 0;
}
.jv_cont>.box {
    padding: 29px 29px 0;
    border: 1px solid #dadada;
    margin-bottom: 10px;
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
    padding-left: 5px;
    color: #888;
    font-size: 13px;
    margin-bottom:-6px;
    text-align:right;
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
    padding: 22px 0 12px;
    width: 269px;
    box-sizing: border-box;
    text-align: center;
    vertical-align: middle;
    border-right: 1px solid #dadada;
    background-color: #f7f7f7;
}
span.cn {
    margin-right: 24px;
    font-size: 16px;
    color: #a2a2a2;
}
span.cn2 {
    margin-right: 42px;
     font-size: 16px;
    color: #a2a2a2;
}
span.cn3 {
    margin-right: 59px;
    font-size: 16px;
    color: #a2a2a2;
}
span.cna {
    font-size: 16px;
}
.comn {
    margin-bottom: 14px;
}
span.txt_comName {
    font-size: 21px;
    font-weight: 600;
}
.info_company {
    font-size: 18px;
    margin-bottom: 13px;
    position: relative;
    top: -4px;
}
.info_company_left {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 11px 0px 29px 44px;
    width: 269px;
    box-sizing: border-box;
    vertical-align: middle;
}
.info_company_right {
    display: table-cell;
    position: relative;
    z-index: 2;
    padding: 8px 0px 29px 36px;
    width: 269px;
    box-sizing: border-box;
    vertical-align: middle;
}
.ci-right {
    position: relative;
    top: 21px;
}
.sri_btn_lg span.sri_btn_immediately {
    border: 0;
    outline: 0;
    color: #fff;
    background: #ff8d5a;
    height: 51px;
    position: relative;
    top: -1px;
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
    left: 663px;
    top: 20px;
    height: -20px;
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
    top: 20px;
    left: 600px;
    border: 1px solid #e4e4e4;
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
span.Jobsearch {
    font-size: 23px;
    color: white;
}
div#layout {
    border-radius: 0;
}
.address_div {
    position: absolute;
    width: 442px;
}
a.txt_comName {
    color: #6c757d;
    text-decoration: none;
}
.employment_img {
    margin: auto;
    /* padding: 39px 0; */
    padding-top: 0px;
    padding-bottom: 31px;
}
form#formApply {
    text-align: right;
}
span.resume_name {
    margin-left: 8px;
    position: relative;
    top: -2px;
}
.repeat_resume {
    margin-bottom: 4px;
}
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
a.JT {
	font-family: 'Recipekorea';
    color: white;
    text-decoration: none;
}
p.noti {
    margin-bottom: -10px;
}
div#kakaoMap {
    border: 1px solid #dadada;
}
</style>

</head>
<body>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->

    <div class="breadcrumb" id="breadcrumb_id">
   		<span class="Jobsearch">
   			<a class="JT" href="${pageContext.request.contextPath }/home.do">JobSearch</a>
   		</span>
    </div>

    <!-- Blog Post -->
		<div class="card mb-4" id="layout">
			<div class="card-body">
				<input type="hidden" id=memberSeq value="${loginMember.memberSeq }">
				<input type="hidden" id=annSeq value="${vo.annSeq}">			
			<div class="top_title">
				 <div class="c_title">
			    	<a class="company_title" onclick="comView(${vo.comSeq})" target="_blank" style="cursor: pointer;">${vo.comName }</a>
			     </div>			  	  	   	
			        <span class="company_title2">${vo.annTitle }</span>
			         <c:if test="${loginMember.regType != 1}">
			          	<div id="notEnd"></div>
			         </c:if>
			        <c:if test="${loginMember.regType == 1}">
				        <div id="notEnd">
					        <c:if test="${scrapYN > 0}">
						        <span class="star-border">
						        	<img id="scrap" class="scrapY" src="<c:url value='/resources/images/starY.png'/>" style="cursor: pointer;">
						        </span>
					        </c:if>
					        <c:if test="${scrapYN == 0 || empty scrapYN}">
						        <span class="star-border">
						        	<img id="scrap" class="scrapN" src="<c:url value='/resources/images/starG.png'/>" style="cursor: pointer;">
						        </span>
					        </c:if>
					        <button class="sri_btn_lg for_btn_event" onclick="apply()">
								<span class="sri_btn_immediately">즉시지원</span>
							</button>
						</div>
				
		        		<!-- 즉시지원  modal -->
						<div id="modal">
							<button id="apply_close" onclick="exit()"><img alt="닫기" src="<c:url value='/resources/images/close.png'/>"></button>
							<div id="modal_apply">
							    <h3><b>${vo.comName }</b> 입사지원</h3>
							    <p><small>제출서류</small></p>
							    <c:if test="${empty resumeList }">				       
									<span id="resumeWrite" onclick="resumeWrite()" style="cursor: pointer; text-decoration:underline; color: #6b80f1; ">이력서를 작성해주세요.</span>
								</c:if>  
								<c:if test="${!empty resumeList }">
					              	<c:forEach var="resumeVo" items="${resumeList }">
					              	<div class="repeat_resume">
							   			<input type="radio" name="no" value="${resumeVo.resumeSeq }"><span class="resume_name">${resumeVo.resumeTitle } 
							   			<small>[수정일 :<fmt:formatDate value="${resumeVo.regDate }" pattern="yyyy-MM-dd"/>]</small></span><br>
									</div>	
							    	</c:forEach>
									<form id="formApply" name="frmApply" action="<c:url value='/apply.do'/>" method="post">
										<input type="hidden" name="refAnnseq" value="${vo.annSeq }">
										<input type="hidden" name="refResumeseq" value="">
										<input type="hidden" name="refMemberseq" value="${loginMember.memberSeq }">
								    	<input id="ann_apply" type="submit" value="제출하기">						  
							    	</form>
							    </c:if>												 
							</div>
						</div>						
						<!-- 즉시지원  modal -->
					</c:if>
		    </div>
		    
				<div class="cont">
					<div class="col">
						<dl>
							<dt>경력</dt>
							<dd>
								<strong>${vo.careerType }</strong>
							</dd>
						</dl>
						<dl>
							<dt>근무형태</dt>
							<dd>
								<strong>${vo.empName }</strong>
							</dd>
						</dl>
						<dl>
							<dt>연령제한</dt>
							<dd>
								<strong>${vo.ageLimit }</strong>
							</dd>
						</dl>
					</div>
					<div class="col">
						<dl>
							<dt>급여</dt>
							<dd>
								<strong>${vo.salary }</strong>
							</dd>
						</dl>
						
						<dl>
							<dt>근무지역</dt>
							<dd>
								<strong>${vo.locationName } ${vo.locationName2 }</strong>
							</dd>
						</dl>
					</div>
					<ul class="meta">
                            <li id="li_class">조회수 <strong>${vo.hits }</strong></li>
					</ul>    
					
				</div>

			</div>		
			<div class="employment_img">
				<img src="<c:url value='/resources/images/employment.jpg'/>">
			</div>	
			<div class="card-footer text-muted_photo">
				 ${vo.annDesc }
			</div> 
			
			<div class="card-footer text-muted">
				<div class="jv_cont jv_howto">
					<div class="jv_title">접수기간 및 기업정보</div>
					
					<div class="cont box">
						<div class="status_left">
							<div class="info_timer" data-remain-time="2442726">
								<span id="reamin_term" class="txt">남은 기간</span><br> <span id="timer"></span> <span
									class="txt_day"></span><!--  <span class="time">06:30:43</span> -->
							</div>
								<dl class="info_period">
								<dt class="day">시작일</dt>
								<dd class="date">
								${vo.annStdt }
									<%-- <fmt:formatDate value="${vo.annStdt }" pattern="yyyy-MM-dd"/> --%>
								</dd>
								<dt class="day">마감일</dt>
								<dd class="date">
									<span id="endt">
									${vo.annEndt }
										<%-- <fmt:formatDate value="${vo.annEndt }" pattern="yyyy-MM-dd"/> --%>
									</span>
								</dd>
							</dl> 
							
						</div>
						
						<div class="info_company_left">
							<div class="info_company" data-remain-time="2442726">
								<span class="txt_comName">
									<a class="txt_comName" onclick="comView(${vo.comSeq})" target="_blank" style="cursor: pointer;">${vo.comName }</a>
								</span> 
							</div>
							<div class="comn"><span class="cn">기업형태</span><span class="cna">${vo.comType }</span></div>							
							<div class="comn"><span class="cn2">설립일</span><span class="cna"><fmt:formatDate value="${vo.setupDate }" pattern="yyyy-MM-dd"/></span></div>							
							<div class="comn"><span class="cn3">업종</span><span class="cna">${vo.comField }</span></div>							
							<div class="address_div"><span class="cn3">주소</span><span class="cna">${vo.address } ${vo.detailAddress } </span></div>
						</div>
						
						<div class="info_company_right">
							<!-- <div class="info_company" data-remain-time="2442726">
								<span class="txt">삼성반도체</span>  
							</div> -->
							<div class="ci-right">
							<div class="comn"><span class="cn">대표자명</span><span class="cna">${vo.ceoName }</span></div>							
							<div class="comn"><span class="cn2">사원수</span><span class="cna">${vo.employeeNum }</span></div>							
							<div class="comn"><span class="cn2">매출</span><span class="cna">${vo.comSales }</span></div>							
							</div>							
							
						</div>
					
					
					</div>
						<p class="noti">*마감일은 기업의 사정, 조기마감 등으로 변경될 수 있습니다.</p>
						<div class="jv_title">기업위치</div>
						<div id="kakaoMap" align="center">
						<c:import url="/company/KakaoMap.do?comSeq=${vo.comSeq}"/>
						</div>
				</div>
			</div>
			
		</div>

	</div>
  <!-- /.container -->

	<script type="text/javascript">	
		function timer(){			
			var nowDate=new Date();
			var endDate=new Date('${vo.annEndt}');
			var remainDate=endDate-nowDate;
			
			var days = (endDate - nowDate) / 1000 / 60 / 60 / 24; 
			var daysRound = Math.floor(days); 
			var hours = (endDate - nowDate) / 1000 / 60 / 60 - (24 * daysRound); 
			var hoursRound = Math.floor(hours); 
			var minutes = (endDate - nowDate) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound); 
			var minutesRound = Math.floor(minutes); 
			var seconds = (endDate - nowDate) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
			var secondsRound = Math.round(seconds); 
			
			document.getElementById("timer").innerHTML=daysRound + "일 " 
					+ hoursRound + ":" + minutesRound + ":" + secondsRound;
		
			if(remainDate<0){
				document.getElementById("close").innerHTML="[지원 마감]";
				document.getElementById("timer").innerHTML="";						
				clearInterval(timerStart);
			}else{
				document.getElementById("notEnd").style.display="block";
			}
		}
		
		$(document).ready(function(){
			timer();
			timerStart=setInterval('timer()', 1000);
			
			//지원하기
			$("form[name=frmApply]").submit(function(){
				var selectedResume=$("input[name='no']:checked").val();
				$("input[name=refResumeseq]").val(selectedResume);
				//이력서 미 선택시 알림 
				if(selectedResume==null){
					alert("이력서를 선택해주세요.");
					return false;				
				}
			});
			
			
			//즐겨찾기
			$("#scrap").click(function(){
				var sUrl = "";
				
				var sClass = $("#scrap").attr("class");
				if(sClass == "scrapN"){
					sUrl = "<c:url value='/addScrap.do'/>";
				}else if(sClass == "scrapY"){
					sUrl = "<c:url value='/delScrap.do'/>";
				}
				
				$.ajax({
					url:sUrl,
					type:"post",
					data:{ "refAnnseq": $("#annSeq").val(), "refMemberseq": $("#memberSeq").val()},				
					dataType:"text",
					success:function(res){									
						alert(res);
						
						if(sClass == "scrapN"){
							$("#scrap").attr("src", "<c:url value='/resources/images/starY.png'/>");
							$("#scrap").removeClass('scrapN');
							$("#scrap").addClass('scrapY');
						}else if(sClass == "scrapY"){
							$("#scrap").attr("src", "<c:url value='/resources/images/starG.png'/>");
							$("#scrap").removeClass('scrapY');
							$("#scrap").addClass('scrapN');
						}
					},
					error:function(xhr, status, error){
						alert("즐겨찾기 오류");
					}
				});
			});
		});
		
		var modal = document.getElementById('modal');

        function apply() {
            modal.style.display = "block";
        }
        
        //닫기 이미지로 모달 닫음
        function exit(){
            modal.style.display = "none";
        }       
        // 창 주변 누르면 모달 닫음
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        
        function resumeWrite(){
        	window.open("<c:url value='/resume/resumeView.do'/>")
        }
       	
        function comView(comSeq){
    		window.open("<c:url value='/company/companydetail.do?comSeq='/>"+comSeq, comSeq+" 회사 상세보기", 
    				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
    	}

	</script> 
 
</body>

</html>
