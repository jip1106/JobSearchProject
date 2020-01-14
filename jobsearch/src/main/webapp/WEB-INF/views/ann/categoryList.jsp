<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />
<style>
	.category{
		cursor:pointer;
		margin-top:3px;
	}
</style>

<script>
	//두번쨰 카테고리 가져오기
	function selectCategoryList(cateSeq1,cateName1){
		 $("#cateSeq1").val(cateSeq1);
		 
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
		//alert(cateSeq1);
		//alert(cateSeq2);
		
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
					addHtml += 		'<input type="checkbox" name="cateChkBox" id="cate3_' + i  + '" >' + resData[i].cateName3 ; 
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
</script>
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />

  <!-- Page Content -->
  <div class="container">
    <h1 class="mt-4 mb-3">직업별 공고 리스트
      <small>직업별</small>
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        	직업별 공고 리스트
      </li>
    </ol>
    
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
    
    <div class="row mb-4" style="border: 1px solid rgba(0,0,0,.125); text-align:center; height:100px;">
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
    
  </div>
  <!-- /.container -->

	<form>
		<input type="hidden" name="cateSeq1" id="cateSeq1">
	
	</form>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>
