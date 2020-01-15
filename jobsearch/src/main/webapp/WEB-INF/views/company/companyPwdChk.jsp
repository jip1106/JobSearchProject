<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
<script type="text/javascript">
</script>
<style type="text/css">
.span_title_editcheck {
    text-align: center;
    list-style: telugu;
    color: #222;
    font-size: 29px;
    font-weight: bold;
    margin-bottom: 50px;
    margin-top: 22px;
}
span.point-4t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 67px;
    margin-right: 95px;
}
button.btn.btn-lg.btn-primary.btn-block.text-editcheck {
    background: #5e87f1;
   /*  width: 17%; */
    height: 53px;
    border: none;
    font-size: 17px;
    float: left;
    margin-top: -1px;
    margin-bottom: 38px;
}
div#edit_bt {
    margin: 0 auto;
    width: 8em;
}
.col-lg-8.form-label-group.mb-2 {
    margin-left: 27px;
}
.row.mb-4.mt-4_text {
    margin-bottom: 3.7rem!important;
}
.col-lg-4-4t {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 60px;
}
.div_editcheck {
    padding: 94px 0;
}
input#memberPwd {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
}
</style> 
<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->

<div class="div_editcheck">
  <div class="span_title_editcheck">비밀번호확인</div>
  
<form name="frm_Pwd" method="post" action="<c:url value='/company/companyPwdChk.do'/>">
    <div class="row mb-4 mt-4_text">
		<div class="col-lg-4-4t">비밀번호  </div>
		<span class="point-4t">필수</span>
		<div class="col-lg-8 form-label-group mb-2">
			<input type="password" id="memberPwd" name="memberPwd" class="form-control" placeholder="비밀번호" required autofocus>
		<div id="idchkdiv" class="chkmessage"> </div>
		</div>
	</div>
			
	<div id="edit_bt">
		<button class="btn btn-lg btn-primary btn-block text-editcheck" type="submit">확인</button>
	</div> 
</form>
</div>  
  
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />	
</body>
</html>
