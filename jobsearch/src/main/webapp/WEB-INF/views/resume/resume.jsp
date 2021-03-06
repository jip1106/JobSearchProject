<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
/* 입학졸업일자 */
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
                ,minDate: "-80Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "-18Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)         
});

$(function() {
	/* $("#birthday_term").datepicker({

	}); */
    $("#education_term1").datepicker({

    });
    
    $("#education_term2").datepicker({

    });
    
    $("#education_term3").datepicker({

    });
    
    $("#education_term4").datepicker({

    });
    
    $("#education_term5").datepicker({

    });
    
    $("#education_term6").datepicker({

    });
    
    $("#education_term7").datepicker({

    });
    
    $("#education_term8").datepicker({

    });
});

</script>

<script type="text/javascript">
$(document).ready(function() {

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

});
</script>

<script type="text/javascript">
/* 자기소개서: 남은 글자 수 
 https://gahyun-web-diary.tistory.com/26*/
$( document ).ready(function() {
	$("#textarea_it").keyup(function (e){
    	 var content = $(this).val();       
    	 $('#counter').val(1000-content.length);

         if(content.length > 1000) {
           $(this).val($(this).val().substring(0, 1000));
         }
	});
});

$(document).ready(function(){
	function sample1_execDaumPostcode(){
		$("#divdivdiv").show();		
	}
});

 
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
input#extraAddress {
    width: 107%;
    height: calc(1.5em + .75rem + 15px);
    position: relative;
    left: 10.3em;
}
.span_resume_title {
    color: #222;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: -2px;
    line-height: 34px;
}
</style>
<c:import url="/WEB-INF/views/include/headend.jsp" />

