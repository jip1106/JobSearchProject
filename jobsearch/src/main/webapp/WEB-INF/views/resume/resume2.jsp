<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />

 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume_tab.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd' //Input Display Format 변경
   ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
   ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
   ,changeYear: true //콤보박스에서 년 선택 가능
   ,changeMonth: true //콤보박스에서 월 선택 가능                
   ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
   ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
   ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
   ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
   //,minDate: "-80Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
   //,maxDate: "-18Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)         
});


$(document).ready(function() {
	
	 $("#education_term1").datepicker({});
	 $("#education_term2").datepicker({});
	
	 $("#education_term3").datepicker({});
	 $("#education_term4").datepicker({});
	 
	 $("#education_term5").datepicker({});
	 $("#education_term6").datepicker({});
	 
	 $("#preStdt").datepicker({});
	 $("#preEndt").datepicker({});
	 
	 
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		// 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
	
	
	/* 자기소개서: 남은 글자 수 
	 https://gahyun-web-diary.tistory.com/26*/
	$("#textarea_it").keyup(function (e){
		var content = $(this).val();       
		$('#counter').val(500-content.length);

        if(content.length > 500) {
          $(this).val($(this).val().substring(0, 500));
        }
	});	
	
	//학력정보 스크립트
	if(${resumeSeq == 0 }){	//등록인경우
		showDiv('1');
	}else{
		if(${list_edu.size() == 1}){	//고등학교
			showDiv('1');	
		}else if(${list_edu.size() == 2}){	//대학교
			showDiv('2');
		}else if(${list_edu.size() == 3}){	//대학원
			showDiv('3');
		}
		
	}
});

function showDiv(index){
	
	$("#educationInfo").attr("style","display:block");
	
	$("#infoDiv1").attr("style","display:none");
	$("#infoDiv2").attr("style","display:none");
	$("#infoDiv3").attr("style","display:none");
	
	//학력사항 insert
	$("#educationSize").val(index);
	
	for(var i=1; i<=index; i++){
		$("#infoDiv"+i).attr("style","display:block");
	}
}
</script>



<style type="text/css">

div#floatMenu_parent {
    padding-top: 127px;
}        
h5.card-header{
    color: #222;
    font-size: 20px;
    font-weight: bold;
    letter-spacing: -1px;
    line-height: 28px;
    
}
div#floatMenu {
    width: 16em;
}
ul.list-unstyled.mb-0 {
    width: 122px;
}
li.side_li {
    margin-bottom: 22px;
    font-size: 18px;
    font-weight: 550;
}
div#edit_bt {
    position: relative;
    left: 13.6em;
}

button.btn.btn-lg.btn-primary.btn-block.text-save {
    background: #5e87f1;
    width: 100%;
    height: 53px;
    border: none;
    font-size: 17px;
}
button.btn.btn-lg.btn-primary.btn-block.text-set {
    background: #5e87f1;
    width: 20%;
    height: 60px;
    border: none;
    font-size: 17px;
    margin: 0 auto;
    flaot: left;
    margin-bottom: 34px;
    margin-top: -22px;
}
input#resumeTitle {
    height: calc(1.5em + .75rem + 18px);
    font-size: 21px;
    font-weight: bold;
    padding: 0 17px;
}
.card.mb-4-bt {
    padding: 28px 0px 16px 47px;
    margin-bottom: 57px;
}
input#memberName {
    width: 274px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -93px;
    margin-bottom: -34px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#birthday {
    width: 274px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -93px;
    margin-bottom: -34px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#address {
    width: 450px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -93px;
    margin-bottom: -34px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#memberId {
    width: 274px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -93px;
    margin-bottom: -34px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#Insert_text {
    width: 274px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -93px;
    margin-bottom: -34px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#zipCode {
    width: 274px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -93px;
    margin-bottom: -34px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#detailAddress {
    width: 450px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -93px;
    margin-bottom: -34px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#extraAddress {
    width: 450px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -69px;
    margin-bottom: -16px;
    position: relative;
    top: -10px;
    left: 12px;
}
input#eduNameHigh {
    width: 304px;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -69px;
    margin-bottom: -16px;
    position: relative;
    top: -10px;
    left: -1px;
}
#univType {
    width: 304px;
    height: calc(1.5em + .75rem + 15px);
    margin-bottom: -16px;
    position: relative;
    top: -10px;
    left: -1px;
}

