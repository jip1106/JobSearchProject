<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="./include/header.jsp" />
<c:import url="./include/headend.jsp" />

<body>
<c:import url="./include/navi.jsp"/>
  
  <!-- Page Content -->
  <div class="container">

    <!-- 지역 불러오기 -->
    <div class="row mb-4" style="margin-top:100px; margin-bottom:100px;">
    	공고 지역:
    	<select id="lc_select" onchange="selectSecondLocation(this)">
    		<option value="">선택</option>
    		<c:forEach var="locationVo" items="${locationList1 }">
    			<option value="${locationVo.locationSeq1 }">${locationVo.locationName }</option>
    		</c:forEach>
	   	</select>
	   	
	   	<select id="lc2_select">
	   		<option value="">선택</option>
	   	</select>
    </div>
    
	
	<script>
    	function selectSecondLocation(selected){
    		
    		var locationSeq1 = selected.value;
    		
    		$.ajax({ 
    			type:"POST", 
    			url: '/jobsearch/loc/sublocList.do', 
    			data:{"locationSeq1": locationSeq1 },
    			dataType: "json", 
    			cache : false, 
    			success : function(resData){ 
    				
    				console.log(resData);
    				
    				var addHtml = '<option value="">선택</option>';
    				
    				for(var i=0; i<resData.length; i++){
    					var locationName2 = resData[i].locationName2;
    					var locationSeq2 = resData[i].locationSeq2;
    					
    					addHtml += '<option value="' + locationSeq2 + '">' + locationName2 + '</option>'
    					
    					//console.log(addHtml);
    				}
    				
    				$("#lc2_select").empty();
    				$("#lc2_select").append(addHtml);
										
    			}, 
    			error : function(xhr, status, e){ 
    				console.log(status);
    			} 
    		});
    	}
    </script>
    
    <!-- 지역 불러오기 끝 -->
    
	
	<!-- 카테고리 불러오기 -->
	<div class="row">
		카테고리 :
		<select id="cateList" onchange="sCateList2(this)">
			<option value="">선택</option>
			
			<c:forEach var="categoryVo" items="${categoryList1}">
				<option value="${categoryVo.cateSeq1}">${categoryVo.cateName1 }</option>
			</c:forEach>
			
		</select>
		
		
		<select id="ca2_select" onchange="sCateList3(this)">
			<option value="">선택</option>
		</select>
		
		<select id="ca3_select">
			<option value="">선택</option>
		</select>
	</div>
	
	<script>
		function sCateList2(selected){
			$("#ca3_select").empty();
			$("#ca3_select").append('<option value="">선택</option>');
			
    		var cateSeq1 = selected.value;
    		    		
    		$.ajax({ 
    			type:"POST", 
    			url: '/jobsearch/cate/subCategoryList.do', 
    			data:{"cateSeq1": cateSeq1 },
    			dataType: "json", 
    			cache : false, 
    			success : function(resData){ 
    				
    			//	console.log(resData);
    				
    				var addHtml = '<option value="">선택</option>';
    				
    				for(var i=0; i<resData.length; i++){
    					var cateName2 = resData[i].cateName2;
    					var cateSeq2 = resData[i].cateSeq2;
    					var refCateSeq1 = resData[i].refCateseq;
    					
    					addHtml += '<option value="' + cateSeq2 + ';:;' + refCateSeq1 + '">' + cateName2 + '</option>'
    					
    					//console.log(addHtml);
    				}
    				
    				$("#ca2_select").empty();
    				$("#ca2_select").append(addHtml);
										
    			}, 
    			error : function(xhr, status, e){ 
    				console.log(status);
    			} 
    		});
		}
		
		
		function sCateList3(selected){
    		var selectedVal = selected.value;
    		
    		
    		var cateSeq2 = selectedVal.split(';:;')[0];
    		var cateSeq1 = selectedVal.split(';:;')[1];
    		
    		$.ajax({ 
    			type:"POST", 
    			url: '/jobsearch/cate/thirdCategoryList.do', 
    			data:{"cateSeq1": cateSeq1 , "cateSeq2" : cateSeq2},
    			dataType: "json", 
    			cache : false, 
    			success : function(resData){ 
    				    				    				
    				var addHtml = '<option value="">선택</option>';
    				
    				for(var i=0; i<resData.length; i++){
    					var cateName3 = resData[i].cateName3;
    					var cateSeq3 = resData[i].cateSeq3;
    					
    					addHtml += '<option value="' + cateSeq3 + '">' + cateName3 + '</option>'
    					
    					console.log(addHtml);
    				}
    				
    				$("#ca3_select").empty();
    				$("#ca3_select").append(addHtml);
										
    			}, 
    			error : function(xhr, status, e){ 
    				console.log(status);
    			} 
    		});
    		
		}		
	</script>

	<!-- 카테고리 불러오기 끝-->


  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>


</body>

</html>
