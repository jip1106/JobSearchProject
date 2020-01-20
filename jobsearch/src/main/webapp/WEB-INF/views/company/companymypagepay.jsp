<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume.css'/>">


<style type="text/css">
td#pre{
    width: 50%;
    font-size: 20px;
    font-weight: bold;
    background: #84dad2;
    border-bottom-left-radius: .25em;
    border-top-left-radius: .25em;
}
td#people{
	width: 50%;
    font-size: 20px;
    font-weight: bold;
    background: #d0cbcb;
    border-bottom-right-radius: .25em;
    border-top-right-radius: .25em;
}
img{
	padding: 20px;
}
a{
	color:#343a40;
}
ul.paytab {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;    
    width: 100%;
    margin-left: 155px;
}
 ul.paytab li {
    float: left;
    margin: 0;
	padding: 0;	
	margin-bottom: -1px;
	overflow: hidden;	
 	background: #e0e0e0;
}
ul.paytab li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;	
	outline: none;
}
ul.paytab li a:hover {
    background: #84dad2;
}
li{
	font-weight: bold;
}

</style>
<script type="text/javascript">
        $(function(){           
            $(".paytab_content").hide();
            $("ul.paytab li:first").addClass("active").show(); 
            $(".paytab_content:first").show();
           
            $("ul.paytab li").click(function() {

                $("ul.paytab li").removeClass("active"); 
                $(this).addClass("active"); 
                $(".paytab_content").hide(); 

                var activeTab = $(this).find("a").attr("href"); 
                $(activeTab).fadeIn();
                return false;
            });
  
   });
        
</script>
<c:import url="/WEB-INF/views/include/headend.jsp" />
<!-- head end -->

<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />

<!-- section start -->
	<ul class="paytab">
		<li style="border-bottom-left-radius: .25em;border-top-left-radius: .25em;"><a href="#tab1">프리미엄 글 등록상품</a></li>
		<li style="border-bottom-right-radius: .25em;
	border-top-right-radius: .25em;"><a href="#tab2" style="width: 234px;" align="center">인재 검색상품</a></li>
		
	</ul>
		
	</div>
	<form action="<c:url value='/company/companymypagepay.do'/>" method="post">
	<div class="card mb-4-bt-edit" style="background:#eaedff;" align="center" >
		<div class="tab_container">
			<div id="tab1" class="paytab_content">
			
				<table>
					<tr>
						<td align="center">
							<h3 style="border-bottom:  1px solid; font-weight:bold;">프리미엄 글 등록</h3>
						</td>
					</tr>
					
					<tr>
						<td align="center">
							<input type="checkbox" id="pre1" name="pre1" value="30000">
							<label for="pre1"><img alt="people1" src="<c:url value='/resources/images/basic.png'/>"></label>
						</td> 
					</tr>
					<tr>
						<td align="center">
							<input type="checkbox" id="pre2" name="pre2" value="80000">
							<label for="pre2"><img alt="people2" src="<c:url value='/resources/images/basic2.png'/>"></label>
						</td>
					</tr>	
							
					<tr>
						<td align="center">
							<input type="checkbox" id="pre3" name="pre3" value="20000">
							<label for="pre3"><img alt="people3" src="<c:url value='/resources/images/VIP.png'/>"></label>
						</td>
					</tr>						
				</table>
			</div>			
			<div id="tab2" class="paytab_content">
				<table>
					<tr>
						<td align="center">
							<h3 style="border-bottom:  1px solid; font-weight:bold;">인재검색 상품</h3>
						</td>
					</tr>
					
					<tr>
						<td align="center">
							<input type="checkbox" id="people1" name="people1" value="20000">
							<label for="people1"><img alt="people1" src="<c:url value='/resources/images/basic.png'/>"></label>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="checkbox" id="people2" name="people2" value="50000">
							<label for="people2"><img alt="people2" src="<c:url value='/resources/images/basic2.png'/>"></label>
						</td>
					</tr>	
							
					<tr>
						<td align="center">
							<input type="checkbox" id="people3" name="people3" value="180000">
							<label for="people3"><img alt="people3" src="<c:url value='/resources/images/VIP.png'/>"></label>
						</td>
					</tr>						
				</table>
				
			</div>
		</div>
	</form>
		<hr>
		<table id="submit">			
			<tr>
				<td><input type="submit" value="결제하기"></td>
			</tr>				
		</table>
		
	<hr>

    	
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