select#Insert_text_condition {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
    position: relative;
    left: 15.7em;
    top: -2em;
    margin-bottom: -29px;
    z-index:100;
}
input#preComname {
    width: 85%;
    height: calc(1.5em + .75rem + 15px);
    position: relative;
    margin-bottom: -22px;
    margin-top: 16px;
}
input#preJob {
    width: 85%;
    height: calc(1.5em + .75rem + 15px);
    position: relative;
    margin-bottom: 20px;
}
input#preStdt {
    width: 160px;
    height: calc(1.5em + .75rem + 15px);
    text-align: center;
    float: left;
    position: relative;
    left: -100px;
}
input#preEndt {
    width: 160px;
    height: calc(1.5em + .75rem + 15px);
    text-align: center;
    float: left;
    position: relative;
    left: -18px;
}
textarea.form-control {
    width: 404px;
}
Input#Insert_text_money {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
    position: relative;
    left: 15.7em;
    top: -2em;
    margin-bottom: -17px;
    z-index:100;
}
input#eduNameUniv {
    width: 304px;
    height: calc(1.5em + .75rem + 15px);
    margin-bottom: -16px;
    position: relative;
    top: -10px;
    left: -1px;
}
input#univScore {
    width: 304px;
    height: calc(1.5em + .75rem + 15px);
    margin-bottom: -16px;
    position: relative;
    top: -10px;
    left: -1px;
}
input#univMajor {
    width: 304px;
    height: calc(1.5em + .75rem + 15px);
    margin-bottom: -16px;
    position: relative;
    top: -10px;
    left: -1px;
}
input#eduNameGs {
    width: 304px;
    height: calc(1.5em + .75rem + 15px);
    margin-bottom: -16px;
    position: relative;
    top: -10px;
    left: -1px;
}
span.ab_info_2t {
    z-index: 10;
    position: relative;
    left: -183px;
    font-size: 12px;
    color: red;
    top: 5px;
}
span.ab_info_2t_hope {
    z-index: 10;
    position: relative;
    left: 52px;
    font-size: 12px;
    color: red;
    top: 5px;
}
span.ab_info_3t {
    z-index: 10;
    position: relative;
    left: -168px;
    font-size: 12px;
    color: red;
    top: 5px;
}

span.ab_info_4t{
    z-index: 10;
    position: relative;
    left: -151px;
    font-size: 12px;
    color: red;
    top: 5px;
}
span.ab_info_4t_hope {
    z-index: 10;
    position: relative;
    left: 87px;
    font-size: 12px;
    color: red;
    top: 5px;
}
span.ab_info_5t {
    z-index: 10;
    position: relative;
    left: -134px;
    font-size: 12px;
    color: red;
    top: 5px;
}

.col-lg-4 {
    font-size: 17px;
}
.span_notice_title_info {
    color: #222;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: -2px;
    line-height: 34px;
    position: relative;
    top: -8px;
}
.resume_photo2 {
    position: absolute;
    top: 42px;
    left: 75%;
    width: 120px;
    height: 160px;
    border: 1px solid #eaeaea;
    box-sizing: border-box;
    text-align: center;
    background-color: #fff;
    padding: 0;
}
select.form-control {
    width: 145px;
    height: calc(1.5em + .75rem + 16px);
    position: relative;
    left: 27px;
}
div#school_bt {
    position: relative;
    top: -50px;
    left: 450px;
    margin-bottom: -38px;
}
div#educationInfo {
    margin-top: -14px;
}
button.btn.btn-primary {
    width: 90px;
    height: 42px;
    background-color: #4876ef;
    border-color: #4876ef;
}

