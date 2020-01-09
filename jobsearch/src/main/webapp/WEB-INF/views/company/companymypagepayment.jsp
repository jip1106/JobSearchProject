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
input.delete {
    margin-bottom: 16px;
    font-size: 18;
    border: none;
    background-color: #fb612c;
    border-radius: .25em;
    color: white;
}
button.btn.com_pay{
	margin-left: 31em;
    background-color:#2c3663;
    padding: .5rem 1rem;
    font-size: 1.25rem;
    line-height: 1.5;
    border-radius: .3rem;
    width: 150px;
    color:white;
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
<h2>공고글 결제하기</h2>
<hr>
<table>
<!-- 반복 시작 -->
<tr><td>
 <div class="row mb-4 mt-4_text">
				<!--<div class="col-lg-4-2t">공고글  </div>  -->
				<div class="col-lg-8 form-label-group mb-2">
					<button class="collapsible">내용입니다 내용내용 맨</button>
					<div class="content">
					<table>
						<tr>
							<th>제목</td>
							<th>내용</td>
							<th>작성일</td>							
						</tr>
						<tr>
							<td>제목</td>
							<td>내용</td>
							<td>작성일</td>							
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
 <input type="button" class="delete" value="삭제">
 </td>
 
 <!-- 반복 끝 -->
 
 </table> 
 <hr>
 <br>총액<br><br><!-- 계산 들어갈 여유 공간 -->
 <hr>
 <div id="edit_bt">
  				<button class="btn com_pay" type="submit">결제하기</button>  				
 </div>
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
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
	
</body>

</html>
