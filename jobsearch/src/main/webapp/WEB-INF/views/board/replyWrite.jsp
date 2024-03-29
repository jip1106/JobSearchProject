<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/include/header.jsp" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>	
<script type="text/javascript">
$(function(){
	$("button.btn_write").click(function(){
		if($("textarea#input_3").val().length<1){
			alert("내용을 입력해주세요!");
			$("textarea#input_3").focus();
			event.preventDefault();
		}
	})
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.select_action').on('change',function(){
			if($(".select_action option:eq(1)").prop("selected")==true){
				if (confirm("댓글을 수정하시겠습니까?") == true){    
					var commentSeqEdit=$(this).find("option").eq(1).val();
					location.href= "<c:url value='/board/edit_reply.do?commentSeq="+commentSeqEdit+"'/>";
				}else{
					return;
				}
			}else if($(".select_action option:eq(2)").prop("selected")==true){ 
			    if (confirm("정말 삭제하시겠습니까?") == true){    
					var commentSeqDel=$(this).find("option").eq(2).val();
					location.href= "<c:url value='/board/delete_reply.do?commentSeq="+commentSeqDel+"'/>";
			    }else{   //취소
			    	return;
			    }
			}
	});
});
</script>
<script type="text/javascript">
/*글자수 제한 
 https://gahyun-web-diary.tistory.com/26*/
$( document ).ready(function() {
	$("#input_3").keyup(function (e){
    	 var content = $(this).val();       
    	 $('#counter').val(150-content.length);

         if(content.length > 150) {
           $(this).val($(this).val().substring(0, 150));
         }
	});
});

$(document).ready(function(){
	function sample1_execDaumPostcode(){
		$("#divdivdiv").show();		
	}
});
</script>
<script type="text/javascript">
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("div#floatMenu2").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		// 애니메이션 없이 바로 따라감
		 $("div#floatMenu2").css('top', newPosition);
		 

		$("div#floatMenu2").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});
</script>
<style type="text/css">
.unfold{
	float: right;
	cursor: pointer;
}
.answer{
	display: none;
}
/*새로 추가   */
div#floatMenu2 {
    position: absolute;
    top: 289px;
    left: 1335px;
}
div#container {/*  */
	max-width: 750px;
}

.faqlist {/*  */
    margin-top: -28px;
    margin-bottom: 13px;
}
h5.mb-0 {/*  */
    font-size: 17px;
    font-weight: 500;
    color: black;
}
.card-body {
    background: #f3f3f3;
}
img.open_down {
    background-color: #5e87f1;
    resize: both;
    width: 16px;
    height: 15px;
}
th {
    color: #7b7b7b;
}
span.title {
    margin-right: 277px;
    font-weight: 600;
    color: #7b7a91;
}
span.member {
    margin-right: 88px;
    font-weight: 600;
    color: #7b7a91;
}
span.regdate {
    margin-right: 52px;
    font-weight: 600;
    color: #7b7a91;
}
div#card-header {
    border-bottom: 0.5px solid #bdbdbd;
    padding: 16px 0px;
}
button.btn_write {/* 네비게이션 */
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
}
div.btn_list {
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
}
div.btn_top {
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
    border-radius: 7px 7px 0 0;
}
div.btn_bottom {
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
    border-radius: 0 0 7px 7px;
}
.write_menu_div1 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    float: left;
    text-align: center;
    padding: 9px 0;
    margin-right: 7px;
}
input#input_1 {/*  */
    height: calc(1.5em + .75rem + 6px);
    width: 81.8%;
    margin-bottom: 7px;
    border-radius: 0;
}
.reply_parts {/*  */
    margin-bottom: 5px;
    padding: 0 6px;
}
span.reply {/*  */
    font-size: 17px;
    color: black;
    font-weight: bold;
}
span.writer {/*  */
    font-size: 17px;
    color: black;
    font-weight: bold;
}
input#input_2 {/*  */
    height: calc(1.5em + .75rem + 6px);
    width: 81.8%;
    margin-bottom: 7px;
    border-radius: 0;
}
div.write_menu_div22 {/*  */
    font-size: 16px;
    color: white;
}

