<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
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
   ,minDate: "-80Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
   ,maxDate: "-18Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)         
});

$(function() {
	$("#birthday_term").datepicker({

	});
});



</script>
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
span.point-6t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 59px;
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
    left: 36em;
    top: -59px;
    margin-bottom: -60px;
    font-size: 17px;
}
div#edit_bt {
    position: relative;
    left: 13.6em;
    margin-top: 51px;
    margin-bottom: 49px;
}
</style> 



<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/mypagenavitop.jsp" />
<!-- section start -->
<form name="frm_mypageedit" method="post" action="<c:url value='/member/mypageedit.do'/>">
  <div class="span_title_edit">회원정보수정</div>
  <div class="resume_photo">
            <a href="##" class="box_photo" data-api_type="layer" data-api_id="basic_photo">
               +<br><span>사진추가</span>  </a>
            <a class="photo_delete" href="##" style="display:none;">
            <span class="blind">사진 삭제</span></a>
    	</div>
    	
        <div class="inpRdoSw sizeXL resume_right focus">
			<span class="inOption"> <input name="genderType" id="male"
				type="radio" value="male" checked=""> 
				<label for="male" class="lbl">남</label>
			</span> <span class="inOption"> 
			<input name="sex" id="female" type="radio" value="female"> 
			<label for="female" class="lbl">여</label>
			</span>
			<p class="txt_error"></p>
		</div>
		    <%-- <input type="text" value="${sessionScope.loginMember.memberName}"/> --%>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">이름  </div>
				<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="memberName" class="form-control" value="${vo.memberName }" placeholder="이름" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	       <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">생년월일  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text"  id="birthday_term" name="birthday" class="form-control" value="${vo.birthday }" placeholder="생년월일" required autofocus readonly>
					<!-- <input type="text" id="Insert_text" name="BIRTHDAY" class="form-control" placeholder="생년월일" required autofocus> -->
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div> 
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">비밀번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="password" id="Insert_text" name="memberPwd" class="form-control" placeholder="비밀번호" >
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-6t">비밀번호확인  </div>
				<span class="point-6t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="password" id="Insert_text" name="memberPwd2" class="form-control" placeholder="비밀번호확인" >
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">전화번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="phone" class="form-control" value="${vo.phone}" placeholder="전화번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">우편번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="zipCode" name="zipCode" class="form-control" value="${vo.zipCode}" placeholder="우편번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
				<!-- 검색 -->
				<div class="col-lg-4"><a href="#" class="btn btn-primary" onclick="sample3_execDaumPostcode()">검색</a></div>
				
			</div>
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">주소  </div>
				<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="address" name="address" class="form-control" value="${vo.address }" placeholder="주소" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
					<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="detailAddress" name="detailAddress" class="form-control" value="${vo.detailAddress}" placeholder="상세주소" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
					<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="extraAddress" name="extraAddress" class="form-control" value="${vo.extraAddress}" placeholder="참고항목" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
			  <div id="wrap" style="display:none;border:1px solid;width:100%;height:150px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" 
					style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			  </div>
			
			<div id="edit_bt">
  				<button class="btn btn-lg btn-primary btn-block text-edit" type="submit">수정</button>
  				<button class="btn btn-lg btn-primary btn-block text-withdrawal"
  				onclick="location.href='<c:url value="member/mypagedeletecheck.do"/>'">회원탈퇴</button>
  				     
 			</div>
</form>
  
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
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
<c:import url="/WEB-INF/views/include/mypagenavibottom.jsp" />
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