.hsc {
    color: #222;
    font-size: 20px;
    font-weight: bold;
    line-height: 28px;
    margin-bottom: 0px;
    margin-left: 0;
}
.hsc_h {
    color: #222;
    font-size: 20px;
    font-weight: bold;
    line-height: 28px;
    margin-bottom: 0px;
    margin-left: 0;
    margin-top: 9px;
}
.col-lg-8.form-label-group.mb-2 {
    margin-left: -70px;
}
.school_notice {
    top: -33px;
    left: 110px;
    font-size: 14px;
    letter-spacing: -1px;
    line-height: 28px;
    margin-left: 6px;
}
div#hope_cate {
    position: relative;
    top: 26px;
}
div#career_layout {
    padding: 0;
}
span.hyphen_career {
    float: left;
    margin: 0 28px;
    font-size: 28px;
    position: relative;
    left: 193px;
    top: 1px;
}
div#career_term {
    position: relative;
    left: -29px;
    margin-top: 22px;
    margin-bottom: -7px;
}
textarea#textarea_career {
    width: 405px;
    height: 230px;
    position: relative;
    margin-left: 0;
    left: 0;
}
div#career_layout {
    height: 574px;
}
div#career_cate1 {
    position: relative;
    top: 30px;
    left: 18px;
}
div#career_cate2 {
    position: relative;
    top: 39px;
    left: -8px;
}
div#career_cate3 {
    position: relative;
    top: 18px;
    left: -8px;
}
div#career_cate4 {
    position: relative;
    top: -8px;
    left: -8px;
}
a#career_tab_a {
    height: 57px;
    padding: 15px 0;
    font-size: 17px;
}
span.rookie {
    font-size: 27px;
    position: relative;
    top: 189px;
    color: #4876ef;
}
input#Insert_title_it {
    width: 152%;
    height: calc(1.5em + .75rem + 16px);
    position: relative;
    left: 49px;
}
textarea#textarea_it {
    width: 645px;
    height: 23em;
    margin-top: 11px;
    position: relative;
    left: 49px;
    resize:none;
}
input#counter {
    background: white;
    width: 14%;
    position: relative;
    top: -10px;
    left: 589px;
    border: none;
    margin: 0;
    color: #cccccc;
    text-align: right;
}
textarea#textarea_it {
    width: 645px;
    height: 23em;
    margin-top: 11px;
    position: relative;
    left: 49px;
    resize: none;
    margin-bottom: -56px;
}
span.text500 {
    position: relative;
    left: 640px;
    top: 21px;
    color: #cccccc;
    z-index: 100;
}
div#floatMenu {
    width: 13em;
    top: -10px;
}
h5#floatMenu_title {
    background-color: #4876ef;
    text-align: center;
    color: white;
}
div#floatMenu_box {
    height: 241px;
}
li.side_li {
    margin-bottom: 17px;
    font-size: 18px;
    font-weight: 550;
}
</style>

<script>
	function insertResume(){
		
		//값 체크
		
		
		document.getElementById("frm").submit();
		
	}
</script>
<c:import url="/WEB-INF/views/include/headend.jsp" />

<body>