.write_menu2 {
    margin-bottom: 12px;
}
.write_menu_div3 {
    background-color: #5e87f1;
    width: 183px;
    height: 315px;
    text-align: center;
    float: left;
    padding: 136px 0;
    margin-right: 14px;
}
textarea#input_3 {/*  */
    height: calc(1.5em + .75rem + 150px);
    width: 100%;
    margin-bottom: -10px;
    border-radius: 0;
}
textarea#input_BoardSeq {/*  */
   /*  height: calc(1.5em + .75rem + 280px); */
    width: 100%;
    margin-bottom: 37px;
    margin-top: -23px;
    border-radius: 0;
    border-top: none;
    border-bottom: 2px solid #4876ef;
    border-right: none;
    border-left: none;
}

.FreeTitle {
    margin-bottom: 8px;
    margin-top: 120px;
}
span.Jobsearch {
    font-size: 32px;
    letter-spacing: -1px;
    font-weight: 500;
    color: #4876ef;
    font-weight: bold;
    letter-spacing: -2px;
}
span.text_span1 {
    font-size: 23px;
    margin-left: 8px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
hr.title_hr {
    border: 1px solid #4876ef;
    margin: 0px 0 23px 0;
}
a.tag_a {
    color: white;
    text-decoration: none;
}
img.base_photo {
    resize: both;
    height: 54px;
    position: relative;
    top: -63px;
    left: -1.95px;
    z-index: -1;
}
img.photo_hole {
    resize: both;
    height: 70px;
}
img.photoname {
    resize: both;
    height: 59px;
    position: relative;
    top: -64px;
    left: -1px;
    z-index: -1;
}
img.menu {
    resize: both;
    height: 22px;
    position: relative;
    top: -2px;
    width: 40px;
}
img.Totop {
    resize: both;
    height: 14px;
    position: relative;
    top: -2px;
    width: 40px;
}
img.Tobottom {
    resize: both;
    height: 14px;
    position: relative;
    top: -2px;
    width: 40px;
}
img.write {
    resize: both;
    height: 29px;
    position: relative;
    top: -2px;
    width: 48px;
}
.reply_menu {
    border-bottom: 1px solid #dadada;
    padding: 22px 0px;
    display: flex;
}
.reply_layout {
    border-bottom: 1px solid #dadada;
    padding: 68px 10px;
    text-align: center;
    height: 162px;
}
.photo {
    height: 47px;
    width: 93px;
    margin-right: -7px;
    text-align: center;
    position: relative;
    top: -6px;
}
.re_writer {/*  */
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 4px;
    color: #4876ef;
    margin-top: -21px
}
.re_reg {
    font-size: 14px;
    color: #989898;
    text-align: right;
    position: relative;
    top: 9px;
}
.inner {/*  */
    width: 609px;
}
.re_cont {/*  */
    margin-bottom: 3px;
    line-height: 1.3;
}
span.text_title {/*  */
    font-size: 16px;
}
span.text_cont {/*  */
    font-size: 16px;
}
img.open_down {/*  */
    background-color: #4876ef;
    resize: both;
    width: 16px;
    height: 15px;
}
.card-body {/*  */
    background: white;
    border-bottom: 0.5px solid #b1b1b1;
}
div#card-header {/*  */
    border-bottom: 2px solid #4876ef;
    padding: 16px 12px;
    margin-top: 28px;
}
span.text_reg {/*  */
    font-size: 13px;
    color: #afafaf;
    margin-left: 8px;
}
.reply_write {
    background-color: #f7f7f7;
    margin-top: -13px;
    padding: 9px 26px;
    border-bottom: 1px solid #dadada;
}
input#counter {/*  */
    background-color: #ffffff;
    border: none;
    width: 27px;
    padding: 0;
    height: 14px;
    text-align: right;
    color: #cacaca;
    position: relative;
    top: 5px;
    left: -3px;
}
span#txsub {/*  */
    color: #cacaca;
}
.counter {/*  */
    display: flex;
    flex-wrap: wrap;
    position: relative;
    top: -20px;
    left: 597px;
}
hr#bottom_line {
    margin-top: 0;
    margin-bottom: -1px;
    border-color: white;
}
.delete {
    border: 1px solid #d0d0d0;
    width: 18px;
    height: 18px;
    border-radius: 50%;
    background-color: #e8e8e8;
    position: relative;
    left: 38em;
    text-align: center;
}
span.delete_span {
    position: relative;
    top: -4px;
    font-size: 14px;
}
a.delete_a {
    text-decoration: none;
    color: #b1b1b1;
}
a.tag_a_reply {
	text-decoration: none;
}

