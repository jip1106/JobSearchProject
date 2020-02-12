<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />

<style>
.mgt-30{
	margin-top:30%;
}

.mgb-30{
	margin-bottom:30%;
}

.mgt-20{
	margin-top:20%;
}

.mgb-20{
	margin-bottom:20%;
}

.mgt-10{
	margin-top:10%;
}

.mgb-10{
	margin-bottom:10%;
}

.findspan a{
	text-decoration:none;
}
body{
	background: url("${pageContext.request.contextPath}/resources/images/login.jpg") center no-repeat;
}
#row{
	height:903px;
}
.layout_all {
    position: relative;
    left: 205px;
    top: 212px;
    display: flex;
    height: 23em;
}
.findPwd {
    width: 368px;
    margin-top: 25px;
}
.findId {
    width: 368px;
    border-right: 2px solid #4876ef;
    margin-top: 26px;
}
.Id {
    width: 18em;
    margin-left: 41px;
}
.pwd {
    width: 18em;
    margin-left: 41px;
}
input#memberName {
    z-index: 100;
    width: 100%;
    height: calc(1.5em + .75rem + 13px);
    margin-bottom: -8px;
}
input#phone {
    z-index: 100;
    width: 100%;
    height: calc(1.5em + .75rem + 13px);
    margin-bottom: -19px;
}
input#memberId {
    z-index: 100;
    width: 100%;
    height: calc(1.5em + .75rem + 13px);
    margin-bottom:77px;
}
.btn-primary {
    color: #fff;
    background-color: #4876ef;
    border-color: #4876ef;
}
.caution {
    text-align: center;
    font-size: 12px;
}
span#findUserId {
    margin-left: 43px;
}
span#findUserPwd {
    margin-left: 36px;
}
.IMG_id {
    margin-bottom: 17px;
}
.IMG_pwd {
    margin-bottom: 52px;
}
span.title_id {
    font-size: 26px;
    font-weight: 600;
    position: relative;
    top: 7px;
}
span.title_pwd {
    font-size: 26px;
    font-weight: 600;
    position: relative;
    top: 7px;
}
img.id_img {
    margin-left: 36px;
}
img.pwd_img {
    margin-left: 18px;
}
button.btn.btn-lg.btn-primary.btn-block.text-uppercase {
    margin-bottom: 10px;
}


/*  */

.col-sm-9.col-md-7.col-lg-5.mx-auto {
    width: 33%;
}
div#box1 {
    position: relative;
    left: -11em;
    top: 63em;
}
div#box2 {
    position: relative;
    top: 18em;
    left: 12em;
}


</style>

