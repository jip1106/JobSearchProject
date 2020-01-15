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

</style>
<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->
<h2>공고글 관리하기</h2>
<a href="<c:url value='/company/companymypageannouncement.do'/>">공고글 작성하기</a>
<hr>
<table>
<!-- 반복 시작 -->
<c:forEach var="vo" items="${list}">
<tr><td>
 <div class="row mb-4 mt-4_text"> 
				<!--<div class="col-lg-4-2t">공고글  </div>  -->
				<div class="col-lg-8 form-label-group mb-2">					
					<button class="collapsible">${vo.annSeq}    ${vo.annTitle}</button>					
					<div class="content">
					<table>
						<tr>
							<td>제목</td>
							<td>${vo.annTitle}</td>													
						</tr>
						<tr>
							<td>내용</td>
							<td>${vo.annDesc}</td>														
						</tr>
						<tr>
							<td>게시일</td>
							<td>${vo.annStdt}</td>
						</tr>
						<tr>
							<td>마감일</td>
							<td>${vo.annEndt}</td>	
						</tr>
					</table>
					</div> 
				<div id="idchkdiv" class="chkmessage"> </div>
				
				</div>
			</div>
 </td> 
 <td>
 <input type="checkbox" class="payment">
 <td>
 
 <td id="com_cont_del">
 <a type="button" class="delete" href="<c:url value='/company/companyDeleteMyAnn.do?annSeq=${vo.annSeq}'/>">삭제</a>
 </td>
 
 </c:forEach>
 <!-- 반복 끝 --> 
 </table>
 
 <hr>
 <br>총액<br><br><!-- 계산 들어갈 여유 공간 -->
 <hr>
 <div id="edit_bt">
  				<button class="btn com_pay" type="submit">결제하기</button>  				
 </div>
 <!-- collapsible function -->
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