<c:import url="/WEB-INF/views/include/navi.jsp" />
  
  
  <!-- Page Content -->
  <div class="container">
  
  	<c:if test="${resumeSeq ==0 }"> 	<% //이력서 등록 %>
  		<form name="frm" method="post" action="/jobsearch/resume/resumeInsert.do" onsubmit="insertResume()">
  	</c:if>
  	<c:if test="${resumeSeq !=0 }"> 	<% //이력서 수정 %>
  		<form name="frm" method="post" action="/jobsearch/resume/resumeUpdate.do" onsubmit="insertResume()">
  			<input type="hidden" value="${resumeSeq }" name="resumeSeq">
  			<input type="hidden" value="${resumeInfo['HOPEWORK_SEQ'] }" name="hopeworkSeq">
  			<input type="hidden" value="${resumeInfo['MYCAREER_SEQ']}" name="mycareerSeq">
  			
  	</c:if>
  	
	    
    
    <div class="row">
      <!-- Entries Column -->
      <div class="col-md-8" >
    	<!-- 이력서 제목 -->
		<div class="row mb-4 mt-4" >
			<div class="col">
				<input type="text" id="resumeTitle" name="resumeTitle" class="form-control input-style" 
				value = "${resumeInfo['RESUME_TITLE']}"placeholder="이력서 제목을 입력하세요."  >
			</div>
		</div>

        <!-- 기본정보 -->
	       	<span class="span_notice_title_info" id="first_position">기본정보 </span>
	        <div class="card mb-4-bt">
	        
		        <div class="resume_photo2">
		        	<img class="img-photo" src="<c:url value='/resources/upload_images/${sessionScope.loginMember.profileRenameimg }'/>" alt="${sessionScope.loginMember.memberName } 로고">
		    	</div>
	        
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">이름  </div><span class="ab_info_2t">필수</span>
			
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="memberName" name="memberName" class="form-control input-style" placeholder="이름" value="${sessionScope.loginMember.memberName }" readonly>
				</div>
				
				<div style="position:absolute;width:150px; height:30px; top:230px; left:70%;">
				
					<select class="form-control" name="recuritStatus">
						<option value="">구직상태선택</option>
						<option value="1" <c:if test="${resumeInfo['RECURIT_STATUS']==1}"> selected </c:if>>구직준비중(재학생)</option>
						<option value="2" <c:if test="${resumeInfo['RECURIT_STATUS']==2}"> selected </c:if>>구직중</option>
						<option value="3" <c:if test="${resumeInfo['RECURIT_STATUS']==3}"> selected </c:if>>재직중</option>
					</select>
				</div>
			</div>
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">생년월일  </div><span class="ab_info_4t">필수</span>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<fmt:parseDate value="${sessionScope.loginMember.birthday }" var="memberBirthday" pattern="yyyy-MM-dd"/>
					<input type="text"  id="birthday" name="birthday" class="form-control" value="<fmt:formatDate value="${memberBirthday}" pattern="yyyy-MM-dd"/>" placeholder="생년월일"   readonly>
				</div>
			</div>
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">이메일  </div><span class="ab_info_3t">필수</span>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="memberId" name="memberId" value="${sessionScope.loginMember.memberId }" class="form-control" placeholder="이메일"   readonly>
				</div>
			</div>
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">전화번호  </div><span class="ab_info_4t">필수</span>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="Insert_text" name="phone" class="form-control" value="${sessionScope.loginMember.phone }" placeholder="전화번호"   readonly>
				</div>
			</div>
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">우편번호  </div><span class="ab_info_4t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="zipCode" name="zipCode" value="${sessionScope.loginMember.zipCode}" class="form-control" placeholder="우편번호"   readonly>
				</div>
			</div>
			
			<div class="row mb-4 mt-4">
				<div class="col-lg-4">주소 </div><span class="ab_info_2t">필수</span>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="address" name="address" class="form-control" value="${sessionScope.loginMember.address }" placeholder="주소"   readonly>
				</div>
			</div>
			
			<div class="row mb-4 mt-4">
				<div class="col-lg-4">상세주소 </div><span class="ab_info_4t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="detailAddress" name="detailAddress" class="form-control" value="${sessionScope.loginMember.detailAddress }" placeholder="주소"   readonly>
				</div>
			</div>
			
			<div class="row mb-4 mt-4">
				<div class="col-lg-4">추가사항</div>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="extraAddress" name="extraAddress" class="form-control" value="${sessionScope.loginMember.extraAddress }" placeholder="주소"   readonly>
				</div>
			</div>
        </div>


        <!-- 학력사항 -->
        <div class="row">
        	<div class="col-lg-8">
		        <span class="span_notice_title" id="second_position">학력사항</span>
		        <span class="school_notice">최종학력 선택 후 학력사항을 입력하세요.</span>
	        </div>
				        
		</div>
		<div class="row mt-2 mb-2">
			<div class="col-lg-8" id="school_bt" style="float:left;">
				<button type="button" class="btn btn-primary" onclick="showDiv('1')">고등학교</button>
				<button type="button" class="btn btn-primary" onclick="showDiv('2')">대학교</button>
				<button type="button" class="btn btn-primary" onclick="showDiv('3')">대학원</button>
			</div>
			
		</div>
		
		
		
		<div class="card mb-4-bt" id="educationInfo" style="display:none;">
			<input type="hidden" name="educationSize" value="1" id="educationSize">
		
			<div id="infoDiv1" style="display:none;">
				<input type="hidden" name="educationVOList[0].eduSeq" 
					<c:if test="${empty list_edu[0]['EDU_SEQ']}">value="0"</c:if>
					<c:if test="${!empty list_edu[0]['EDU_SEQ']}">value="${list_edu[0]['EDU_SEQ']}"</c:if>
				>
				
				
				<input type="hidden" name="educationVOList[0].eduType" value="1">
				<input type="hidden" name="educationVOList[0].univType" value="0">
				<input type="hidden" name="educationVOList[0].univScore" value="0">
				<input type="hidden" name="educationVOList[0].univMajor" value="0">
				
				<h4 class="hsc_h">[고등학교 정보 입력]</h4>
				<div class="row mb-4 mt-4">
					<div class="col-lg-4">학교이름  </div><span class="ab_info_4t">필수</span>
					
					<div class="col-lg-4 form-label-group mb-2">
						<input type="text" id="eduNameHigh" name="educationVOList[0].eduName" class="form-control" placeholder="학교이름"
						value = "${list_edu[0]['EDU_NAME'] }">
					</div>
				</div>
				
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">재학기간  </div><span class="ab_info_4t">필수</span>
					
					<div class="col-lg-8 form-label-group mb-2">
						<input type="text"  id="education_term1" name="educationVOList[0].periodStdt" class="form-control" placeholder="입학일" 
						value = "${list_edu[0]['PERIOD_STDT']}" readonly>
						
						<span class="hyphen">~</span>
						<input type="text"  id="education_term2" name="educationVOList[0].periodEndt" class="form-control" placeholder="졸업일" 
						value = "${list_edu[0]['PERIOD_ENDT']}"readonly>
					</div>
				</div>
			</div>
			
			<div id="infoDiv2" style="display:none;">
			
				<input type="hidden" name="educationVOList[1].eduSeq" 
					<c:if test="${empty list_edu[1]['EDU_SEQ']}">value="0"</c:if>
					<c:if test="${!empty list_edu[1]['EDU_SEQ']}">value="${list_edu[1]['EDU_SEQ']}"</c:if>
				>
				<input type="hidden" name="educationVOList[1].eduType" value="2">
								
				<h4 class="hsc">[대학교 정보 입력]</h4>
				<div class="row mb-4 mt-4">
				<div class="col-lg-4">대학교구분  </div><span class="ab_info_5t">필수</span>
					<div class="col-lg-8 form-label-group mb-2">
						<select id="univType" name="educationVOList[1].univType" class="form-control">
							<option value="">선택</option>
							<option value="1" <c:if test="${list_edu[1]['UNIV_TYPE'] == 1 }">selected</c:if>>2,3년제</option>
							<option value="2" <c:if test="${list_edu[1]['UNIV_TYPE'] == 2 }">selected</c:if>>4년제</option>
						</select>
					</div>
				</div>
				<div class="row mb-4 mt-4">
					<div class="col-lg-4">학교이름  </div><span class="ab_info_4t">필수</span>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="eduNameUniv" 
							value = "${list_edu[1]['EDU_NAME'] }" name="educationVOList[1].eduName" class="form-control" placeholder="학교이름">
						</div>
				</div>
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">재학기간  </div><span class="ab_info_4t">필수</span>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text"  id="education_term3" name="educationVOList[1].periodStdt" class="form-control" placeholder="입학일"   
							value = "${list_edu[1]['PERIOD_STDT'] }" readonly>
							<span class="hyphen">~</span>
							<input type="text"  id="education_term4" name="educationVOList[1].periodEndt" class="form-control" placeholder="졸업일"   
							value = "${list_edu[1]['PERIOD_ENDT'] }" readonly>
						</div>
				</div>
		        <div class="row mb-4 mt-4 ">
					<div class="col-lg-4">학점 </div><span class="ab_info_2t">필수</span>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univScore" name="educationVOList[1].univScore" class="form-control" placeholder="학점"
							value="${list_edu[1]['UNIV_SCORE'] }">
						</div>
				</div>
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">전공  </div><span class="ab_info_2t">필수</span>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univMajor" name="educationVOList[1].univMajor" class="form-control" placeholder="전공"
							value="${list_edu[1]['UNIV_MAJOR'] }">
						</div>
				</div>
			</div>

			<div id="infoDiv3" style="display:none;">
					<input type="hidden" name="educationVOList[2].eduSeq" 
						<c:if test="${empty list_edu[2]['EDU_SEQ']}">value="0"</c:if>
						<c:if test="${!empty list_edu[2]['EDU_SEQ']}">value="${list_edu[2]['EDU_SEQ']}"</c:if>
				>
				<input type="hidden" name="educationVOList[2].eduType" value="3">
				<input type="hidden" name="educationVOList[2].univScore" value="">
				<input type="hidden" name="educationVOList[2].univMajor" value="">
				
				<h4 class="hsc">[대학원 정보 입력]</h4>
				<div class="row mb-4 mt-4">
				<div class="col-lg-4">대학교구분  </div><span class="ab_info_5t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<select id="univType" name="educationVOList[2].univType" class="form-control">
								<option value="">선택</option>
								<option value="3" <c:if test="${list_edu[2]['UNIV_TYPE']==3}">selected</c:if>>대학원(석사)</option>
								<option value="4" <c:if test="${list_edu[2]['UNIV_TYPE']==4}">selected</c:if>>대학원(박사)</option>
							</select>
						</div>
				</div>
				<div class="row mb-4 mt-4">
					<div class="col-lg-4">학교이름  </div><span class="ab_info_4t">필수</span>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="eduNameGs" 
							value = "${list_edu[2]['EDU_NAME']}" name="educationVOList[2].eduName" class="form-control" placeholder="학교이름">
						</div>
				</div>
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">재학기간  </div><span class="ab_info_4t">필수</span>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text"  id="education_term5" name="educationVOList[2].periodStdt" class="form-control" placeholder="입학일"   
							value = "${list_edu[2]['PERIOD_STDT'] }" readonly>
							<span class="hyphen">~</span>
							<input type="text"  id="education_term6" name="educationVOList[2].periodEndt" class="form-control" placeholder="졸업일"   
							value = "${list_edu[2]['PERIOD_ENDT'] }"  readonly>
						</div>
				</div>
			</div>
		</div>
        <!-- 희망근무조건 -->
        <span class="span_notice_title_info" id="third_position">희망근무조건</span>
	        <div class="card mb-4-bt">
	        	<div class="col-lg-4" id="hope_cate">근무형태  </div><span class="ab_info_4t_hope">필수</span>
				
					<div class="col-lg-8 form-label-group mb-2">
						<select id="Insert_text_condition" class="form-control" name="hopeEmptype">
							<option value="">근무형태 선택</option>
							<!-- 반복 시작 -->
				        	<c:forEach var="map" items="${list }"> 
				        		<option value="${map['EMP_TYPE']}" <c:if test="${ map['EMP_TYPE'] == resumeInfo['HOPE_EMPTYPE']}"> selected </c:if>>
				        			${map['EMP_NAME']}
				        		</option>
				        	</c:forEach>
        					<!-- 반복 끝 -->
						</select>
				    </div>
				    
				    <div class="col-lg-4" id="hope_cate">직종</div><span class="ab_info_2t_hope">필수</span>
					
					<div class="col-lg-8 form-label-group mb-2">
						<select id="Insert_text_condition" class="form-control" name="refCategory1">
							<option value="">직종 선택</option>
							<!-- 반복 시작 -->
				        	<c:forEach var="map" items="${list_cate }">
				        		<option value="${map['CATE_SEQ1']}" <c:if test="${ map['CATE_SEQ1'] == resumeInfo['REF_CATEGORY1']}"> selected </c:if>>
				        			${map['CATE_NAME1']}
				        		</option>
				        	</c:forEach>
				        	
        					<!-- 반복 끝 -->
						</select>
				    </div>
				    
				    <div class="col-lg-4" id="hope_cate">지역  </div><span class="ab_info_2t_hope">필수</span>
					
					<div class="col-lg-8 form-label-group mb-2">
						<select id="Insert_text_condition" class="form-control" name="refLocationseq">
							<option value="">지역 선택</option>
							<!-- 반복 시작 -->
				        	<c:forEach var="map" items="${list_loca }">
				        		<option value="${map['LOCATION_SEQ1']}" <c:if test="${ map['LOCATION_SEQ1'] == resumeInfo['REF_LOCATIONSEQ']}"> selected </c:if>>
				        			${map['LOCATION_NAME']}
				        		</option>
				        	</c:forEach>

        					<!-- 반복 끝 -->
						</select>
				    </div>
				
				<div class="col-lg-4" id="hope_cate">연봉  </div><span class="ab_info_2t_hope">필수</span>
				
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_money" name="hopeSalary" class="form-control" value="${resumeInfo['HOPE_SALARY'] }" placeholder="예)2400"   >
				</div>          
       		</div>

 
        <!-- 경력사항 -->
	<script>
		function changeCareerType(careerType){
			$("#careerType").val(careerType);
		
		}
	</script>

        <span class="span_notice_title_info" id="fourth_position">경력사항</span>
        <input type="hidden" name="careerType" value="1" id="careerType">
        
        <div class="card mb-4-bt-career" id="career_layout">
			<ul class="nav nav-tabs" style="width:100%; text-align:center;">
			  <li id="career_tab" class="nav-item" style="width:50%;" onclick="changeCareerType('1')">
			    <a id="career_tab_a" class="nav-link <c:if test="${resumeInfo['CAREER_TYPE']==1 || resumeInfo['CAREER_TYPE']!=2}">active</c:if>" data-toggle="tab" href="#newPerson">신입</a>
			  </li>
			  <li id="career_tab" class="nav-item" style="width:50%;" onclick="changeCareerType('2')">
			    <a id="career_tab_a" class="nav-link <c:if test="${resumeInfo['CAREER_TYPE']==2 }">active</c:if>" data-toggle="tab" href="#oldMan">경력</a>
			  </li>
			</ul>

			<div class="tab-content text-center">
			  <div class="tab-pane fade <c:if test="${resumeInfo['CAREER_TYPE']==1 || resumeInfo['CAREER_TYPE']!=2}">show active</c:if>" id="newPerson">
			    <div class="row mb-4 mt-4">
			  		<div class="col-lg-12">
			  		    <span class="rookie">신입지원자 입니다.</span>
			  		</div>
			  	</div>
			  </div>

			
			  <div class="tab-pane fade <c:if test="${resumeInfo['CAREER_TYPE']==2 }">show active</c:if>" id="oldMan">
					<div class="row mb-4 mt-4">
		    			<div class="col-lg-4" id="career_cate1">이전 직장 회사명</div>
						<div class="col-lg-8 form-label-group">
							<input type="text" id="preComname" name="preComname" class="form-control" 
							value="${resumeInfo['PRE_COMNAME']}" placeholder="이전 직장 회사명"  >
						</div>
					</div>
					
					<div class="row mb-4 mt-4">
						<div class="col-lg-4" id="career_cate2">재직기간</div>
						
						<div class="col-lg-8 form-label-group" id="career_term">
							<div class="col-lg-4" style="display:inline-block;">
								<input type="text"  id="preStdt" name="preStdt" class="form-control" placeholder="시작일"   
								value = "${resumeInfo['PRE_STDT'] }" readonly>
							</div>
							<span class="hyphen_career">~</span>
							<div class="col-lg-4" style="display:inline-block;">
								<input type="text"  id="preEndt" name="preEndt" class="form-control" placeholder="종료일" 
								value = "${resumeInfo['PRE_ENDT'] }"  readonly>
							</div>
						</div>
					</div>
					
					<div class="row mb-4 mt-4">
						<div class="col-lg-4" id="career_cate3">담당업무</div>
						<div class="col-lg-8 form-label-group">
							<input type="text" id="preJob" value="${resumeInfo['MANAGE_DESC']}" name="manageDesc" class="form-control" placeholder="담당업무"  >
						</div>
					</div>						
					
					<div class="row mb-4 mt-4">
						<div class="col-lg-4" id="career_cate4">퇴사사유</div>
						<div class="col-lg-8 form-label-group">
							<textarea id="textarea_career" class="form-control" name="retireDesc" placeholder="퇴사사유" style="resize:none;">${resumeInfo['RETIRE_DESC']}</textarea>
						</div>
					</div>						
			  </div>
			</div>
        </div>        
        
        
        <!-- 자기소개서 -->
        <span class="span_notice_title" id="fifth_position">자기소개서</span>
        <span class="school_notice">각 항목명은 변경할 수 있으며 글자수는 최대 500자로 제한 됩니다.</span>
        <div class="card mb-4-bt">
          <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<input type="text" id="Insert_title_it" name="introduceTitle" class="form-control" 
				placeholder="자소서 제목"  value="${resumeInfo['INTRODUCE_TITLE']}">
			</div>
		 <!--  </div> -->
      	   <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<textarea id="textarea_it" class="form-control" name="introduceDesc" placeholder="자소서 내용">${resumeInfo['INTRODUCE_DESC']}</textarea>
					<span class="text500">/500</span>
					<input type="text" readonly  value="500" name="counter" id="counter" class="form-control">
 			 </div>
        </div>
        
       	<c:if test="${resumeSeq ==0 }"> 
  			<button class="btn btn-lg btn-primary btn-block text-set" type="submit">이력서 등록</button>
     	</c:if>
     	<c:if test="${resumeSeq !=0 }">
			<button class="btn btn-lg btn-primary btn-block text-set" type="submit">이력서 수정</button>
		</c:if>
      </div>


      <!-- 우측네비게이션 -->
      <div class="col-md-4" id="floatMenu_parent">


        <div class="card my-4" id="floatMenu">
          <h5 class="card-header" id="floatMenu_title">이력서 항목</h5>
          <div class="card-body" id="floatMenu_box">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li class="side_li">
                    <a href="#">기본정보</a>
                  </li>
                  <li class="side_li">
                    <a href="#second_position">학력사항</a>
                  </li>
                  <li class="side_li">
                    <a href="#third_position">희망근무조건</a>
                  </li>
                  <li class="side_li">
                    <a href="#fourth_position">경력사항</a>
                  </li>
                  <li class="side_li">
                    <a href="#fifth_position">자기소개서</a>
                  </li>
                </ul>
              </div>
  				
            </div>
          </div>
        </div>

      

      </div>

    </div>
    <!-- /.row -->
	</form>
  </div>
  <!-- /.container -->
 


<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>