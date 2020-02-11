<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypageedit.css'/>">
<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
<style type="text/css">
table tr td {
	border: .5px solid;
}

tr td {
	height: 40px;
	text-align: center;
}

.content {
	width: 100%;
}

h2 {
	font-size: 26px;
	font-weight: bold;
}

#ListTitle {
	background: #8080802e;
}

.receipt {
	height: 484px;
	width: 350px;
	color: black;
	margin-bottom: 46px;
	padding: 34px 30px;
	border: 1px solid #dedede;
	/*  background: url(/jobsearch/resources/images/receipt.jpg) center no-repeat; */
}

.rec_Name {
	text-align: right;
	margin-bottom: -12px;
}

img.receipt_img {
	box-shadow: 4px 4px 2px black;
}

.rec_Money {
	text-align: left;
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 61px;
}

span.cont1 {
	color: #a0a0a0;
}

span.cont2n {
	font-weight: 600;
	margin-left: 148px;
}

span.cont2d {
	font-weight: 600;
	margin-left: 129px;
}

span.cont2t {
	font-weight: 600;
	margin-left: 134px;
}

.rec_Type {
	text-align: left;
}

.rec_Buy {
	text-align: left;
}

.rec_date {
	text-align: left;
}

img.barcord {
	margin-top: 11px;
}

.rec_Code {
	font-size: 12px;
	letter-spacing: 4px;
	position: relative;
	left: 2px;
}

.pay_title {
	font-size: 28px;
	font-weight: bold;
	margin-top: 33px;
	margin-bottom: 47px;
}
.accordian_title {
    display: flex;
}
.layout2 {
    padding: 0 124px;
}
img.open_down {
    background-color: #4876ef;
    resize: both;
    height: 13px;
    position: relative;
    top: 10px;
}
span.pdName {
    font-weight: 500;
    color: #929292;
    position: relative;
    top: 14px;
    left: 11px;
    font-size: 18px;
}
.firt {
    width: 246px;
}
.second {
    width: 270px;
    text-align: right;
}
.t_money {
    font-size: 20px;
    color: #4876ef;
}
.t_date {
    font-size: 15px;
    font-weight: 600;
}
dt.receipt_dt {
    margin-bottom: 0;
    padding: 19px 0;
    border-top: 1px solid #d6d6d6;
}
hr.bottom_line {
    margin-top: -17px;
    margin-bottom: 39px;
}
dd {
	display: none;
}dd.receipt_dd {
    margin-left: 16%;
    margin-right: 16%;
    text-align: center;
}
</style>


<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />
<!-- section start -->
<div align="center">
<div class="pay_title">결제내역</div>
</div>	
<div class="layout2">
<dl>
   	<c:forEach var="vo" items="${list}">
	    <dt class="receipt_dt">
			<div class="accordian_title">
				<div class="firt">
					<img class="open_down" src="<c:url value='/resources/images/open_down.png'/>">
					
					<span class="pdName">공고명 :
					 	<c:if test="${fn:length(vo.annTitle)>8}">
							${fn:substring(vo.annTitle, 0, 8)}...
				     	</c:if>
				     	<c:if test="${fn:length(vo.annTitle)<8}">
				     		${vo.annTitle}
				     	</c:if>				     	
				     	</span>
				</div>
				<div class="second">
	    			<div class="t_money">10,000원</div>
	    			<div class="t_date">${vo.priceDate}</div>
				</div>
			</div>    
	    </dt>
	    <dd class="receipt_dd">
			<div class="receipt">
				<div class="rec_Money">10,000원</div>
				<div class="rec_Name">${vo.productName}</div>
				<hr>
				<div class="rec_Buy">
					<span class="cont1">주문자:</span>
					<span class="cont2n">${sessionScope.loginMember.memberName}</span>
				</div>
				<hr>
				<div class="rec_Date">
					<span class="cont1">결제일시:</span>
					<span class="cont2d">${vo.priceDate}</span>
				</div>
				<hr>
				<div class="rec_Type">
					<span class="cont1">결제방식:</span>
					<span class="cont2t">${vo.payType}</span>
				</div>
				<hr>
				<img class="barcord" src="<c:url value='/resources/images/barcord.png'/>">
				<div class="rec_Code">${vo.paymentCode}</div>
			</div>
	    </dd>
	</c:forEach>
</dl>
	<hr class="bottom_line">
</div>

 <script type="text/javascript">
 var acodian = {

		    click: function (target) {
		        var _self = this,
		                $target = $(target)
		        $target.on('click', function () {
		            if ($(this).next('dd').css('display') == 'none') {
		                $('dd').slideUp();
		                _self.onremove($target);

		                $(this).addClass('on');
		                $(this).next().slideDown();
		            } else {
		                $('dd').slideUp();
		                _self.onremove($target);

		            }
		        });
		    },
		    onremove: function ($target) {
		        $target.removeClass('on');
		    }

		};

		acodian.click('dt');
</script>
<!-- collapsible function   -->
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