.empty_dbt {
	height: 18px;
}

.select_box {
    position: relative;
    left: 18em;
    top: -12px;
    margin-bottom: -30px;
    height: 31px;
    border: none;
    opacity: 0.3;
	background: url("${pageContext.request.contextPath}/resources/images/selectbox.png") center no-repeat;
}

.select_box select {
    position: absolute;
    left: 298px;
    top: -1px;
    width: 74px;
    height: 28px;
    font-size: 15px;
    color: #7b7b7b;
    text-align: center;
    background: #fff;
    opacity: 0;
    border: 1px solid black;
}
/* 댓글 */
.reply_count {
    font-size: 17px;
    margin-top: 14px;
}
img.reply_bar_img {
    resize: both;
    width: 24px;
    position: relative;
    top: -2px;
    margin-left: 3px;
}
span.re_span {
    margin-left: 7px;
}
nav.nav_side {
    position: fixed;
    top: 36px;
    height: 100%;
}
</style>
	
<c:import url="/WEB-INF/views/include/headend.jsp" />

<div class="container" id="container">
	<div class="FreeTitle">
	    <span class="Jobsearch">자유게시판</span>
	    <span class="text_span1">댓글</span>
    </div>
     <hr class="title_hr">

	<div class="faqlist">
		<div id="list_part">
			<div id="card-header" role="tab" id="headingOne">
				<h5 class="mb-0">
					<span class="text_title"> <c:if
							test="${fn:length(boardVo.boardTitle)>30}">
							${fn:substring(boardVo.boardTitle, 0, 30)}...
						</c:if> <c:if test="${fn:length(boardVo.boardTitle)<=30}">
							${boardVo.boardTitle}
						</c:if>
					</span> <span class="text_reg"> <fmt:formatDate
							value="${boardVo.regDate }" pattern="yyyy.MM.dd" />
					</span> <span class="unfold"><img class="open_down" alt="펼치기"
						src="<c:url value='/resources/images/open_down.png'/>"></span>
				</h5>
			</div>

			<div class="answer">
				<div class="card-body">
					<span class="text_cont"> ${boardVo.boardContents } </span>
				</div>
			</div>
		</div>
	</div>
	
