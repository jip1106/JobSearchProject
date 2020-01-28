<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
<style type="text/css">

</style>
<script type="text/javascript">
	
</script>

<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->
<h2>결제내역</h2>
<hr>


	
	<table>
	<!-- 반복 시작 -->
			
			<tr><td>
			 <div class="row mb-4 mt-4_text"> 
							<!--<div class="col-lg-4-2t">공고글  </div>  -->
							<div class="col-lg-8 form-label-group mb-2">					
								<button class="collapsible">몇년 몇월 몇일자 결제내역</button>					
								<div class="content">
								<table>
									<tr>
										<td id="ListTitle">결제 시간</td>
										<td id="ListDesc"></td>																													
									</tr>
									<tr>
										<td id="ListTitle">결제 방식</td>
										<td id="ListDesc"></td>																					
									</tr>
									<tr>
										<td id="ListTitle">결제 금액</td>
										<td id="ListDesc"></td>									
									</tr>
									<tr>
										<td id="ListTitle">결제급액 합계</td>
										<td id="ListDesc"></td>									
									</tr>									
								</table>
								</div> 							
							</div>
						</div>
				 </td>  
			</tr>			
		 <!-- 반복 끝 --> 
	 </table>
 
 <script>

var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}
</script>
<!-- collapsible function   -->
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />	
</body>
</html>
