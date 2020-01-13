<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

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
select#lc_select {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
    margin-left: 0px;
    width: 30%;
}

</style>
<!-- 데이트피커 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 데이트피커 -->
<script>
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
	
	$(function(){		
	    $("#annStdt").datepicker({
	
	    });
	    
	    $("#annEddt").datepicker({
	
	    });
		
	    $("#annForm").submit(function(){
	    	if($("#lc_selected").val().length<1){
	    		alert("지역을 선택해주세요");
	    		event.preventDefault();
	    	}else if($("#lc2_selected").val().length<1){
	    		alert("세부 지역을 선택해주세요");
	    		event.preventDefault();
	    	}
	    	
	    });
	})
	
		

	function selectSecondLocation(selected){
		
		var locationSeq1 = selected.value;
		
		$.ajax({ 
			type:"POST", 
			url: '/jobsearch/loc/sublocList.do', 
			data:{"locationSeq1": locationSeq1 },
			dataType: "json", 
			cache : false, 
			success : function(resData){ 
				
				//console.log(resData);
				
				var addHtml = '<option value="">선택</option>';
			
				
				for(var i=0; i<resData.length; i++){
					var locationName2 = resData[i].locationName2;
					var locationSeq2 = resData[i].locationSeq2;
					
					addHtml += '<option value="' + locationSeq2 + '">' + locationName2 + '</option>'
					
					//console.log(addHtml);
				}
				
				$("#lc_selected").val(locationSeq1);			
				$("#lc2_select").empty();
				$("#lc2_select").append(addHtml);
				$("#lc2_selected").val("");
									
			}, 
			error : function(xhr, status, e){ 
				console.log(status);
			} 
		});
	}

	function sCateList2(selected){
		$("#ca3_select").empty();
		$("#ca3_select").append('<option value="">선택</option>');
		
		var cateSeq1 = selected.value;
		    		
		$.ajax({ 
			type:"POST", 
			url: '/jobsearch/cate/subCategoryList.do', 
			data:{"cateSeq1": cateSeq1 },
			dataType: "json", 
			cache : false, 
			success : function(resData){ 
				
			//	console.log(resData);
				
				var addHtml = '<option value="">선택</option>';
				
				for(var i=0; i<resData.length; i++){
					var cateName2 = resData[i].cateName2;
					var cateSeq2 = resData[i].cateSeq2;
					var refCateSeq1 = resData[i].refCateseq;
					
					addHtml += '<option value="' + cateSeq2 + ';:;' + refCateSeq1 + '">' + cateName2 + '</option>'
					
					//console.log(addHtml);
				}
				$("#ca_selected").val(cateSeq1);
				$("#ca2_select").empty();
				$("#ca2_select").append(addHtml);
				$("#ca2_selected").val("");
				$("#ca3_selected").val("");
									
			}, 
			error : function(xhr, status, e){ 
				console.log(status);
			} 
		});
	}

	function sCateList3(selected){
		
		
		var selectedVal = selected.value;		
		
		var cateSeq2 = selectedVal.split(';:;')[0];
		var cateSeq1 = selectedVal.split(';:;')[1];
		
		$.ajax({ 
			type:"POST", 
			url: '/jobsearch/cate/thirdCategoryList.do', 
			data:{"cateSeq1": cateSeq1 , "cateSeq2" : cateSeq2},
			dataType: "json", 
			cache : false, 
			success : function(resData){ 
				    				    				
				var addHtml = '<option value="">선택</option>';
				
				for(var i=0; i<resData.length; i++){
					var cateName3 = resData[i].cateName3;
					var cateSeq3 = resData[i].cateSeq3;
					
					addHtml += '<option value="' + cateSeq3 + '">' + cateName3 + '</option>'
					
					console.log(addHtml);
				}
				$("#ca2_selected").val(cateSeq2);
				$("#ca3_select").empty();
				$("#ca3_select").append(addHtml);
				$("#ca3_selected").val("");
									
			}, 
			error : function(xhr, status, e){ 
				console.log(status);
			} 
		});
	}
	
	function locaSeq(selected){		
		var locationSeq2 = selected.value;	
		
		$("#lc2_selected").val(locationSeq2);
	}
	function caSeq3(selected){
		var categorySeq3 = selected.value;
		
		$("#ca3_selected").val(categorySeq3);
	}

