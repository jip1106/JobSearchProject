<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
<style type="text/css">

.collapsible {
    background-color: #2f4fb5;
    color: white;
    cursor: pointer;
    padding: 18px;
    width: 142%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    border-radius: .25em;
}
.content {
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
  width: 142%;
  border-radius: .25em;
}
input[type=checkbox], input[type=radio] {
    box-sizing: border-box;
    padding-bottom: 0;
    margin-bottom: 17px;
}
td#com_cont_del {
    width: 10px;
}
a.delete {
    width: 34px;
    background-color: #ff4a10;
    color: white;
    margin-bottom: 19px;
    border-radius: .25em;
}
button.btn.com_pay{
	margin-left: 31em;    
    padding: .5rem 1rem;    
    line-height: 1.5;
    border-radius: .3rem;
    width: 150px;
    color:white;
    background: #5e87f1;   
    height: 53px;
    border: none;
    font-size: 17px;    
    margin-right: 74px;
}
.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff
}
td#ListTitle {
    padding-right: 30px;
    width: 100px;
}
td#ListDesc {
    padding-right: 80px;
}
td#ListChk {
    padding-right: 40px;
}
span#deadLine {
    float: left;
}
span#days {
    float: right;
}
p#countDay {
    float: right;
}
</style>
<script type="text/javascript">
	
</script>

<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->
<h2>결제관련</h2>
<a href="<c:url value='/company/companymypageannouncement.do'/>">공고글 작성하기</a>
<hr>
<input type="text" value="${count}" id="count">

<c:set var="idx" value="0"/>
<c:forEach var="vo" items="${list}">
<c:set var="total" value='0'/>
<c:set var="pay" value="0"/>
	<div>
		<span id="deadLine">마감일!</span>
		<span id="days">일</span><p id="countDay">${vo.annEndt}</p>
	</div>
	<table>
	<!-- 반복 시작 -->
			
			<tr><td>
			 <div class="row mb-4 mt-4_text"> 
							<!--<div class="col-lg-4-2t">공고글  </div>  -->
							<div class="col-lg-8 form-label-group mb-2">					
								<button class="collapsible">${vo.annSeq}    ${vo.annTitle} 금액</button>					
								<div class="content">
								<table>
									<tr>
										<td id="ListTitle">제목</td>
										<td id="ListDesc">${vo.annTitle}</td>																													
									</tr>
									<tr>
										<td id="ListTitle">내용</td>
										<td id="ListDesc">${vo.annDesc}</td>																					
									</tr>
									<tr>
										<td id="ListTitle">게시일</td>
										<td id="ListDesc">${vo.annStdt}</td>									
									</tr>
									<tr>
										<td id="ListTitle">마감일</td>
										<td id="ListDesc">${vo.annEndt}</td>									
									</tr>
									<tr>
										<td>결제 옵션</td>
										<td>
											<select class="pay">
												<option value="">선택</option>
												<option value="10000">만원</option>
												<option value="20000">2만원</option>
												<option value="30000">3만원</option>
											</select>											
										</td>
										
									</tr>
								</table>
								</div> 
							<div id="idchkdiv" class="chkmessage"> </div>
							
							</div>
						</div>
			 </td>  
			</tr>
			<tr>
				<td>선택한 금액<input type="text" class="price" id="pr_${idx }" value="${pay}"></td>
				<c:set var="idx" value="${idx+1}"/>
				<c:set var="total" value="${total+pay}"/>
			</tr>
		 <!-- 반복 끝 --> 
	 </table>
 </c:forEach>
 
 <input type="button" id="sure" value="확정하기!">
 <hr>
 <br>총액     :<input type="text" id="total" value=" "> <br><br><!-- 계산 들어갈 여유 공간 -->
 <hr>
 <div id="edit_bt">
  				<button class="btn com_pay" type="submit">결제하기</button>  				
 </div>
 
 <script>
 var total=0;
	$(function(){
		$(".pay").each(function(index,item){
			$(this).change(function(){
				var pay=$(this).val();
				$("#pr_"+index).val(pay);				
			});
						
		});
		$("#sure").click(function(index,item){
			
		});			
		
	});
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