<form name="frmSearch" method="post" action="<c:url value='/board/replyWrite.do'/>">
	<div class="reply_write">
		<div class="reply_parts">
			<span class="writer">
			  <c:if test="${fn:length(sessionScope.loginMember.memberName)>0}">
					${fn:substring(sessionScope.loginMember.memberName, 0, 1)}**
              </c:if> 님
			</span>
		</div>
		<textarea style="resize: none" id="input_3" class="form-control" name="commentDesc" placeholder="댓글을 작성해주세요."></textarea>
		<div class="counter">
			<input type="text" readonly  value="150" name="counter" id="counter" class="form-control">
			<span id="txsub">/150 </span>
        </div>
        <input type="hidden" id="input_3" class="form-control" name="boardType" value="3"> 
		<input type="hidden" id="input_4" class="form-control" name="refMemberseq" value="${loginMember.memberSeq }">
		<input type="hidden" id="input_6" class="form-control" name="refBoardseq" value="${param.boardSeq}">
	</div>
	<div id="floatMenu2">
	<div class=nav_div>
		<a href="#" class="tag_a">	
			<div class="btn_top">
				<img class="Totop" src="<c:url value='/resources/images/Totop.png'/>"> 
			</div>
		</a>
	</div>
	<div class=nav_div>
		<button type="submit" class="btn_write">
			<img class="write" src="<c:url value='/resources/images/write.png'/>">
		</button>
	</div>
	<div class=nav_div>
		<a href="<c:url value='/board/list.do?boardType=3'/>" class="tag_a">	
			<div class="btn_list">
				<img class="menu" src="<c:url value='/resources/images/menu.png'/>">
			</div>
		</a>
	</div>
	<div class=nav_div>
		<a href="#bottom_line" class="tag_a">	
			<div class="btn_bottom">
				<img class="Tobottom" src="<c:url value='/resources/images/Tobottom.png'/>">
			</div>
		</a>
	</div>
	</div>
</form>
<c:if test="${empty list }">
		<div class="reply_layout">
			<span class="empty_reply">댓글이 존재하지 않습니다.</span>
		</div>
	</c:if>
	<c:if test="${!empty list }">
	<div class="reply_count">
		<span class="re_span">댓글</span> 
		<span class="re_count">${count }</span> 
		<span class="re_span2">개</span> 
		<img class="reply_bar_img" src="<c:url value='/resources/images/reply_bar.png'/>">
	</div>
	   	<c:forEach var="item" items="${list }">
			<div class="reply_menu">
				<div class="photo">
					<img class="photo_hole" src="<c:url value='/resources/images/photo_hole.png'/>">
					<c:if test="${!empty item.PHOTO }">
						<img class="photoname" src="<c:url value='/resources/upload_images/${item.PHOTO }'/>" alt="${item.PHOTO } 로고">
					</c:if>
					<c:if test="${empty item.PHOTO }">
						<img class="base_photo" src="<c:url value='/resources/images/base.png'/>">
					</c:if>
				</div>
				<div class="inner">
					<c:if test="${sessionScope.loginMember.memberSeq!=item.MEMBERSEQ }">
						<div class="empty_dbt"></div>
					</c:if>
					<c:if test="${sessionScope.loginMember.memberSeq==item.MEMBERSEQ }">
						<div id="wrap">
							<div class="select_box">
								<select name="select_reply" class="select_action">
									<option key="default-empty" hidden></option>
									<option value="${item.COMMENTSEQ}">댓글수정</option>
									<option value="${item.COMMENTSEQ}">댓글삭제</option>
								</select>
							</div>
						</div>
					</c:if>
					<div class="re_writer">
						<c:if test="${fn:length(item.MEMBERNAME)>0}">
							${fn:substring(item.MEMBERNAME, 0, 1)}**
	              		</c:if> 
					</div>
					<div class="re_cont">${item.COMMENTDESC}</div>
					<div class="re_reg">
						<fmt:formatDate value="${item.REGDATE}" pattern="yyyy.MM.dd hh:mm:ss" />&nbsp;작성
					</div>
				</div>
			</div>
	    </c:forEach>
	</c:if>
	<hr id="bottom_line">
	 <div class="bottom_banner">
 		<img  class="bannerpicture"src="<c:url value='/resources/images/picture6RE.jpg'/>">
 	</div>
</div>
<c:import url="/WEB-INF/views/include/sidenavi.jsp" />  
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/footer.jsp" />
	
<script type="text/javascript">
	$(document).ready(function() {
		$(".unfold").click(function() {
			$(this).parent().parent().next().toggle();
		});
	});
</script>
	
<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	
	document.frmPage.submit();
}
</script>
</body>

</html>