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
		$('#counter').val(1000-content.length);

        if(content.length > 1000) {
          $(this).val($(this).val().substring(0, 1000));
        }
	});	
	
	//학력정보 
	showDiv('1');
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
	       	<span class="span_notice_title">기본정보 </span>
	        <div class="card mb-4-bt">
	        
		        <div class="resume_photo2" >
		            <a href="#" class="box_photo2" data-api_type="layer" data-api_id="basic_photo">
		               +<br><span>사진추가</span>  
		            </a>
		    	</div>
	        
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">이름  </div>
			
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="memberName" name="memberName" class="form-control input-style" placeholder="이름" value="${sessionScope.loginMember.memberName }"   readonly>
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
				<div class="col-lg-4">생년월일  </div>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<fmt:parseDate value="${sessionScope.loginMember.birthday }" var="memberBirthday" pattern="yyyy-MM-dd"/>
					<input type="text"  id="birthday" name="birthday" class="form-control" value="<fmt:formatDate value="${memberBirthday}" pattern="yyyy-MM-dd"/>" placeholder="생년월일"   readonly>
				</div>
			</div>
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">이메일  </div>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="memberId" name="memberId" value="${sessionScope.loginMember.memberId }" class="form-control" placeholder="이메일"   readonly>
				</div>
			</div>
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">전화번호  </div>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="Insert_text" name="phone" class="form-control" value="${sessionScope.loginMember.phone }" placeholder="전화번호"   readonly>
				</div>
			</div>
	        <div class="row mb-4 mt-4">
				<div class="col-lg-4">우편번호  </div>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="zipCode" name="zipCode" value="${sessionScope.loginMember.zipCode}" class="form-control" placeholder="우편번호"   readonly>
				</div>
			</div>
			
			<div class="row mb-4 mt-4">
				<div class="col-lg-4">주소 </div>
				
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="address" name="address" class="form-control" value="${sessionScope.loginMember.address }" placeholder="주소"   readonly>
				</div>
			</div>
			
			<div class="row mb-4 mt-4">
				<div class="col-lg-4">상세주소 </div>
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
		        <span class="span_notice_title">학력사항</span>
		        <span class="school_notice">최종학력 선택 후 학력사항을 입력하세요.</span>
	        </div>
				        
		</div>
		<div class="row mt-2 mb-2">
			<div class="col-lg-8" style="float:left;">
				<button type="button" class="btn btn-primary" onclick="showDiv('1')">고등학교</button>
				<button type="button" class="btn btn-primary" onclick="showDiv('2')">대학교</button>
				<button type="button" class="btn btn-primary" onclick="showDiv('3')">대학원</button>
			</div>
			
		</div>
		
		<div class="card mb-4-bt" id="educationInfo" style="display:none;">
			<input type="hidden" name="educationSize" value="1" id="educationSize">
		
			<div id="infoDiv1" style="display:none;">
				<input type="hidden" name="educationVOList[0].eduType" value="1">
				<input type="hidden" name="educationVOList[0].univType" value="0">
				<input type="hidden" name="educationVOList[0].univScore" value="0">
				<input type="hidden" name="educationVOList[0].univMajor" value="0">
				
				
				<h4 class="hsc">고등학교 정보 입력</h4>
				<div class="row mb-4 mt-4">
					<div class="col-lg-4">학교이름  </div>
					
					<div class="col-lg-4 form-label-group mb-2">
						<input type="text" id="eduNameHigh" name="educationVOList[0].eduName" class="form-control" placeholder="학교이름">
					</div>
				</div>
				
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">재학기간  </div>
					
					<div class="col-lg-8 form-label-group mb-2">
						<input type="text"  id="education_term1" name="educationVOList[0].periodStdt" class="form-control" placeholder="입학일" readonly>
						<span class="hyphen">~</span>
						<input type="text"  id="education_term2" name="educationVOList[0].periodEndt" class="form-control" placeholder="졸업일" readonly>
					</div>
				</div>
			</div>
			
			<div id="infoDiv2" style="display:none;">
				<input type="hidden" name="educationVOList[1].eduType" value="2">
								
				<h4 class="hsc">대학교 정보 입력</h4>
				<div class="row mb-4 mt-4">
				<div class="col-lg-4">대학교구분  </div>
					<div class="col-lg-8 form-label-group mb-2">
						<select id="univType" name="educationVOList[1].univType" class="form-control">
							<option value="">선택</option>
							<option value="1">2,3년제</option>
							<option value="2">4년제</option>
						</select>
					</div>
				</div>
				<div class="row mb-4 mt-4">
					<div class="col-lg-4">학교이름  </div>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="eduNameUniv" name="educationVOList[1].eduName" class="form-control" placeholder="학교이름">
						</div>
				</div>
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">재학기간  </div>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text"  id="education_term3" name="educationVOList[1].periodStdt" class="form-control" placeholder="입학일"   readonly>
							<span class="hyphen">~</span>
							<input type="text"  id="education_term4" name="educationVOList[1].periodEndt" class="form-control" placeholder="졸업일"   readonly>
						</div>
				</div>
		        <div class="row mb-4 mt-4 ">
					<div class="col-lg-4">학점 </div>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univScore" name="educationVOList[1].univScore" class="form-control" placeholder="학점">
						</div>
				</div>
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">전공  </div>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univMajor" name="educationVOList[1].univMajor" class="form-control" placeholder="전공">
						</div>
				</div>
			</div>

			<div id="infoDiv3" style="display:none;">
				<input type="hidden" name="educationVOList[2].eduType" value="3">
				<input type="hidden" name="educationVOList[2].univScore" value="">
				<input type="hidden" name="educationVOList[2].univMajor" value="">
				
				<h4 class="hsc">대학원 정보 입력</h4>
				<div class="row mb-4 mt-4">
				<div class="col-lg-4">대학교구분  </div>
						<div class="col-lg-8 form-label-group mb-2">
							<select id="univType" name="educationVOList[2].univType" class="form-control">
								<option value="">선택</option>
								<option value="3">대학원(석사)</option>
								<option value="4">대학원(박사)</option>
							</select>
						</div>
				</div>
				<div class="row mb-4 mt-4">
					<div class="col-lg-4">학교이름  </div>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="eduNameGs" name="educationVOList[2].eduName" class="form-control" placeholder="학교이름">
						</div>
				</div>
		        <div class="row mb-4 mt-4">
					<div class="col-lg-4">재학기간  </div>
					
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text"  id="education_term5" name="educationVOList[2].periodStdt" class="form-control" placeholder="입학일"   readonly>
							<span class="hyphen">~</span>
							<input type="text"  id="education_term6" name="educationVOList[2].periodEndt" class="form-control" placeholder="졸업일"   readonly>
						</div>
				</div>
			</div>
		</div>
        <!-- 희망근무조건 -->
        <span class="span_notice_title">희망근무조건</span>
	        <div class="card mb-4-bt">
	        	<div class="col-lg-4">근무형태  </div>
				
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
				    
				    <div class="col-lg-4">직종  </div>
					
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
				    
				    <div class="col-lg-4">지역  </div>
					
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
				
				<div class="col-lg-4">연봉  </div>
				
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_money" name="hopeSalary" class="form-control" value="${resumeInfo['HOPE_SALARY'] }">
				</div>          
       		</div>

 
        <!-- 경력사항 -->
        <script>
        	function
        </script>

        <span class="span_notice_title">경력사항</span>
        <input type="hidden" name="careerType" value="1" id="careerType">
        
        <div class="card mb-4-bt-career">
			<ul class="nav nav-tabs" style="width:100%; text-align:center;">
			  <li class="nav-item" style="width:50%;">
			    <a class="nav-link active" data-toggle="tab" href="#newPerson">신입</a>
			  </li>
			  <li class="nav-item" style="width:50%;">
			    <a class="nav-link" data-toggle="tab" href="#oldMan">경력</a>
			  </li>
			</ul>

			<div class="tab-content text-center">
			  <div class="tab-pane fade show active" id="newPerson">
			    <div class="row mb-4 mt-4">
			  		<div class="col-lg-12">
			  		    신입지원자 입니다.
			  		</div>
			  	</div>
			  </div>

			  <div class="tab-pane fade" id="oldMan">
					<div class="row mb-4 mt-4">
		    			<div class="col-lg-4">이전 직장 회사명</div>
						<div class="col-lg-8 form-label-group">
							<input type="text" id="preComname" name="preComname" class="form-control" 
							value="${resumeInfo['PRE_COMNAME']}" placeholder="이전 직장 회사명"  >
						</div>
					</div>
					
					<div class="row mb-4 mt-4">
						<div class="col-lg-4">재직기간</div>
						
						<div class="col-lg-8 form-label-group">
							<div class="col-lg-4" style="display:inline-block;">
								<input type="text"  id="preStdt" name="preStdt" class="form-control" placeholder="시작일"   
								value = "${resumeInfo['PRE_STDT'] }" readonly>
							</div>
							<div class="col-lg-4" style="display:inline-block;">
								<input type="text"  id="preEndt" name="preEndt" class="form-control" placeholder="종료일" 
								value = "${resumeInfo['PRE_ENDT'] }"  readonly>
							</div>
						</div>
					</div>
					
					<div class="row mb-4 mt-4">
						<div class="col-lg-4">담당업무</div>
						<div class="col-lg-8 form-label-group">
							<input type="text" name="manageDesc" class="form-control" placeholder="담담업무"  >
						</div>
					</div>						
					
					<div class="row mb-4 mt-4">
						<div class="col-lg-4">퇴사사유</div>
						<div class="col-lg-8 form-label-group">
							<textarea class="form-control" name="retireDesc" placeholder="퇴사사유" style="resize:none; height:10em;"></textarea>
						</div>
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
				<input type="text" id="Insert_title_it" name="introduceTitle" class="form-control" 
				placeholder="자소서 제목"  value="${resumeInfo['INTRODUCE_TITLE']}">
			</div>
		 <!--  </div> -->
      	   <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<textarea id="textarea_it" class="form-control" name="introduceDesc" placeholder="자소서 내용">${resumeInfo['INTRODUCE_DESC']}</textarea>
				<span class="txsub">남은 글자수 : </span>
					<input type="text" readonly  value="1000" name="counter" id="counter" class="form-control">
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