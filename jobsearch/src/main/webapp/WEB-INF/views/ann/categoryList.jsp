<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />


<script>
	//두번쨰 카테고리 가져오기
	function selectCategoryList(cateSeq1,cateName1){
		 $("#selectedArea").show();
		 
		 $("#cateSeq1").val(cateSeq1);
		 $("#cateSeq2").val("");
		 $("#cateSeq3").val("");
		 
		 //선택직종1
		 $("#selectedCate1").html(cateName1);
		 //선택직종2
		 $("#selectedCate2").html("");
		 //선택직종3
		 $("#selectedCate3").html("");
		 
		 
		 
		 $("#categoryList3").html("← 직업을 선택해주세요");
		
		 $.ajax({ 
			type:"POST", 
			url: '/jobsearch/cate/subCategoryList.do', 
			data:{"cateSeq1": cateSeq1 },
			dataType: "json", 
			cache : false, 
			success : function(resData){ 
				console.log(resData);
				var addHtml = '';
				
				
				for(var i=0; i<resData.length; i++){
					addHtml += '<div class="row category">';
					addHtml += 	'<span onclick="selectCategoryList2(\'' + resData[i].cateSeq2 +  '\',\'' + resData[i].cateName2 + '\' )"> ';
					addHtml += 		resData[i].cateName2;
					addHtml +=  '</span>';
					addHtml += '</div>';
				}
								
				$("#categoryList2").html(addHtml);
			}, 
			error : function(xhr, status, e){ 
				console.log(status);
			} 
		});
	}
	
	//세번째 카테고리 가져오기
	function selectCategoryList2(cateSeq2,cateName2){
		
		selectedList = new Array();
		cnt=0;
		
		var cateSeq1 = $("#cateSeq1").val();
		
		if(cateSeq1 == ""){
			alert("직종1을 먼저 선택 해 주세요.");
			return false;
		}
		 $("#cateSeq1").val(cateSeq1);
		 $("#cateSeq2").val(cateSeq2);
		 $("#cateSeq3").val("");
		
		//선택직종2
		 $("#selectedCate2").html(cateName2);
		
		$.ajax({ 
			type:"POST", 
			url: '/jobsearch/cate/thirdCategoryList.do', 
			data:{"cateSeq1": cateSeq1 , "cateSeq2":cateSeq2},
			dataType: "json", 
			cache : false, 
			success : function(resData){ 
				console.log(resData);
				var addHtml = '';
				
				
				for(var i=0; i<resData.length; i++){
					addHtml += '<div class="col-md-4">';
					addHtml += 	'<label for="cate3_' + i + '" onclick="addSelectedOption(\'' + resData[i].cateName3+ '\', \'' + i + '\')">';
					addHtml += 		'<input type="checkbox" value="' + resData[i].cateSeq3 + '" name="cateChkBox" id="cate3_' + i  + '" >' + resData[i].cateName3 ; 
					addHtml +=  '</label>';
					addHtml += '</div>';
				}
				
				$("#categoryList3").html(addHtml);

			}, 
			error : function(xhr, status, e){ 
				console.log(status);
			} 
		});
	}
	
	var selectedList;
	var cnt = 0;
	
	function addSelectedOption(cateName3,idx){
		
		var str= "";
		var checkedId = "cate3_" + idx;
		
		if($("#"+checkedId).prop("checked")){	//체크 한 경우
			selectedList[cnt++] = cateName3;		
		}else{
			for(var i=0; i<selectedList.length; i++){
				if(selectedList[i] == cateName3){
					selectedList[i] = '';
				}
			}
		}
		
		for(var i=0; i<selectedList.length; i++){
			str += selectedList[i] + "  ";
		}
		
		$("#selectedCate3").html(str);
		
	}
	
	function searchAnn(currentPage){
				
		var cateSeq3 = $("#cateSeq3").val();
		
		if($("#cateSeq3").val() == ""){
			$("#categoryList3 input[type=checkbox]").each(function(){
				if($(this).prop("checked")){
					cateSeq3 += $(this).val() + ",";
				}
			})
		}
		
		var cateSeq1 = $("#cateSeq1").val();
		var cateSeq2 = $("#cateSeq2").val();
		$("#cateSeq3").val(cateSeq3);
		cateSeq3 = $("#cateSeq3").val();
		
		
		if(cateSeq1 == "" || cateSeq2 == "" || cateSeq3 == ""){
			alert("직종을 선택 해 주세요.");
			return false;
		}else{

			var obj = document.frmSearch;
			obj.currentPage.value = currentPage;
			
			obj.submit();

			
		}
		
	}
	
	function annView(annSeq){
		window.open("<c:url value='/ann/detail.do?annSeq='/>"+annSeq, annSeq+"번 공고 상세보기", 
				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
</script>
<style>
	.category{
		cursor:pointer;
		margin-top:3px;
	}
	
	.resultArea{
		width:70%;
		margin-top:5%;
		margin-bottom:5%;
	}
	
/* 잡서치디자인추가 */
div#Category_container {
    width: 960px;
 	margin-top: 86px;
	margin-bottom: 51px;
}
.CateTitle {
    margin-bottom: 3px;
    margin-top: 118px;
}
span.Jobsearch {
    font-family: 'Recipekorea';
    font-size: 32px;
    letter-spacing: -1px;
    /* font-weight: 500; */
    color: #4876ef;
    position: relative;
    top: -4px;
    margin-right:-6px;
}
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
span.text_span1 {
    font-size: 26px;
    margin-left: 8px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span2 {
    font-size: 26px;
    margin-left: 1px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span3 {
    font-size: 26px;
    margin-left: 1px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
hr.title_hr {
    border: 1px solid #4876ef;
    margin: 0px 0 22px 0;
}
.row.mb-4 {
    margin: auto;
}
.col-md-8 {
    padding: 21px 56px;
}
div#categoryList3 {
    position: relative;
    left: -17px;
    color: #a7a7a7;
}
div#selectedArea {
    padding: 19px 0;
}
.resultArea {
    margin-top: -7%;
    margin-bottom: 5%;
    font-size: 16px;
    color: #fb4c4c;
    padding: 11px;
}
input.btn.btn-primary {
    width: 71px;
    height: 42px;
    position: relative;
    top: -9px;
    background-color: #4876ef;
    border-color: #4876ef;
}
a.JT {
    color: #4876ef;
    text-decoration: none;
}
img.card-img-top {
    resize: both;
    max-height: 116px;
    max-width: 220px;
    margin-left: 35px;
}
.comtitle {
    font-size: 20px;
    font-weight: 800;
    letter-spacing: -1px;
    margin-top: -30px;
    /* margin-bottom: 5px; */
}
.comtitle2 {
    font-size: 19px;
    font-weight: 600;
    color: #a0a0a0;
}
.comtitle3 {
    font-weight: 600;
    color: #ff9200;
    font-size: 17px;
}
.card.h-100.text-center {
    border-radius: 0;
}
.card.h-100.text-center {
    border-radius: 0;
    border-bottom: 1px solid #4876ef;
    border-right: 1px solid #4876ef;
    border-left: 1px solid #4876ef;
    border-top: 4px solid #4876ef;
}
.countNum {
    color: red;
}
.card.h-100.text-center {
	-webkit-transform:scale(1);
	-moz-transform:scale(1);
	-ms-transform:scale(1);	
	-o-transform:scale(1);	
	transform:scale(1);
	-webkit-transition:.3s;
	-moz-transition:.3s;
	-ms-transition:.3s;
	-o-transition:.3s;
	transition:.3s;
}
.card.h-100.text-center:hover  {
	-webkit-transform:scale(1.1);
	-moz-transform:scale(1.1);
	-ms-transform:scale(1.1);	
	-o-transform:scale(1.1);
	transform:scale(1.1);
}
hr.hr_bottom {
    border: 1px solid white;
    margin: 28px 0;
}
hr.hr_bottom2 {
    border: 1px solid white;
    margin-bottom: 96px;
}
/* 잡서치디자인추가 */
</style>
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />

  <!-- Page Content -->
  <div class="container" id="Category_container">
   <!--  <h1 class="mt-4 mb-3">직업별
      <small>직종을 선택해 주세요</small>
    </h1> -->
    <!-- <ol class="breadcrumb">
      <li class="breadcrumb-item">
        	
      </li>
    </ol> -->
    
   <div class="CateTitle">
	    <span class="Jobsearch">
	    	<a class="JT" href="${pageContext.request.contextPath }/home.do">JobSearch</a>
	    </span>
	    <span class="text_span1">직업별</span>
	    <span class="text_span2">검색창</span>
	    <span class="text_span3">입니다!</span>
    </div>
    <hr class="title_hr">
     <div class="row mb-4" style="border: 1px solid rgba(0,0,0,.125);text-align:center;">
  		<div class="col-md-2" style="max-height:170px; overflow-y:scroll;">
			<div class="row">
  				<c:forEach var="categoryVo1" items="${categoryList1 }">
  					<div class="col-md-12 category">
  						<span onclick = "selectCategoryList('${categoryVo1.cateSeq1}','${categoryVo1.cateName1 }')">
  							${categoryVo1.cateName1 }
  						</span>
  					</div>
  				</c:forEach>
  			</div>
  		</div>  

  		<div class="col-md-2" style="border-left: 1px solid rgba(0,0,0,.125); max-height:170px; overflow-y:scroll;"> 
  			<div class="row">
  				<div class="col-md-12 category" id="categoryList2">
  					<c:forEach var="categoryVo2" items="${categoryList2 }">
  						<div class="row category">
  							<span onclick= "selectCategoryList2('${categoryVo2.cateSeq2}','${categoryVo2.cateName2 }')" > ${categoryVo2.cateName2 }</span>
  						</div>
  					</c:forEach>
  				</div>
  				
  			</div>
  		</div>
  		
  		<div class="col-md-8">
  			<div class="row" id="categoryList3">
				← 직업을 선택해주세요  				
  			</div>
  		</div>
    </div>
    
    <div class="row mb-4" style="border: 1px solid rgba(0,0,0,.125); text-align:center; height:67px; display:none;" id="selectedArea">
    	<div class="col-md-2">선택직종:</div>
    	
    	<div class="col-md-2">	 
    		<span id="selectedCate1"></span>
    	</div>
    	
    	<div class="col-md-2"> 
    		<span id="selectedCate2"></span>
    	</div>
    	
    	<div class="col-md-6">
    		<span id="selectedCate3"></span>
    	</div>
    </div>
    
	<div class="row">
    	<div class="col-md-4"></div>
    	<div class="col-md-4"></div>
    	<div class="col-md-4" style="text-align:right;">
    		<input type="button" value="검색" onclick = "searchAnn('1');" class="btn btn-primary">
    	</div> 
    </div>
    
    
    <%//공고영역 %>
    <c:if test="${!empty annList }">
   		
   		<div class="row resultArea">검색 결과(갯수 - ${searchCount }): 
   			<div class="col-md-12">직종 1 : ${searchCateName1 }</div>
   			<div class="col-md-12">직종 2 : ${searchCateName2 }</div>
   			
   			<c:if test="${!empty searchCateName3List }">
   				<div class="col-md-12">
   					직종 3 : 
	   				<c:forEach var="searchList" items="${searchCateName3List}">
	   					${searchList['CATE_NAME3'] }
	   				</c:forEach>
   				</div>
   			</c:if>
   		</div>
   		
	    <div class="row mt-8" style="margin-top:5%;">
	   	 		<c:forEach var="mapData" items="${annList }">
				  <div class="col-lg-4 mb-4" style="cursor: pointer;" onclick="annView('${mapData['ANN_SEQ']}')">
			        <div class="card h-100 text-center">
			        	<c:if test="${!empty mapData['COM_RENAMEIMAGE']}">
			        		<img class="card-img-top" src="/jobsearch/resources/upload_images/${mapData['COM_RENAMEIMAGE'] }" alt="${mapData['COM_NAME'] } 로고" style="max-height:150px;">
			        	</c:if>
			        	<c:if test="${empty mapData['COM_RENAMEIMAGE']}">
			        		<img class="card-img-top" src="/jobsearch/resources/images/no_image.PNG" alt="회사이미지" style="max-height:150px;">
			        	</c:if>
			          
			          <div class="card-body">
			            <div class="comtitle">
			            	<c:if test="${fn:length(mapData['ANN_TITLE'])>14}">
									${fn:substring(mapData['ANN_TITLE'], 0, 14)}..
				     			</c:if>
								<c:if test="${fn:length(mapData['ANN_TITLE'])<=14}">
				          			  ${mapData['ANN_TITLE'] }
								</c:if>	
			             <div class="comtitle2">${mapData['COM_NAME'] }</div>
			          </div>
			          <div class="comtitle3"><fmt:formatDate value ="${mapData['ANN_STDT']}" pattern="yyyy-MM-dd"/>~<fmt:formatDate value ="${mapData['ANN_ENDT']}" pattern="yyyy-MM-dd"/></div>
			            </div>
			        </div>
			      </div>			      
			   </c:forEach>
	     </div>
	     
		    		 
		<ul class="pagination justify-content-center">
			<c:if test="${pagingInfo.firstPage>1 }">
		      <li class="page-item">
		        <a class="page-link" href="#" onclick="searchAnn('${pagingInfo.firstPage-1}')" aria-label="Previous">
		          <span aria-hidden="true">«</span>
		          <span class="sr-only">Previous</span>
		        </a>
		      </li>
	     	</c:if>
				
				<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage }">			  			  	 
				  <li class="page-item">
			        <a class="page-link" href="#" onclick="searchAnn('${i}')" 
			        	<c:if test="${i==pagingInfo.currentPage }">style="background-color:white;"</c:if>>${i }</a>
			      </li>
			    </c:forEach>
      
			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		      <li class="page-item">
		        <a class="page-link" href="#" aria-label="Next" onclick="searchAnn('${pagingInfo.lastPage+1}')">
		          <span aria-hidden="true">»</span>
		          <span class="sr-only">Next</span>
		        </a>
		      </li>
	      	</c:if>
	    </ul>
	</c:if>	
	
	<c:if test="${searchCount == 0 }">
   		<div class="row resultArea">&nbsp;&nbsp;&nbsp;&lt;검색 결과(갯수 : ${searchCount })&gt; 
   			<div class="col-md-12">직종 1 : ${searchCateName1 }</div>
   			<div class="col-md-12">직종 2 : ${searchCateName2 }</div>
   			
   			<c:if test="${!empty searchCateName3List }">
   				<div class="col-md-12">
   					직종 3 : 
	   				<c:forEach var="searchList" items="${searchCateName3List}">
	   					${searchList['CATE_NAME3'] }
	   				</c:forEach>
	   				으로 등록된 공고가 존재하지 않습니다.
   				</div>
   			</c:if>
   			
   		</div>
	</c:if> 	
	<hr class="hr_bottom">
	<div class="bottom_banner">
 		<img class="bannerpicture" src="<c:url value='/resources/images/picture11.jpg'/>">
 	</div>
	<hr class="hr_bottom2">
  </div>
  <!-- /.container -->

	<form method="post" action="<c:url value='/ann/getAnnListBycate.do'/>" name="frmSearch">
		<input type="hidden" name="cateSeq1" id="cateSeq1" value="${param.cateSeq1 }">
		<input type="hidden" name="cateSeq2" id="cateSeq2" value="${param.cateSeq2 }">
		<input type="hidden" name="cateSeq3" id="cateSeq3" value="${param.cateSeq3 }">
		<input type="hidden" name="currentPage" id="currentPage" value="1">
	</form>
	<c:import url="/WEB-INF/views/include/sidenavi.jsp" />  
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>