<script>
	$(function(){
		$("#phone").keyup(function(){
			var hypenPhone = autoHypenPhone($(this).val());
			//console.log(hypenPhone);
			$(this).val(hypenPhone);
		})
			
	})
	
	//전화번호
	function autoHypenPhone(str){
			
	        str = str.replace(/[^0-9]/g, '');
	        
	        var tmp = '';
	        
	        if( str.length < 4){
	            return str;
	        }else if(str.length < 7){
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3);
	            return tmp;
	        }else if(str.length < 11){
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3, 3);
	            tmp += '-';
	            tmp += str.substr(6);
	            return tmp;
	        }else{              
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3, 4);
	            tmp += '-';
	            tmp += str.substr(7);
	            return tmp;
	        }
	        
	        return str;
	      
	}
	
	function findIdFnc(){
		var memberName = $("#memberName").val();
		var phone = $("#phone").val();
		var requestData = {"memberName":memberName , "phone":phone};
		$.ajax({
			type:"POST",
			url:'/jobsearch/member/findId.do',
			data:requestData,
			dataType : "json",
			cache : false,
			success : function(resData){
				
				console.log(resData);
				
				if(resData.length==0){
					$("#findUserId").css("color","red");
					$("#findUserId").html("일치하는 회원정보가 없습니다.");
				}else{
					var memberId = resData[0]["MEMBER_ID"];
					var regType = resData[0]["REG_TYPE"];
					console.log(regType);
					var sRegType = regType==1?"일반회원":"기업회원";
					
					$("#findUserId").css("color","green");
					$("#findUserId").html(memberId + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원유형은 " + sRegType +" 입니다.");
				}
			},
			error: function(xhr, status, e){
				
			}
		})
	}
	
	function findPwdFnc(){
		var memberId = $("#memberId").val();
		
		$.ajax({
			type:"POST",
			url:'/jobsearch/member/dupchk.do',
			data:{"memberId":memberId},
			dataType : "json",
			cache : false,
			success : function(resData){
				
				if(resData==1){
					sendMailPwd(memberId);
				}else{
					$("#findUserPwd").css("color","red");
					$("#findUserPwd").html("회원 정보가 존재하지 않습니다.");
				}
			},
			error: function(xhr, status, e){
				
			}
		})
	}
	
	//비밀번호 수정
	function sendMailPwd(memberId){
		
		$.ajax({
			type:"POST",
			url:'/jobsearch/member/sendPwdMail.do',
			data:{"memberId":memberId},
			dataType : "json",
			cache : false,
			success : function(resData){
				
				if(resData > 0){
					$("#findUserPwd").css("color","green");
					$("#findUserPwd").html("등록하신 메일로 임시 비밀번호가 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;발송 되었습니다.");
				}

			},
			error: function(xhr, status, e){
				
			}
		})		
		
	}
	
</script>

<body>

<c:import url="/WEB-INF/views/include/navi.jsp" />

  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    
    <div class="row" id="row">
    	<div class="layout_all">
    		<div class="findId">
    			<div class="Id">
    			<div class="IMG_id">
			    	<img class="id_img" src="<c:url value='/resources/images/id.png'/>">			
    				<span class="title_id">아이디찾기</span>
    			</div>
    			 <form name="findId" class="form-signin" method="post" action="">
	              
	              <div class="form-label-group mb-4">
	                <input type="text" id="memberName" name="memberName" class="form-control" placeholder="이름" required autofocus>
	              </div>
	
	              <div class="form-label-group mb-4">
	                <input type="text" id="phone" name="phone" class="form-control" placeholder="010-000-0000" required autofocus>
	              </div>
	              	<div class="row mt-4 mb-4">
	              	<div class="col">
	              		<div class="caution">*회원가입시 입력했던 이름, 번호를 입력 해 주세요.</div>
	              	</div>
					</div>
	              
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" onclick="findIdFnc();">찾기</button>
	              	<div class="col">
	              		<span style="color:red; font-size:0.8em;" id="findUserId">
	              		
	              		</span>
	              	</div>
	            </form>
	              </div>
    		</div>
    		
    		
    		<div class="findPwd">
    		<div class="pwd">
    			<div class="IMG_pwd">
			    	<img class="pwd_img" src="<c:url value='/resources/images/pwd.png'/>">			
	    			<span class="title_pwd">비밀번호찾기</span>
    			</div>
    			
	            <form class="form-signin" method="post" action="">
	              
	              <div class="form-label-group mb-4">
	                <input type="email" id="memberId" name="memberId" class="form-control" placeholder="id를 입력 해 주세요." required autofocus>
	              </div>
	              
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" onclick="findPwdFnc()">찾기</button>
	              	<div class="col">
	              		<span style="color:red; font-size:0.8em;" id="findUserPwd">
	              		
	              		</span>
	              	</div>
	              
	              
	            </form>
    		</div>
    		</div>
    	</div>
    
    
    
    
	<!--     <div class="col-lg-12 col-md-12 col-sm-6" id="box1">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin mgt-10 mgb-10">
	          <div class="card-body">
	            <h3 class="card-title text-center">아이디 찾기</h3>
	           
	            <form name="findId" class="form-signin" method="post" action="">
	              
	              <div class="form-label-group mb-4">
	                <input type="text" id="memberName" name="memberName" class="form-control" placeholder="이름" required autofocus>
	              </div>
	
	              <div class="form-label-group mb-4">
	                <input type="text" id="phone" name="phone" class="form-control" placeholder="010-000-0000" required autofocus>
	              </div>
	              
	              <div class="row mt-4 mb-4">
	              	<div class="col">
	              		<span style="font-size:0.8em;">회원가입시 입력했던 이름, 번호를 입력 해 주세요.</span>
	              	</div>

	              </div>
	              
	              <div class="row mt-4 mb-4">
	              	<div class="col">
	              		<span style="color:red; font-size:0.8em;" id="findUserId">
	              		
	              		</span>
	              	</div>
	              </div>	              
	              
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" onclick="findIdFnc();">찾기</button>

	            </form>
	          </div>
	        </div>
	      </div>
	    </div> -->
	    
	 <!--    <div class="col-lg-12 col-md-12 col-sm-6" id="box2">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin mgt-10 mgb-10">
	          <div class="card-body">
	            <h3 class="card-title text-center">비밀번호 찾기</h3>
	           
	            <form class="form-signin" method="post" action="">
	              
	              <div class="form-label-group mb-4">
	                <input type="email" id="memberId" name="memberId" class="form-control" placeholder="id를 입력 해 주세요." required autofocus>
	              </div>
	              
	              <div class="row mt-4 mb-4">
	              	<div class="col">
	              		<span style="color:red; font-size:0.8em;" id="findUserPwd">
	              		
	              		</span>
	              	</div>
	              </div>	
	              
	              
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" onclick="findPwdFnc()">찾기</button>
	            </form>
	          </div>
	        </div>
	      </div>
	    </div>	   -->  



    </div>


  </div>
  <!-- /.container -->

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
