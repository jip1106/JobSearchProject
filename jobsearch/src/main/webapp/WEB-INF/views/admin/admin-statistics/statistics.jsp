<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../admin-include/admin-header.jsp"/>
  
  <body>  	

	<c:import url="../admin-include/admin-navi.jsp"/>

	<div class="page-content">
    	<div class="row">
		  
		  <c:import url="../admin-include/admin-left.jsp"/>
		  
		  <div class="col-md-10">
  		 	
  			<div class="content-box-large">
  				<div class="panel-heading">
					<div class="panel-title">날짜별 지원자 통계</div>
					
					<div class="panel-options">
						<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
						<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
					</div>
				</div>
  				<div class="panel-body">
  					<div class="row">
  						<div class="col-md-6">
  							<div id="chart_div" style="height: 230px;"></div>
  						</div>
  						
  					</div>
  				</div>
  				
  				<div><c:forEach var="map" items="${list }">
						<input type="text" value="${map['COUNT'] } ">
						<input type="text" value="${map['REG_DATE'] } ">
						
					</c:forEach></div>
  				
  			</div>		  			
		  </div>
		</div>
    </div> 
		
	<c:import url="../admin-include/admin-footer.jsp"/>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/resources/admin/bootstrap/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/vendors/datatables/dataTables.bootstrap.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/tables.js"></script>
	
    
	<!-- 구글차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		google.charts.load('current', {packages:['corechart']});
	</script>
	<script>
		google.charts.setOnLoadCallback(drawChart);
	
		function drawChart() {
	
			 var jsonData = $.ajax({ //비동기적 방식으로 호출한다는 의미이다.
		            url : "${path}/json/sampleData.json",		         
		            dataType : "json",
		            async : false
		        }).responseText; 
		        
	        console.log(jsonData);
		        
	        //데이터테이블 생성
	        var data = new google.visualization.DataTable(jsonData);		       
	
			// 그래프 옵션
			var options = {
				bar : {
					groupWidth : '80%' // 그래프 너비 설정 %
				},
				legend : {
					position : 'none' // 항목 표시 여부 (현재 설정은 안함)
				}
			};
	
			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>	

  </body>
</html>