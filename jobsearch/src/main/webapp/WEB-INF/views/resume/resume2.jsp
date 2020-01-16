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
	
	
	/* 자기소개서: 남은 글자 수 
	 https://gahyun-web-diary.tistory.com/26*/
	$("#textarea_it").keyup(function (e){
		var content = $(this).val();       
		$('#counter').val(1000-content.length);

        if(content.length > 1000) {
          $(this).val($(this).val().substring(0, 1000));
        }
	});	

});
</script>

<script>
	function showDiv(id){
		
		$("#educationInfo").show();
		
		$("#infoDiv1").hide();
		$("#infoDiv2").hide();
		$("#infoDiv3").hide();
		
		for(var i=1; i<=id; i++){
			$("#infoDiv"+i).show();
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
<c:import url="/WEB-INF/views/include/headend.jsp" />

<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
  
  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <!-- Entries Column -->
      <div class="col-md-8">
    	<!-- 이력서 제목 -->
		<div class="row mb-4 mt-4">
			<div class="col-xs-12 md-12 lg-12">
				<input type="text" id="resumeTitle" name="resumeTitle" class="form-control input-style" placeholder="이력서 제목을 입력하세요." required autofocus>
			</div>
		</div>

        <!-- 기본정보 -->
	       	<span class="span_notice_title">기본정보</span>
	        <div class="card mb-4-bt">
	        
		        <div class="resume_photo">
		            <a href="#" class="box_photo" data-api_type="layer" data-api_id="basic_photo">
		               +<br><span>사진추가</span>  
		            </a>
	
		    	</div>
			
	        
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">이름  </div>
				<span class="point-2t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="memberName" name="memberName" class="form-control input-style" placeholder="이름" value="${sessionScope.loginMember.memberName }" required autofocus readonly>
				</div>
				
				<div style="position:absolute;width:150px; height:30px; top:230px; left:80%;">
					<select class="form-control">
						<option value="">구직상태선택</option>
						<option value="1">구직준비중(재학생)</option>
						<option value="2">구직중</option>
						<option value="3">재직중</option>
					</select>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">생년월일  </div>
				<span class="point-4t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text"  id="birthday" name="birthday" class="form-control" value="${sessionScope.loginMember.birthday }" placeholder="생년월일" required autofocus readonly>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-3t">이메일  </div>
				<span class="point-3t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="memberId" name="memberId" value="${sessionScope.loginMember.memberId }" class="form-control" placeholder="이메일" required autofocus readonly>
				
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">전화번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="Insert_text" name="phone" class="form-control" value="${sessionScope.loginMember.phone }" placeholder="전화번호" required autofocus>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">우편번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="zipCode" name="zipCode" value="${sessionScope.loginMember.zipCode}" class="form-control" placeholder="우편번호" required autofocus>
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">주소 </div>
				<span class="point-2t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="address" name="address" class="form-control" value="${sessionScope.loginMember.address }" placeholder="주소" required autofocus>
				
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">상세주소 </div>
				<span class="point-2t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="detailAddress" name="detailAddress" class="form-control" value="${sessionScope.loginMember.detailAddress }" placeholder="주소" required autofocus>
				
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">추가사항</div>
				<span class="point-2t">필수</span>
				<div class="col-xs-4 md-4 lg-4 form-label-group mb-2">
					<input type="text" id="extraAddress" name="extraAddress" class="form-control" value="${sessionScope.loginMember.extraAddress }" placeholder="주소" required autofocus>
				
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
				<button class="btn btn-primary" onclick="showDiv('1')">고등학교</button>
				<button class="btn btn-primary"	onclick="showDiv('2')">대학교</button>
				<button class="btn btn-primary" onclick="showDiv('3')">대학원</button>
			</div>
			
		</div>
		
		<div class="card mb-4-bt" id="educationInfo" style="display:none;">
			
			<div id="infoDiv1" style="display:none;">
		        <h4 class="hsc">고등학교 정보 입력</h4>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-4t">학교이름  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="eduNameHigh" name="eduName" class="form-control" placeholder="학교이름" required autofocus>
						</div>
				</div>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-4t">재학기간  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text"  id="peroidStdtHigh" name="periodStdt" class="form-control" placeholder="입학일" required autofocus readonly>
							<span class="hyphen">~</span>
							<input type="text"  id="peroidEnDtHigh" name="periodEndt" class="form-control" placeholder="졸업일" required autofocus readonly>
						</div>
				</div>
			</div>
	        
			
			<hr>
			
			<div id="infoDiv2" style="display:none;">
				 <h4 class="hsc">대학교 정보 입력</h4>
				<div class="row mb-4 mt-4_text">
				
					<div class="col-lg-4-4t">대학교구분  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<select id="univType" name="univType" class="form-control">
								<option value="">선택</option>
								<option value="1">2,3년제</option>
								<option value="2">4년제</option>
							</select>
						</div>
				</div>
				<div class="row mb-4 mt-4_text">
					<div class="col-lg-4-4t">학교이름  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="eduNameUniv" name="eduName" class="form-control" placeholder="학교이름" required autofocus>
						</div>
				</div>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-4t">재학기간  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text"  id="periodStdtUniv" name="periodStdt" class="form-control" placeholder="입학일" required autofocus readonly>
							<span class="hyphen">~</span>
							<input type="text"  id="periodEtdtUniv" name="periodEndt" class="form-control" placeholder="졸업일" required autofocus readonly>
						</div>
				</div>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-2t">학점  </div>
					<span class="point-2t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univScore" name="univScore" class="form-control" placeholder="학점" required autofocus>
						</div>
				</div>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-2t">전공  </div>
					<span class="point-2t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univMajor" name="univMajor" class="form-control" placeholder="전공" required autofocus>
						</div>
				</div>
			</div>
	        <hr>
	        
	        <div id="infoDiv3" style="display:none;">
		        <h4 class="hsc">대학원 정보 입력</h4>
				<div class="row mb-4 mt-4_text">
					<div class="col-lg-4-4t">대학교구분  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<select id="univType" class="form-control">
								<option value="3">대학원(석사)</option>
								<option value="4">대학원(박사)</option>
							</select>
						</div>
				</div>
				<div class="row mb-4 mt-4_text">
					<div class="col-lg-4-4t">학교이름  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="eduNameGs" name="eduName" class="form-control" placeholder="학교이름" required autofocus>
						</div>
				</div>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-4t">재학기간  </div>
					<span class="point-4t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text"  id="periodStdtGs" name="peroidStdt" class="form-control" placeholder="입학일" required autofocus readonly>
							<span class="hyphen">~</span>
							<input type="text"  id="periodEtdtGs" name="periodEndt" class="form-control" placeholder="졸업일" required autofocus readonly>
						</div>
				</div>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-2t">학점  </div>
					<span class="point-2t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univScoreGs" name="univScore" class="form-control" placeholder="학점" required autofocus>
						</div>
				</div>
		        <div class="row mb-4 mt-4_text">
					<div class="col-lg-4-2t">전공  </div>
					<span class="point-2t">필수</span>
						<div class="col-lg-8 form-label-group mb-2">
							<input type="text" id="univMajorGs" name="univMajor" class="form-control" placeholder="전공" required autofocus>
						</div>
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
							<option>불러와야함</option>
						</select>
					
				    </div>
				
				<div class="col-lg-4-4t-condition">연봉  </div>
				<span class="point-4t-condition-mon">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_money" name="PERIOD_STDT" class="form-control" placeholder="연봉" required autofocus>
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
				</div>
				
					<span class="col-lg-4-newcompany_4t">재직기간</span>
					<span class="point-4t-c">필수</span>
				<div class="col-lg-8 form-label-group mb-2-career">
						<input type="text"  id="education_term7" name=" PERIOD_STDT" class="form-control" placeholder="시작일" required autofocus readonly>
						<span class="hyphen_career">~</span>
						<input type="text"  id="education_term8" name=" PERIOD_STDT" class="form-control" placeholder="종료일" required autofocus readonly>
				</div>
				
					<span class="col-lg-4-newcompany_4t_2">담당업무</span>
					<span class="point-4t-c_2">필수</span>
				<div class="col-lg-8 form-label-group mb-2-career">
					<input type="text" id="Insert_text_c" name="MEMBER_NAME" class="form-control" placeholder="담담업무" required autofocus>
				</div>
				
					<span class="col-lg-4-newcompany_4t_3">퇴사사유</span>
					<!-- <span class="point-4t-c_2">필수</span> -->
				<div class="col-lg-8 form-label-group mb-2-career">
					<textarea id="textarea_career" class="form-control" name="content" placeholder="퇴사사유" required autofocus></textarea>
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
			</div>
		 <!--  </div> -->
      	   <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<textarea id="textarea_it" class="form-control" name="content" placeholder="자소서 내용" required autofocus></textarea>
				<span class="txsub">남은 글자수 : </span>
				<input type="text" readonly  value="1000" name="counter" id="counter" class="form-control"></span> 
 			 </div>
        </div>
        
       
  		<button class="btn btn-lg btn-primary btn-block text-set" type="submit">이력서 등록</button>
     	
	
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
  				<button class="btn btn-lg btn-primary btn-block text-save" type="button">이력서저장</button>
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