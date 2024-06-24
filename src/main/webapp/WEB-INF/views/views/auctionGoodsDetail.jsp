<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매</title>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
   <div class="wrap">
      <div class="top_gnb_area">
         <ul class="list">
            <c:if test = "${member == null}">   <!-- 로그인 x -->   
               <li >
                  <a href="/member/login">로그인</a>
               </li>
               <li>
                  <a href="/member/join">회원가입</a>
               </li>
            </c:if>
            <c:if test="${member != null }">   <!-- 로그인 o -->      
               <c:if test="${member.adminCk == 1 }">   <!-- 관리자 계정 -->
                  <li><a href="/admin/main">관리자 페이지</a></li>
               </c:if>                     
               <li>
                  <a id="gnb_logout_button" href="/member/logout.do">로그아웃</a>
               </li>
               <li>
                  <a href="/mypage/${member.memberId}">마이페이지</a>
               </li>
               <li>
                  <a href="/cart/${member.memberId}">장바구니</a>
               </li>
            </c:if>                    
         </ul>         
      </div>
      <div class="top_area">
         <!-- 로고영역 -->
         <div class="logo_area">
            <a href="/main"><img src="/resources/img/somsomlogo.jpg"></a>
         </div>
         <div class="login_area">
         
            <!-- 로그인 하지 않은 상태 -->
            <c:if test = "${member == null }">
               <div class="login_button"><a href="/member/login">로그인</a></div>
               <span><a href="/member/join">회원가입</a></span>            
            </c:if>            
            
            <!-- 로그인한 상태 -->
            <c:if test="${ member != null }">
               <div class="login_success_area">
                  <span>회원 : ${member.memberName}</span>
                  <span>충전금액 : <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
                  <span>포인트 : <fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
                  <a href="/member/logout.do">로그아웃</a>
               </div>
            </c:if>
            
         </div>
         <div class="clearfix"></div>         
      </div>
      
      <div class="content_area">
         <div class="line">
         </div>         
         <div class="content_top">
            <div class="ct_left_area">         
            </div>
            <div class="ct_right_area">
               <div class="title">
                
                  <h1>
                  	<c:choose> 
						<c:when test="${goodsInfo.auctionCk eq '1'}">	
							<del>${goodsInfo.productName}</del>(낙찰 완료)																												
						</c:when> 
						<c:otherwise> 													
							${goodsInfo.productName} 												
						</c:otherwise>
					</c:choose> 												                   
                  </h1>
                   
               </div>
               <div class="line">
               </div>
               <div class="price">
                
                     <div class="discount_price">
                        판매가 : <span class="discount_price_number"><fmt:formatNumber value="${goodsInfo.productPrice}" pattern="#,### 원" /></span>                        
                     </div>
                     <div>
                        종료일: <span class="discount_price_number"><fmt:formatDate value="${goodsInfo.endDate}" /></span>
                     </div>
  					<div>
                     	현재 최고가 : <span class="discount_price_number"><fmt:formatNumber value="${goodsInfo.highPrice}" pattern="#,### 원" /></span>
                     </div>
                  </div>   
                  <div>
	               	호가 <input type="number" min ="${goodsInfo.highPrice}" class="newHighPrice" value="${goodsInfo.highPrice}"/>
	               		<c:choose> 
						<c:when test="${goodsInfo.auctionCk == 1}">	
							<h2>낙찰 완료</h2>																									
						</c:when> 
						<c:otherwise> 													
							<a class = "btn_buy">입력</a>												
						</c:otherwise>
					</c:choose> 
	               	 		               		
	               </div>               
               </div>   
               
               <div class="line">
               		 
               </div>   

         </div>
         <div class="line">
         </div>            
         
         <div class="line">
         </div>            
         <div class="content_bottom">
            <div class="reply_subject">
               <h2></h2>
            </div>
                
            
            <div class="reply_not_div">
               
            </div>
            <ul class="reply_content_ul">
            </ul>
            <div class="repy_pageInfo_div"> 
               <ul class="pageMaker">
                 
               </ul>
            </div>
               
            
         </div>
         <!-- 주문 form -->
         <form action="/auctionOrder/${member.memberId}" method="get" class="auctionOrder_form">
            <input type="hidden" name="orders[0].auctionId" value="${goodsInfo.auctionId}">
            <input type="hidden" name="orders[0].newHighPrice" value="">
         </form>   
      </div>
      
      <!-- Footer 영역 -->
      <div class="footer_nav">
         <div class="footer_nav_container">
            <ul>
               <li>회사소개</li>
               <span class="line">|</span>
               <li>이용약관</li>
               <span class="line">|</span>
               <li>고객센터</li>
               <span class="line">|</span>
               <li>광고문의</li>
               <span class="line">|</span>
               <li>채용정보</li>
               <span class="line">|</span>
            </ul>
         </div>
      </div> <!-- class="footer_nav" -->
      
      <div class="footer">
         <div class="footer_container">
            
            <div class="footer_left">
               <img src="/resources/img/somsomlogo.jpg">
            </div>
            <div class="footer_right">
               SomSomCloset    대표이사 : 솜집사들
               <br>
               사업자등록번호 : ooo-oo-ooooo
               <br>
               대표전화 : oooo-oooo(발신자 부담전화)
               <br>
               <br>
               COPYRIGHT(C) <strong>SomSomCloset.com</strong>   ALL RIGHTS RESERVED.
            </div>
            <div class="clearfix"></div>
         </div>
      </div> <!-- class="footer" -->      
      </div>
   </div>   <!-- class="wrap" -->
</div>   <!-- class="wrapper" -->

<script>

const form = {
		
		auctionId : ${goodsInfo.auctionId},
		highPrice : 0
}



   /* 호가 입력 버튼 */
   $(".btn_buy").on("click", function(){//id,id,newprice
   
  	   //let memberId = ${member.memberId};
	   let auctionId = ${goodsInfo.auctionId};
	   let newHighPrice = $(".newHighPrice").val();
	  
	   if(newHighPrice <= ${goodsInfo.highPrice}){
		   alert("현재 최고가보다 더 큰 금액을 입력해야 입찰할 수 있습니다.");  
	   }
	   else {   

		    if(${member == null}){
		    	alert("로그인이 필요합니다."); 
		    }else{
		    	form.highPrice =  $(".newHighPrice").val();
		    	$.ajax({
		    		url : '/auctionOrder/${member.memberId}',
		    		type : 'POST',
		    		data : form,
		    		success: function (data) {
		                alert("입찰이 완료되었습니다.");
		            }	
		    	});
		    }
		}
		                
     
   });


  
   
   
   
</script>

</body>
</html>