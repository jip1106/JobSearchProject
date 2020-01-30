<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

<style type="text/css">
.span_title_edit{
	text-align: center;
    list-style: telugu;
    color: #222;
    font-size: 29px;
    font-weight: bold;
    margin-bottom: 50px;
    margin-top: 22px;
}
.resume_photo {
    position: absolute;
    top: 141px;
    right: 80px;
    padding: 9px;
    width: 120px;
    height: 160px;
    border: 1px solid #e9e9e9;
    box-sizing: border-box;
    text-align: center;
    background-color: #fff;
}
.inpRdoSw.sizeXL.resume_right.focus {
    position: absolute;
    top: 20.6em;
    right: 3.3em;
}
.col-lg-4-6t {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
}
.col-lg-4-7t {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
}
.col-lg-4-3t {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
}
span.point-6t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 59px;
}
span.point-7t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 42px;
}
span.point-4t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 95px;
}
span.point-2t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 131px;
}
span.point-3t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 113px;
}
input#Insert_text_da {
    width: 107%;
    height: calc(1.5em + .75rem + 15px);
    margin-left: 191px;
}
button.btn.btn-lg.btn-primary.btn-block.text-edit {
    background: #5e87f1;
    width: 17%;
    height: 53px;
    border: none;
    font-size: 17px;
    flaot: left;
    float: left;
    margin-right: 74px;
}
button.btn.btn-lg.btn-primary.btn-block.text-withdrawal {
    background: #5e87f1;
    width: 17%;
    height: 53px;
    border: none;
    font-size: 17px;
    float: left;
    margin-top: -1px;
}
.card.mb-4-bt-edit {
    padding: 26px 29px 16px 29px;
    margin-bottom: 5px;
}
input#zipCode {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
}
input#address {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
}
input#detailAddress  {
    width: 107%;
    height: calc(1.5em + .75rem + 15px);
    margin-left: 191px;
}
input#extraAddress  {
    width: 107%;
    height: calc(1.5em + .75rem + 15px);
    margin-left: 191px;
}
a.btn.btn-primary {
    color: #ffffff;
    background-color: #5e87f1;
    border-color: #5e87f1;
    padding: 12px 29px;
    position: relative;
    left: 35.6em;
    top: -59px;
    margin-bottom: -60px;
    font-size: 17px;
}
div#edit_bt {
    position: relative;
    left: 20.6em;
    margin-top: 51px;
    margin-bottom: 49px;
}

.col-lg-4-3t-ca {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
    margin-right: 49px;
}
.col-lg-4-6t-ca {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
    margin-right: 42px;
}
.col-lg-4-4t-ca {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
    margin-right: 77px;
}
.col-lg-4-2t-ca {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
    margin-right: 109px;
}

input#Insert_text_ca {
    width: 42%;
    height: calc(1.5em + .75rem + 15px);
}
input#foundation {
    width: 42%;
    height: calc(1.5em + .75rem + 15px);
}
input#foundation2{
    width: 42%;
    height: calc(1.5em + .75rem + 15px);
}
select#foundation {
	 width: 42%;
    height: calc(1.5em + .75rem + 15px);
}
.row.mb-4.mt-4_text_tel {
    position: relative;
    top: -70px;
    left: 23em;
}
.memberNo_money {
    position: relative;
    top: -80px;
}
.companyType {
    position: relative;
    top: -13.8em;
    left: 23em;
}
hr.companyAdd {
    padding-bottom: 21px;
}
.col-lg-8.form-label-group.mb-2-companycont {
    position: relative;
    top: -200px;
    left: 88px;
}
textarea#textarea_companycont {
    width: 39.3em;
    height: 16em;
    margin-bottom: -183px;
}
input#upfile{
	visibility: hidden;
}
.comImg_photo {
    position: absolute;
    top: 141px;
    right: 24px;
    padding: 9px;
    width: 220px;
    height: 116px;
    border: 1px solid #e9e9e9;
    box-sizing: border-box;
    text-align: center;
    background-color: #fff;
}
.btn_Com_Info_sub{
		color: #fff;
	    background-color: #007bff;
	    border-color: #007bff;
	    padding: .375rem .75rem;
	    height: calc(1.5em + .75rem + 2px);
	    font-size: 1rem;
	    font-weight: 400;	  
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	    margin-top: 34px;
    	margin-right: -2px;
	    position: absolute;
    	width: 100px;
   		z-index: 3;
    	top: 113px;
   		right: 59px;
}


</style>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- datePicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<!-- datePicker -->
<script type="text/javascript">
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
	$("#foundation").datepicker({
	
	});
	
	$(".btn_Com_Info_sub").click(function(){
		$("#divfile").html('<input type="file" name="upfile" id="upfile" accept="image/*" onchange="getThumbnailPrivew()">');	
		
	});

});


//썸네일 펑션
function getThumbnailPrivew(html, $target) {

    var fileInput = document.getElementById("upfile");
    var file = fileInput.files[0];
    var reader = new FileReader();
    
    reader.onload = function(e){
    	$("#comImgPre").attr("src","")
    	$("#comImgPre").attr("src",e.target.result);
    };
    reader.readAsDataURL(file);
}

</script>

<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->

