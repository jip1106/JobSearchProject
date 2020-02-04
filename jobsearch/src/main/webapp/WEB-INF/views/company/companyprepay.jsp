<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- iamport js -->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
</head>
<body>
<script type="text/javascript">
var IMP = window.IMP;
var memberEmail = '${loginMember.memberId}';
var memberName ='${loginMember.memberName}';
var refAnnouncement ='${payVo.refAnnouncement}';
var payType='${payVo.payType}';
IMP.init(payType);
var msg;
IMP.request_pay({	
    pay_method : 'card',
	merchant_uid : 'premium_' + new Date().getTime(),
	name : '프리미엄 공고글 등록상품',
	amount : 10000,
	buyer_email : memberEmail,
	buyer_name : memberName
	}, function(rsp) {
  		if ( rsp.success ) {
     		   //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기     	
	        $.ajax({
	            url: "${pageContext.request.contextPath }/company/companypaycomplete.do",
	            type: 'POST',
	            dataType: 'json',
	            data: {
	                "paymentCode" : rsp.merchant_uid,	               
	                "refAnnouncement" : refAnnouncement,
	                "cardAuthNum" : rsp.apply_num
	                //기타 필요한 데이터가 있으면 추가 전달
	            }
	        }).done(function(data) {
	            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	            if (everythings_fine) {
	             
	            } else {
	                //[3] 아직 제대로 결제가 되지 않았습니다.
	                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	            }
	        });
	        //성공시 이동할 페이지	     
	         opener.location.reload();
	         location.href='<c:url value="/company/companypaycompletepage.do"/>';
	    } else {	       
	        self.close();
	        
	    }
	});	

	</script>

</body>
</html>