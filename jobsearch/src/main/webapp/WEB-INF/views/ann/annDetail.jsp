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
    z-index: 2;
    padding: 30px 0px 29px 31px;
    width: 269px;
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

    <ol class="breadcrumb" id="breadcrumb_id">
   
    
    </ol>

    <!-- Blog Post -->
		<div class="card mb-4">
			<div class="card-body">
			<input type="hidden" id=memberSeq value="${loginMember.memberSeq }">
			<input type="hidden" id=annSeq value="${vo.annSeq}">
			<div class="top_title">
				 <div class="c_title">
			    	<a href="#" class="company_title" target="_blank">${vo.comName }</a>
			     </div>			  	  	   	
			        <span class="company_title2">${vo.annTitle }</span>
			         <c:if test="${loginMember.regType != 1}">
			          	<div id="notEnd"></div>
			         </c:if>
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
							   			<input type="radio" name="no" value="${resumeVo.resumeSeq }"><span>${resumeVo.resumeTitle } <small>[수정일 : ${resumeVo.regDate }]</small></span><br>	
							    	</c:forEach>
									<form name="frmApply" action="<c:url value='/apply.do'/>" method="post">
										<input type="hidden" name="refAnnseq" value="${vo.annSeq }">
										<input type="hidden" name="refResumeseq" value="">
								    	<input type="submit" value="제출하기">						  
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
							<dt>연령제한</dt>
							<dd>
								<strong>${vo.ageLimit }</strong>
							</dd>
						</dl>
					</div>
					<div class="col">
						<dl>
							<dt>급여</dt>
							<dd>${vo.salary }</dd>
						</dl>
						<dl>
							<dt>근무형태</dt>
							<dd>
								<strong>${vo.empName }</strong>
							</dd>
						</dl>
						<dl>
							<dt>근무지역</dt>
							<dd>${vo.locationName } ${vo.locationName2 }</dd>
						</dl>
					</div>
					<ul class="meta">
                            <li id="li_class">조회수 <strong>${vo.hits }</strong></li>
					</ul>    
					
				</div>

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
								<span id="close" class="txt">남은 기간</span><br> <span id="timer"></span> <span
									class="txt_day"></span><!--  <span class="time">06:30:43</span> -->
							</div>
								<dl class="info_period">
								<dt class="day">시작일</dt>
								<dd class="date">${vo.annStdt }</dd>
								<dt class="day">마감일</dt>
								<dd class="date"><span id="endt">${vo.annEndt }</span></dd>
							</dl> 
							
						</div>
						
						<div class="info_company_left">
							<div class="info_company" data-remain-time="2442726">
								<span class="txt">${vo.comName }</span> 
							</div>
							<div class="comn"><span class="cn">기업형태</span><span class="cna">${vo.comType }</span></div>							
							<div class="comn"><span class="cn2">설립일</span><span class="cna"><fmt:formatDate value="${vo.setupDate }" pattern="yyyy-MM-dd"/></span></div>							
							<div class="comn"><span class="cn">업종</span><span class="cna">${vo.comField }</span></div>							
						</div>
						
						<div class="info_company_left">
							<!-- <div class="info_company" data-remain-time="2442726">
								<span class="txt">삼성반도체</span>  
							</div> -->
							<div class="ci-right">
							<div class="comn"><span class="cn">대표자명</span><span class="cna">${vo.ceoName }</span></div>							
							<div class="comn"><span class="cn2">사원수</span><span class="cna">${vo.employeeNum }명</span></div>							
							<div class="comn"><span class="cn">주소</span><span class="cna">${vo.address } ${vo.detailAddress } ${vo.extraAddress }</span></div>
							</div>							
							
						</div>
					
					
						<p class="noti">마감일은 기업의 사정, 조기마감 등으로 변경될 수 있습니다.</p>
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
							$("#scrap").attr("src", "<c:url value='/resources/images/yellow_star.png'/>");
							$("#scrap").removeClass('scrapN');
							$("#scrap").addClass('scrapY');
						}else if(sClass == "scrapY"){
							$("#scrap").attr("src", "<c:url value='/resources/images/gray_star.png'/>");
							$("#scrap").removeClass('scrapY');
							$("#scrap").addClass('scrapN');
						}
					},
					error:function(xhr, status, error){
						alert("로그인을 해주세요");
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
        	window.open("<c:url value='/resume/resumeTest.do'/>")
        }
       

	</script> 
 
</body>

</html>