<form action="<c:url value='/company/companymypageedit.do'/>" method="post" name="comInfoForm"  enctype="multipart/form-data" >
  <div class="span_title_edit">기업정보수정</div>
  	<div class="comImg_photo"> 		 	
       <div class="comImgPre">
      	<c:choose>
      	<c:when test="${empty vo.comRenameimage}" >
	       	<img class="comImgPre" id="comImgPre" src="<c:url value='/resources/images/logo_default.gif'/>" style="max-width:190px; max-height:95px;">
	       	<input type="file" name="upfile" id="upfile" accept="image/*" onchange="getThumbnailPrivew()"></c:when>
       	<c:when test="${!empty vo.comRenameimage}">
       		<img class="comImgPre" id="comImgPre" src="<c:url value='/resources/upload_images/${vo.comRenameimage}'/>" style="max-width:190px; max-height:95px;"></c:when>       	
       		
       	</c:choose>
       	
       	<input type="hidden" name="chkComImage" value="${vo.comRenameimage}">
       	             
	     <br> <!-- 로고이미지 -->	         
	     <label for="upfile" class="btn_Com_Info_sub" >기업로고</label>
	     <div id="divfile"></div>
	   </div>	     
            <a class="photo_delete" href="##" style="display:none;">
            <span class="blind">사진 삭제</span></a>
    	</div>
    	
		    <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-7t">사업자등록번호  </div>
				<span class="point-7t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="comRegNum" class="form-control" value="${vo.comRegnumber}" readonly="readonly" autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>			
			<input type="hidden" name="memberSeq" value="${vo.refMemberseq}">
			<input type="hidden" name="refMemberseq" value="${vo.refMemberseq}">
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">대표자명  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="ceoName" class="form-control" value="${vo.ceoName}" placeholder="대표자명" readonly="readonly" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
		    
		        
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-3t">기업명  </div>
				<span class="point-3t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="comName" class="form-control" value="${vo.comName}" placeholder="기업명" readonly="readonly" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">우편번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="zipCode" name="zipCode" class="form-control" value="${loginMember.zipCode}" placeholder="우편번호" required autofocus readonly onclick="sample3_execDaumPostcode()">
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
				
				
			</div>
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">주소  </div>
				<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="address" name="address" class="form-control" value="${loginMember.address}" placeholder="주소"  required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
					<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="detailAddress" name="detailAddress" class="form-control" value="${loginMember.detailAddress}" placeholder="상세주소" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
					<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="extraAddress" name="extraAddress" class="form-control" value="${loginMember.extraAddress}" placeholder="참고항목" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
			  <div id="wrap" style="display:none;border:1px solid;width:100%;height:150px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" 
					style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			  </div>
			
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">담당자명  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="memberName" value="${loginMember.memberName}" class="form-control" placeholder="담당자명" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
		     <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-7t">담당자전화번호  </div>
				<span class="point-7t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="phone" class="form-control" value="${loginMember.phone}" placeholder="담당자전화번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
 			<%--
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">비밀번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="memberPwd" class="form-control" value="#{loginMember.memberPwd}" placeholder="비밀번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"></div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-6t">비밀번호확인  </div>
				<span class="point-6t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="memberPwd" class="form-control" placeholder="비밀번호확인" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div> --%> 
			
	     <hr class="companyAdd">
	     	<h3>추가 기입사항</h3>
	     			<c:if test=""></c:if>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-3t-ca">설립일  </div>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="foundation" name="setupDate" class="form-control" value="${vo.setupDate}" placeholder="설립일" required autofocus readonly>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text_tel">
				<div class="col-lg-4-6t-ca">회사전화번호  </div>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_ca" name="comTel" class="form-control" value="${vo.comTel}" placeholder="회사전화번호  "autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class=memberNo_money>
			 <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-3t-ca">사원수  </div>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text"  id="foundation" name="employeeNum" class="form-control" value="${vo.employeeNum}" placeholder="사원수  "autofocus >
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			 <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-3t-ca">매출액  </div>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text"  id="foundation" name="comSales" class="form-control" value="${vo.comSales}" placeholder="매출액" autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			</div>
			<div class="companyType">
			 <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t-ca">기업형태  </div>
				<div class="col-lg-8 form-label-group mb-2">
					<select id="foundation" name="comType" class="form-control">
						<option value="">선택해주세요</option>
					<c:choose>
					<c:when test="${!empty vo.comType}">						
						<option value="대기업" <c:if test="${vo.comType eq '대기업'}"> selected </c:if>>대기업</option>
						<option value="중견기업" <c:if test="${vo.comType eq '중견기업'}"> selected </c:if>>중견기업</option>
						<option value="중소기업" <c:if test="${vo.comType eq '중소기업'}"> selected </c:if>>중소기업</option>
					</c:when>
					<c:when test="${empty vo.comType}">
						<option value="대기업" >대기업</option>
						<option value="중견기업">중견기업</option>
						<option value="중소기업">중소기업</option>
					</c:when>
					</c:choose>
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			 <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t-ca">업 종  </div>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="foundation2" name="comField" class="form-control" value="${vo.comField}" placeholder="업종" autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			</div>
			
				<div class="col-lg-8 form-label-group mb-2-companycont">
					<textarea style="resize:none" id="textarea_companycont" class="form-control" name="comDesc" placeholder="회사설명을 간략히 써주세요." autofocus>${vo.comDesc}</textarea>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			
			
			<div id="edit_bt">
  				<button class="btn btn-lg btn-primary btn-block text-edit" type="submit">수정</button>
 			</div>
</form>        
  
<script>
//우편번호 찾기 찾기 화면을 넣을 element
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipCode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}

</script> 
  
  
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
