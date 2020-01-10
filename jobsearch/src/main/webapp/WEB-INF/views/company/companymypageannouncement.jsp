<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
/* 입학졸업일자 */
$.datepicker.setDefaults({	 
	  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.	 
	  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
	  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.	 
	  closeText: '닫기',  // 닫기 버튼 패널
	  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
	  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
	  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.     
});

$(function() {
	
    $("#education_term1").datepicker({

    });
    
    $("#education_term2").datepicker({

    });   
});
</script>
<style type="text/css">
input#Insert_text_title {
    width: 96%;
    height: calc(1.5em + .75rem + 15px);
}
select#Insert_text {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
    margin-left: 0px;
}
span.point-2t-6t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 70px;
}
textarea.form-control {
    height: 20em;
    resize: none;
}
.btn-company-ann {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
    height: 3em;
    width: 8em;
    border-radius: .25em;
    margin-left: 305px;
}
.com-cat-sel{
	width:50%;
}
.com-loc-sel{
	width:70%;
}
div#caution {
    font-size: 13px;
}
.com-ann-period {
    margin-left: 165px;
}
</style>


<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->
<form action="<c:url value='/announcement/annWrite.do'/>" method="post">
	<h1>공고글 작성하기</h1>
 		<div class="card mb-4-bt-edit">
 			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">공고제목  </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_title" name="annTitle" class="form-control" placeholder="제목" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">경력구분  </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text" name="careerType" class="form-control">
						<option>경력</option>						
						<option>신입</option>						
						<option>무관</option>						
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
							
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">경력추가기입  </div>
				<span class="point-2t-6t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="careerDesc" class="form-control" placeholder="경력사항 추가기입">
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
		
 			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">급여사항  </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="salary" class="form-control" placeholder="예)회사 내규에 따름">
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">나이 사항  </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="ageLimit" class="form-control" placeholder="예)만 25세 이상">
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
				<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">고용형태  </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text" name="employType" class="form-control">
						<option value="">선택하세요</option>
						<option value="">정규직</option>						
						<option value="">교육생</option>						
						<option value="">아르바이트</option>						
						<option value="">병역특례</option>						
						<option value="">인턴</option>						
						<option value="">계약직</option>						
						<option value="">프리랜서</option>						
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
		</div>
			
		
	
	<h1>추가사항</h1>	
		<div class="card mb-4-bt-edit">
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">직종별 </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
				<div class="com-cat-sel">					
					<select id="Insert_text" name="refCateseq1" class="form-control">
						<option>경력</option>											
					</select>
					<br>
					<select id="Insert_text" name="refCateseq2" class="form-control">
						<option>경력</option>											
					</select>
					<br>
					<select id="Insert_text" name="refCateseq3" class="form-control">
						<option>경력</option>											
					</select>
				</div>					
				<div id="caution" class="chkmessage">*선택하신 항목은 게시후 검색시 중요하므로 신중히 선택해주시기 바랍니다. </div>
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">지역별  </div>
				<span class="point-2t"></span>								
				<div class="col-lg-8 form-label-group mb-2">
				<div class="com-loc-sel">
					<select id="Insert_text" name="refLocationseq1" class="form-control">
						<option>경력</option>												
					</select>
					<br>
					<select id="Insert_text" name="refLocationseq2" class="form-control">
						<option>경력</option>												
					</select>
				</div>
				<div id="caution" class="chkmessage">*선택하신 항목은 게시후 검색시 중요하므로 신중히 선택해주시기 바랍니다.  </div>
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">내용 </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<textarea id="Insert_text" name="annDesc" class="form-control" >
					</textarea>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
 		</div>
 		
 	<h1>공고 게시기간</h1>
 		<div class="card mb-4-bt-edit"> 			
 			<div class="com-ann-period">
						<input type="text"  id="education_term1" name="annStdt" class="form-control" placeholder="시작일" required readonly>
						<span class="hyphen">~</span>
						<input type="text"  id="education_term2" name="annEddt" class="form-control" placeholder="마감일" required readonly>
			</div>
			
		</div>	
		<hr>			
 		<div id="company-ann">
  				<button class="btn-company-ann" type="submit">작성하기</button>
 		</div>
 </form>		
 		
  
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
