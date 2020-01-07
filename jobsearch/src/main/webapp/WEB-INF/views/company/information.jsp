<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />
<style>
	div #btnSm{
		 margin-left: 650px;	 
	}
	
	div #inputCen{
		margin-left:80px;
	}
	p{
		visibility:visible;
		font-size: 70%;
		color: red;
	}
	#tel{
		float:left;
		
	}
	input #comTel2{
		width:20%;
	}
	
	.form-controls{
		padding :.375rem .75rem;
		height: calc(1.5em + .75rem + 2px);		   
		font-size: 1rem;
		font-weight: 400;		
		color: #495057;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid #ced4da;
		border-radius: .25rem;
		transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
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
	    
	}
	.comImgPreP{
		padding: .375rem .75rem;
		width:150px;
		height: 150px;
		border: 1px solid #ced4da;
		border-radius: .25rem;
		transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	 #comImg{
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin:-1px;
		overflow: hidden;
		clip: rect(0,0,0,0);
		border:0;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		if($("#comImg").val().length>0){
			$("#lcomImg").css("visibility","hidden");
		}else if($("#setupDate").val().length>0){
			$("#lsetupDate").css("visibility","hidden");
		}
		
	});
function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');           
            $target.html('<img src="' + e.target.result + '" border="0" alt="" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>

<body>

 <!-- 네비게이션 -->
<c:import url="/WEB-INF/views/include/navi.jsp"/>
 
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">기업회원 
      <small>정보 조회/수정</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">홈으로</a>
      </li>
      <li class="breadcrumb-item active">About</li>
    </ol>

   
   <div class="row">  <!-- 로우가 사이드 하고 본문 위치 설정해줌 -->
      <!--사이드바 -->
   <c:import url="/WEB-INF/views/include/sidebar.jsp"/>
   
   <form name="frmComInfo" action="" method="post" enctype="multipart/form-data">
  
      <!-- 본문 -->
	 	<div class="col-lg-9 mb-4">
	 	
	 		<div id="inputCen">
	 		<table class="comImgPreP">
	        	<tr>
	        		<td class="comImgPre">
	        			
	        		</td>
	        	</tr>
	        </table><br>    
	        <label for="comImg" class="btn_Com_Info_sub" >기업 로고</label>	         
	        <input type="file" id="comImg" name="comImg"accept="image/*" onchange="getThumbnailPrivew(this,$('.comImgPre'))"><p id="set_com" name="comImg">로고이미지를 넣어주세요</p><br> <!-- 로고이미지 -->
	        <label for="setupDate">설립일</label><br>     
	        <input type="text" class="form-controls" id="setupDate" name="setupDate" placeholder="설립일"><p id="set_com" name="setupDate">설립일을 선택해주세요</p><br> <!-- 달력api찾아볼것 -->
	        <label for="employeeNum">사원수</label><br>
	        <input type="text" class="form-controls" id="employeeNum" name="employeeNum" placeholder="사원수" required> 명<p id="set_com" name="employeeNum" >사원수를 입력해주세요</p><BR>
	        <label for="comTel">회사 전화번호</label><BR>
	        <span id="tel" >
	        <select class="form-controls" id="comTel1" name="comTel">
	        	<option>국번</option>
	        	<option>02</option>
	        	<option>031</option>
	        	<option>032</option>
	        	<option>033</option>
	        	<option>041</option>
	        	<option>042</option>
	        	<option>043</option>
	        	<option>044</option>
	        	<option>051</option>
	        </select> - 
	       	<span id="tel2">
	        <input type="text" class="form-controls" id="comTel2" name="comTel2" style="width: 20%"> - 
	        <input type="text" class="form-controls" id="comTel3" name="comTel3" style="width: 30%">
	        </span><br>
	        </span><br><p id="set_com">회사 대표전화번호를 입력해주세요</p><br> <!-- 전화번호 -->
	        <label for="comType">기업형태</label><br><br>
	        <select class="form-controls" id="comType" name="comType">
		        <option>선택해주세요</option>
		        <option>대기업</option>
		        <option>중견기업</option>
		        <option>중소기업</option>
	        </select><br>
	        <label for="comSales">매출액</label><br>
	        <input type="text" class="form-controls" id="comSales" name="comSales" placeholder="연매출"><br>
	        <label for="comFiled">업종</label><br>
	        <input type="text" class="form-controls" id="comFiled" name="comFiled"placeholder="예)금융업,자영업....."><br>
	        <label for="comDesc">간략 소개</label><br>
	        <textarea rows="10" cols="90" class="form-control" id="comDesc" required="" data-validation-required-message="간략한 회사 소개를 적어주세요" maxlength="999" style="resize:none"></textarea><br>
	        
	        </div> 
	        <hr>
	        
	        
	        <div id="btnSm">
	        	<input type="submit" class="btn_Com_Info_sub" value="수정하기" >             
	       	</div>
	    </div>
	 </form>
    </div>
    
  <!-- Footer --> 
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
