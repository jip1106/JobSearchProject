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
</style>



<body>

<c:import url="/WEB-INF/views/include/navi.jsp" />

  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    
    <div class="row">
    
	    <div class="col-lg-12 col-md-12 col-sm-6">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin mgt-10 mgb-10">
	          <div class="card-body">
	            <h3 class="card-title text-center">회원정보수정(인증)</h3>
	           
	            <form name="chkFrm" class="form-signin" method="post" action="/jobsearch/member/chkMem.do">
	              
	              <div class="form-label-group mb-4 mt-4">
	                <span>아이디 : ${sessionScope.loginMember.memberId }</span>
	                <input type="text" name="memberId" value="${sessionScope.loginMember.memberId }">
	              </div>
	
	              <div class="form-label-group mb-4">
	                <span>비밀번호 : </span><input type="password" id="memberPwd" name="memberPwd" class="form-control" required autofocus>
	              </div>
	              
	              <div class="row mt-4 mb-4">
	              	<div class="col">
	              		<span style="font-size:0.8em;">비밀번호를 입력 해 주세요.</span>
	              	</div>

	              </div>
	              
	              <div class="row mt-4 mb-4">
	              	<div class="col">
	              		<span style="color:red; font-size:0.8em;" id="findUserId">
	              		
	              		</span>
	              	</div>
	              </div>	              
	              
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">확인</button>

	            </form>
	          </div>
	        </div>
	      </div>
	    </div>
	    

    </div>


  </div>
  <!-- /.container -->

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