<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
  

  <!-- Page Content -->
  <div class="container">
    <div class="row">
    

      <!-- Entries Column -->
      <div class="col-md-8">
      
    	<!-- 이력서 제목 -->
		<!-- <span class="span_resume_title">이력서</span> -->
		<div class="row mb-4 mt-4">
			<!-- <div class="col-lg-4">아이디  </div> -->
			<div class="col-lg-8 form-label-group mb-2">
				<input type="text" id="Insert_title" name="RESUME_TITLE" class="form-control" placeholder="이력서 제목을 입력하세요." required autofocus>
			<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
		

        <!-- 기본정보 -->
       	<span class="span_notice_title">기본정보</span>
        <div class="card mb-4-bt">
        
        <div class="resume_photo">
            <a href="##" class="box_photo" data-api_type="layer" data-api_id="basic_photo">
               +<br><span>사진추가</span>  </a>
            <a class="photo_delete" href="##" style="display:none;">
            <span class="blind">사진 삭제</span></a>
    	</div>
    	
       <!--  <div class="inpRdoSw sizeXL resume_right focus">
			<span class="inOption"> 
			<input name="genderType" id="male" type="radio" value="M" checked=""> 
				<label for="male" class="lbl">남</label>
			</span> <span class="inOption"> 
			<input name="genderType" id="female" type="radio" value="W"> 
			<label for="female" class="lbl">여</label>
			</span>
			<p class="txt_error"></p>
		</div>	 -->
		
        <div class="row mb-4 mt-4_text">
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text_jc" class="form-control">
						<option>구직상태선택</option>
						<option>구직준비중(재학생)</option>
						<option>구직중</option>
						<option>재직중</option>
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">이름  </div>
				<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="memberName" class="form-control" placeholder="이름" value="${vo.memberName }" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">생년월일  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text"  id="birthday_term" name="birthday" class="form-control" value="${vo.birthday }" placeholder="생년월일" value="${birthday }"required autofocus readonly>
					<!-- <input type="text" id="Insert_text" name="BIRTHDAY" class="form-control" placeholder="생년월일" required autofocus> -->
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-3t">이메일  </div>
				<span class="point-3t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="memberId" value="${vo.memberId}" class="form-control" placeholder="이메일" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">전화번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="phone" class="form-control" value="${vo.phone}" placeholder="전화번호" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">우편번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="zipCode" value="${vo.zipCode}" class="form-control" placeholder="우편번호" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">주소  </div>
				<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="address" class="form-control" value="${vo.address }" placeholder="주소" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
					<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_da" name="detailAddress" value="${vo.detailAddress}" class="form-control" placeholder="상세주소" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
					<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="extraAddress" name="extraAddress" class="form-control" value="${vo.extraAddress}" placeholder="참고항목" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
        </div>
   



        <!-- 학력사항 -->
        <span class="span_notice_title">학력사항</span>
        <span class="school_notice">최종학력 선택 후 학력사항을 입력하세요.</span>
		<span class="col-button">
			<a href="#" class="btn btn-primary" onclick="sample1_execDaumPostcode()">고등학교</a>
		</span>
		<span class="col-button">
			<a href="#" class="btn btn-primary"
				onclick="sample2_execDaumPostcode()">대학교</a>
		</span>
		<span class="col-button">
			<a href="#" class="btn btn-primary"
				onclick="sample1_execDaumPostcode()">대학원</a>
		</span>
		
		<div class="card mb-4-bt">
		<div id="divdivdiv">
	        <h4 class="hsc">고등학교 정보 입력</h4>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">학교이름  </div>
				<span class="point-4t">필수</span>
					<div class="col-lg-8 form-label-group mb-2">
						<input type="text" id="Insert_text" name="EDU_NAME" class="form-control" placeholder="학교이름" required autofocus>
					<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">재학기간  </div>
				<span class="point-4t">필수</span>
					<div class="col-lg-8 form-label-group mb-2">
						<input type="text"  id="education_term1" name=" PERIOD_STDT" class="form-control" placeholder="입학일" required autofocus readonly>
						<span class="hyphen">~</span>
						<input type="text"  id="education_term2" name=" PERIOD_STDT" class="form-control" placeholder="졸업일" required autofocus readonly>
					<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
		</div>
        
		
		<hr>
		
		<h4 class="hsc">대학,대학원 정보 입력</h4>
		<div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">대학교구분  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text" class="form-control">
						<option>2,3년제</option>
						<option>4년제</option>
						<option>대학원(석사)</option>
						<option>대학원(박사)</option>
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
		<div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">학교이름  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="EDU_NAME" class="form-control" placeholder="학교이름" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">재학기간  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text"  id="education_term3" name=" PERIOD_STDT" class="form-control" placeholder="입학일" required autofocus readonly>
					<span class="hyphen">~</span>
					<input type="text"  id="education_term4" name=" PERIOD_STDT" class="form-control" placeholder="졸업일" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-2t">학점  </div>
			<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="학점" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-2t">전공  </div>
			<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="전공" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <hr>
        
        <h4 class="hsc">대학,대학원 정보 입력</h4>
		<div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">대학교구분  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text" class="form-control">
						<option>2,3년제</option>
						<option>4년제</option>
						<option>대학원(석사)</option>
						<option>대학원(박사)</option>
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
		<div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">학교이름  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="EDU_NAME" class="form-control" placeholder="학교이름" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">재학기간  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text"  id="education_term5" name=" PERIOD_STDT" class="form-control" placeholder="입학일" required autofocus readonly>
					<span class="hyphen">~</span>
					<input type="text"  id="education_term6" name=" PERIOD_STDT" class="form-control" placeholder="졸업일" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-2t">학점  </div>
			<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="학점" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-2t">전공  </div>
			<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="전공" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        </div>

        <!-- 희망근무조건 -->
        <span class="span_notice_title">희망근무조건</span>
	        <div class="card mb-4-bt">
	        	<div class="col-lg-4-4t-condition">근무형태  </div>
				<span class="point-4t-condition">필수</span>
					<div class="col-lg-8 form-label-group mb-2-condition">
						<select id="Insert_text_condition" class="form-control">
							<option value="">근무형태 선택</option>
							<!-- 반복 시작 -->
				        	<c:forEach var="map" items="${list }">
				        		<option value="${map['EMP_TYPE']}">
				        			${map['EMP_NAME']}
				        		</option>
				        	</c:forEach>
        					<!-- 반복 끝 -->
						</select>
					<div id="idchkdiv" class="chkmessage"> </div>
				    </div>
				    
				    <div class="col-lg-4-4t-condition">직종  </div>
					<span class="point-4t-condition-mon">필수</span>
					<div class="col-lg-8 form-label-group mb-2-condition">
						<select id="Insert_text_condition" class="form-control">
							<option value="">직종 선택</option>
							<!-- 반복 시작 -->
				        	<c:forEach var="map" items="${list_cate }">
				        		<option value="${map['CATE_SEQ1']}">
				        			${map['CATE_NAME1']}
				        		</option>
				        	</c:forEach>
				        	
        					<!-- 반복 끝 -->
						</select>
					<div id="idchkdiv" class="chkmessage"> </div>
				    </div>
				    
				    <div class="col-lg-4-4t-condition">지역  </div>
					<span class="point-4t-condition-mon">필수</span>
					<div class="col-lg-8 form-label-group mb-2-condition">
						<select id="Insert_text_condition" class="form-control">
							<option value="">지역 선택</option>
							<!-- 반복 시작 -->
				        	<c:forEach var="map" items="${list_loca }">
				        		<option value="${map['LOCATION_SEQ1']}">
				        			${map['LOCATION_NAME']}
				        		</option>
				        	</c:forEach>

        					<!-- 반복 끝 -->
						</select>
					<div id="idchkdiv" class="chkmessage"> </div>
				    </div>
				
				<div class="col-lg-4-4t-condition">연봉  </div>
				<span class="point-4t-condition-mon">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_money" name=" PERIOD_STDT" class="form-control" placeholder="연봉" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>          
       		</div>

        <!-- 경력사항 -->
        <span class="span_notice_title">경력사항</span>
        <div class="card mb-4-bt-career">
        <div class="tabContainer">
        <div class="buttonContainer">
        	<button onclick="showPanel(0,'#007bff')">신입</button>
      		<button onclick="showPanel(1,'#007bff')">경력</button>
        </div>
      	    <div class="tabPanel"><span class="newperson">"신입 지원자입니다."</span></div>
    		<div class="tabPanel">
    			<h4 class="career_h4">경력사항 정보 입력</h4>
    			<span class="col-lg-4-newcompany_7t">이전 직장 회사명</span>
				<span class="point-7t-c">필수</span>
				<div class="col-lg-8 form-label-group mb-2-career">
					<input type="text" id="Insert_text_c" name="MEMBER_NAME" class="form-control" placeholder="이전 직장 회사명" required autofocus>
					<div id="idchkdiv" class="chkmessage"> </div>
				</div>
				
					<span class="col-lg-4-newcompany_4t">재직기간</span>
					<span class="point-4t-c">필수</span>
				<div class="col-lg-8 form-label-group mb-2-career">
						<input type="text"  id="education_term7" name=" PERIOD_STDT" class="form-control" placeholder="시작일" required autofocus readonly>
						<span class="hyphen_career">~</span>
						<input type="text"  id="education_term8" name=" PERIOD_STDT" class="form-control" placeholder="종료일" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
				
					<span class="col-lg-4-newcompany_4t_2">담당업무</span>
					<span class="point-4t-c_2">필수</span>
				<div class="col-lg-8 form-label-group mb-2-career">
					<input type="text" id="Insert_text_c" name="MEMBER_NAME" class="form-control" placeholder="담담업무" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
				
					<span class="col-lg-4-newcompany_4t_3">퇴사사유</span>
					<!-- <span class="point-4t-c_2">필수</span> -->
				<div class="col-lg-8 form-label-group mb-2-career">
					<textarea id="textarea_career" class="form-control" name="content" placeholder="퇴사사유" style="resize:none" required autofocus></textarea>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
				
				
				
    		</div>
        </div>
        </div>
        
        
        <!-- 자기소개서 -->
        <span class="span_notice_title">자기소개서</span>
        <span class="school_notice">각 항목명은 변경할 수 있으며 글자수는 최대 1000자로 제한 됩니다.</span>
        <div class="card mb-4-bt">
          <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<input type="text" id="Insert_title_it" name="RESUME_TITLE" class="form-control" placeholder="자소서 제목" required autofocus>
			<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		 <!--  </div> -->
      	   <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<textarea id="textarea_it" class="form-control" name="content" placeholder="자소서 내용" style="resize:none" required autofocus></textarea>
				<span class="txsub">남은 글자수 : </span>
				<input type="text" readonly  value="1000" name="counter" id="counter" class="form-control"></span> 
			<div id="idchkdiv" class="chkmessage"> </div>
			<!-- </div> -->
		  </div>
          
        </div>
        
       <!--   <div id="edit_bt"> -->
  				<button class="btn btn-lg btn-primary btn-block text-set" type="submit">이력서 등록</button>
     	<!-- </div> -->

        <!-- Pagination -->
       <!--  <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
            <a class="page-link" href="#">&larr; Older</a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#">Newer &rarr;</a>
          </li>
        </ul> -->

      </div>

      <!-- 우측네비게이션 -->
      <div class="col-md-4" id="floatMenu_parent">


        <div class="card my-4" id="floatMenu">
          <h5 class="card-header">이력서 항목</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li class="side_li">
                    <a href="#span_notice_title">기본정보</a>
                  </li>
                  <li class="side_li">
                    <a href="#">학력사항</a>
                  </li>
                  <li class="side_li">
                    <a href="#">희망근무조건</a>
                  </li>
                  <li class="side_li">
                    <a href="#">경력사항</a>
                  </li>
                  <li class="side_li">
                    <a href="#">자기소개서</a>
                  </li>
                </ul>
              </div>
             <!--  <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div> -->
        <!--    <div id="edit_bt"> -->
  				<button class="btn btn-lg btn-primary btn-block text-save" type="submit">이력서저장</button>
 		<!-- 	</div> -->
            </div>
          </div>
        </div>

      

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
 

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<c:url value='/resources/js/myScript.js'/>"></script>
<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>