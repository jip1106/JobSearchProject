<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
.card.card-signin.mgt-10.mgb-10 {
    position: relative;
    top: 165px;
}
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
.Jebsearch {
    font-family: 'Recipekorea';
    text-align: center;
    font-size: 47px;
    color: #4876ef;
    margin-bottom: 31px;
    margin-top: 6px;
}
input#memberId {
    width: 100%;
    height: calc(2.25rem + 13px);
    margin-bottom: -4px;
}
input#memberPwd {
    width: 100%;
    height: calc(2.25rem + 13px);
    margin-bottom: 26px;
}
div#layout {
    height: 0;
    margin-top: 32px;
}
/* https://www.codingfactory.net/10820 */
.btn-primary {
    color: #fff;
    background-color: #4876ef;
    border-color: #4876ef;
}
.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle {
    color: #fff;
    background-color: #63adfd;
    border-color: #63adfd;
}
label.btn.btn-primary {
    width: 162px;
    height: 44px;
    padding: 9px 0;
}
div#layout {
    height: 0;
}
.col-sm-9.col-md-7.col-lg-5.mx-auto {
    max-width: 38%;
}
button.btn.btn-lg.btn-primary.btn-block.text-uppercase {
    margin-bottom: 10px;
}
.radiobt {
    display: flex;
    margin-left: 46px;
}
.FIND {
    text-align: center;
}
span.applyspan {
    margin-right: 23px;
}
a {
    color: black;
    text-decoration: none;
}
a.apply {
    text-decoration: none;
}
div#message {
    font-size: 13px;
    text-align: center;
    position: relative;
    top: -130px;
}
a.JT {
    color: #4876ef;
    text-decoration: none;
}
</style>

<script>
	function inputChk(){
		if($("#memberId").val()==""){
			alert("아이디를 입력 해 주세요.");
			return false;
		}
		if($("#memberPwd").val() == "")){
			alert("비밀번호를 입력 해 주세요.");
			return false;
		}
	}
</script>

<body>

<c:import url="/WEB-INF/views/include/navi.jsp" />


  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <div class="row" id="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin mgt-10 mgb-10" id="layout">
          <div class="card-body">
            <div class="Jebsearch">
            	<a class="JT" href="${pageContext.request.contextPath }/home.do">JobSearch</a>
            </div>
            
           
            <form class="form-signin" method="post" action="<c:url value='/member/loginCheck.do'/>" onsubmit="inputChk();">
            
              <div class="radiobt">
              	<div class="col-lg-6">
	              	<label class="radio-inline">
					  <input type="radio" name="regType" id="inlineRadio1" value="1" checked > 일반회원
					</label>
				</div>
				<div class="col-lg-6">	
					<label class="radio-inline">
					  <input type="radio" name="regType" id="inlineRadio2" value="2"> 기업회원
					</label>
				</div>
              </div>  
            <!-- 
				<div class="radiobt">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-primary">
								<input type="radio" name="regType" id="jb-radio-1" value="1" checked> 일반회원
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="regType" id="jb-radio-1" value="2"> 기업회원
							</label>
						</div>
					</div>
				</div> -->
              
              
              <div class="form-label-group mb-4">
                <input type="email" id="memberId" name="memberId" class="form-control" placeholder="test@abc.com" required autofocus>
              </div>

              <div class="form-label-group mb-4">
                <input type="password" id="memberPwd" name="memberPwd" class="form-control" placeholder="Password" required>
              </div>
            
            
			
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
              	<div class="FIND">
              	  <span class="applyspan"><a class="apply" href="<c:url value="/member/register.do"/>">회원가입</a></span>
              	  <span class="findspan"><a href="<c:url value="/member/findIdPwd.do"/>">아이디/비밀번호 찾기</a></span>
              	</div>
              	<%-- <div class="col-lg-6 text-center">
              	  <span class="findspan"><a href="<c:url value="/member/findIdPwd.do"/>">비밀번호 찾기</a></span>
              	</div> --%>
              	    <div class="row mb-4 mt-4" id="message">
              	<div class="col">
              		<span style="color:red;">${message }</span>
              	</div>
              </div>
              
            </form>
          </div>
        </div>
      </div>
    

    </div>


  </div>
  <!-- /.container -->

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