</script>

<c:import url="/WEB-INF/views/include/headend.jsp" />
<!-- head end -->

<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />

<!-- section start -->
<!-- 지역 선택 --> 

  <div class="card mb-4-bt-edit">
  	 <div id="locTitle">
    	공고 지역:
     </div>
    	<select id="lc_select" class="form-control" onchange="selectSecondLocation(this)">
    		<option value="">선택</option>
    		<c:forEach var="locationVo" items="${locationList1 }">
    			<option value="${locationVo.locationSeq1 }">${locationVo.locationName }</option>
    		</c:forEach>
	   	</select>
	   	
	   	<select id="lc2_select" class="form-control" onchange="locaSeq(this)">
	   		<option value="">선택</option>
	   	</select> 		
		<div id="caution" class="chkmessage">*선택하신 항목은 게시후 검색시 중요하게 사용되므로 신중히 선택해주시기 바랍니다.  </div>
    
<!-- 카테고리선택 -->		
		<div class="row">
		카테고리 :
		<select class="form-control" id="cateList" onchange="sCateList2(this)">
			<option value="">선택</option>
			
			<c:forEach var="categoryVo" items="${categoryList1}">
				<option value="${categoryVo.cateSeq1}">${categoryVo.cateName1 }</option>
			</c:forEach>
			
		</select>
		
		
		<select id="ca2_select" class="form-control"onchange="sCateList3(this)">
			<option value="">선택</option>
		</select>
		
		<select id="ca3_select"class="form-control" onchange="caSeq3(this)">
			<option value="">선택</option>
		</select>
		
		<div id="caution" class="chkmessage">*선택하신 항목은 게시후 검색시 중요하게 사용되므로 신중히 선택해주시기 바랍니다. </div>
	</div>
</div>


<!-- form 시작 -->
<form action="<c:url value='/company/companymypageannouncement.do'/>" method="post" id="annForm" name="annForm" >
	<h1>공고글 작성하기</h1>
	<!-- 제목시작 -->
 		<div class="card mb-4-bt-edit">
 			<div class="row mb-4 mt-4_text"> 				
				<div class="col-lg-4-4t">공고제목  </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_title" name="annTitle" class="form-control" placeholder="제목" required autofocus>
					<div id="idchkdiv" class="chkmessage">
					<!-- hidden으로 넣어줄 셀렉트값 -->
						<input type="hidden" value="0" id="lc_selected" name="refLocationseq1">
		 				<input type="hidden" value="0" id="lc2_selected" name="refLocationseq2"> 
		 				<input type="hidden" value="0" id="ca_selected" name="refCateseq1">
		 				<input type="hidden" value="0" id="ca2_selected" name="refCateseq2"> 
		 				<input type="hidden" value="0" id="ca3_selected" name="refCateseq3">
		 				<input type="hidden" value="0" name="hits">		 				
	 				</div>				
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">경력구분  </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text" name="careerType" class="form-control">
						<option value="경력">경력</option>						
						<option value="신입">신입</option>						
						<option value="무관">무관</option>						
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
							<c:forEach var="vo" items="${empTypeList}">						
							<option value="${vo.empSeq}">${vo.empName}</option>	
							</c:forEach>				
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
		</div>			
		
	
	<h1>추가사항</h1>	
		<div class="card mb-4-bt-edit">	
					
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">내용 </div>
				<span class="point-2t"></span>				
				<div class="col-lg-8 form-label-group mb-2">
					<textarea id="Insert_text" name="annDesc" class="form-control" ></textarea>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
 		</div>
 		
 	<h1>공고 게시기간</h1>
 		<div class="card mb-4-bt-edit"> 			
 			<div class="com-ann-period">
						<input type="text"  id="annStdt" name="annStdt" class="form-control" placeholder="시작일" required readonly>
						<span class="hyphen">~</span>
						<input type="text"  id="annEddt" name="annEddt" class="form-control" placeholder="마감일" required readonly>
			</div>			
		</div>	
		<hr>			
 		<div id="company-ann">
  				<button class="btn-company-ann" type="submit">작성하기</button>
 		</div>
 		 
 </form>

  
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
