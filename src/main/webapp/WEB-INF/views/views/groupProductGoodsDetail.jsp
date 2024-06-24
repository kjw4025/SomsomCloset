<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
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
                  <a id="gnb_logout_button">로그아웃</a>
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
               <div class="image_wrap" data-productid="${goodsInfo.imageList[0].groupProductId}" data-path="${goodsInfo.imageList[0].uploadPath}" data-uuid="${goodsInfo.imageList[0].uuid}" data-filename="${goodsInfo.imageList[0].fileName}">
                  <img>
               </div>            
            </div>
            <div class="ct_right_area">
               <div class="title">
                  <h1>
                  	<c:choose> 
						<c:when test="${goodsInfo.groupProductCK == 1}">	
							<del>${goodsInfo.groupProductName}</del>(공구 종료)																												
						</c:when> 
						<c:otherwise> 													
							${goodsInfo.groupProductName}												
						</c:otherwise>
					</c:choose> 												                   
                  </h1>
               </div>
               <div class="line">
               </div>
               <div class="price">
                  <div class="sale_price">정가 : <fmt:formatNumber value="${goodsInfo.groupProductPrice}" pattern="#,### 원" /></div>
                     <div class="discount_price">
                        판매가 : <span class="discount_price_number"><fmt:formatNumber value="${goodsInfo.groupProductPrice - (goodsInfo.groupProductPrice*(goodsInfo.groupProductDiscount/100))}" pattern="#,### 원" /></span> 
                        [<fmt:formatNumber value="${goodsInfo.groupProductDiscount}" pattern="###" />% 
                        <fmt:formatNumber value="${goodsInfo.groupProductPrice*goodsInfo.groupProductDiscount/100}" pattern="#,### 원" /> 할인]
                     </div>
                     <div>
                        적립 포인트 : <span class="point_span"></span>원
                     </div> 
                     <div>
                        남은 공구 수량 : ${goodsInfo.groupProductStock}
                     </div> 
                     <div>
                        공구 마감 날짜 : ${goodsInfo.groupProductEndDate} 
                     </div>   
                  </div>                  
               </div>   
               <div class="line">
               </div>   
               <div class="button">                  
                  <div class="button_quantity">
                  <c:choose> 
                  	<c:when test="${goodsInfo.groupProductCK == 1}">																									
					</c:when>
					<c:otherwise> 
	                     주문수량
	                     <input type="text" class="quantity_input" value="1">
	                     <span>
	                        <button class="plus_btn">+</button>
	                        <button class="minus_btn">-</button>
	                     </span>
	                 </c:otherwise>
					</c:choose> 
                  </div>
                  <div class="button_set">
                  	<c:choose> 
						<c:when test="${goodsInfo.groupProductCK == 1}">
							<h2>공동구매가 끝났습니다.																											
						</c:when> 
						<c:otherwise> 													
                     		<a class="btn_buy">바로구매</a>												
						</c:otherwise>
					</c:choose> 
                  </div>
               </div>
            </div>
         </div>
         <div class="line">
         </div>            
         <div class="content_middle">
            <div class="product_intro">
               ${goodsInfo.groupProductIntro}
            </div>
            <div class="product_content">
               ${goodsInfo.groupProductContents }
            </div>
         </div>
         <div class="line">
         </div>            
         <div class="content_bottom">
            <div class="reply_subject">
               <h2>리뷰</h2>
            </div>
            
            <c:if test="${member != null}">
               <div class="reply_button_wrap">
                  <button>리뷰 쓰기</button>
               </div>
            </c:if>      
            
            <div class="reply_not_div">
               
            </div>
            <ul class="reply_content_ul">
              
               </ul>
            </div>
               
            
         </div>
         <!-- 주문 form -->
         <form action="/groupOrder/${member.memberId}" method="get" class="order_form">
            <input type="hidden" name="orders[0].productId" value="${goodsInfo.groupProductId}">
            <input type="hidden" name="orders[0].productCount" value="">
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
$(document).ready(function(){
   
   /* 이미지 삽입 */
   const bobj = $(".image_wrap");
   
   if(bobj.data("groupProductId")){
      const uploadPath = bobj.data("path");
      const uuid = bobj.data("uuid");
      const fileName = bobj.data("filename");
      
      const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
      
      bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
   } else {
      bobj.find("img").attr('src', '/resources/img/goodsNoImage.png');
   }   
   
   
   
   /* 포인트 삽입 */
   let salePrice = "${goodsInfo.groupProductPrice - (goodsInfo.groupProductPrice*(goodsInfo.groupProductDiscount/100))}"
   let point = salePrice*0.05;
   point = Math.floor(point);
   $(".point_span").text(point);   
   
   /* 리뷰 리스트 출력 */
   
   const productId = '${goodsInfo.groupProductId}';   

   $.getJSON("/reply/list", {groupProductId : groupProductId}, function(obj){
      
      makeReplyContent(obj);

   });      
   
   
});  


// 수량 버튼 조작
let quantity = $(".quantity_input").val();
$(".plus_btn").on("click", function(){
   $(".quantity_input").val(++quantity);
});
$(".minus_btn").on("click", function(){
   if(quantity > 1){
      $(".quantity_input").val(--quantity);   
   }
});   

// 서버로 전송할 데이터
const form = {
      memberId : '${member.memberId}',
      productId : '${goodsInfo.groupProductId}',
      productCount : ''
}
// 장바구니 추가 버튼
   $(".btn_cart").on("click", function(e){
      form.productCount = $(".quantity_input").val();
      $.ajax({
         url: '/cart/add',
         type: 'POST',
         data: form,
         success: function(result){
            cartAlert(result);
         }
      })
   });
   
   function cartAlert(result){
	   let productStock = ${goodsInfo.groupProductStock};
	   let quantity = $(".quantity_input").val();
	   if(productStock - quantity < 0){
		   alert("주문 할 수 있는 수량을 초과했습니다.");  
	   }else{
	      if(result == '0'){
	         alert("장바구니에 추가를 하지 못하였습니다.");
	      } else if(result == '1'){
	         alert("장바구니에 추가되었습니다.");
	      } else if(result == '2'){
	         alert("장바구니에 이미 추가되어져 있습니다.");
	      } else if(result == '5'){
	         alert("로그인이 필요합니다.");   
	      }
      }
   }
   /* 바로구매 버튼 */
   $(".btn_buy").on("click", function(){
	   let productStock = ${goodsInfo.groupProductStock};
	   let quantity = $(".quantity_input").val();
	   if(productStock - quantity < 0){
		   alert("주문 할 수 있는 수량을 초과했습니다.");  
	   }else {   

		    if(${member == null}){
		    	alert("로그인이 필요합니다."); 
		    }else{
		   		let productCount = $(".quantity_input").val();
			    $(".order_form").find("input[name='orders[0].productCount']").val(productCount);
			    $(".order_form").submit(); 
			   }
		    
		}             
     
   });


   
   /* 리뷰쓰기 */
   $(".reply_button_wrap").on("click", function(e){
      
      e.preventDefault();
      
      const memberId = '${member.memberId}';
      const productId = '${goodsInfo.groupProductId}';

      $.ajax({
         data : {
            productId : groupProductId,
            memberId : memberId
         },
         url : '/reply/check',
         type : 'POST',
         success : function(result){

            if(result === '1'){
               alert("이미 등록된 리뷰가 존재 합니다.")
            } else if(result === '0'){
               let popUrl = "/replyEnroll/" + memberId + "?productId=" + groupProductId;
               console.log(popUrl);
               let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
               
               window.open(popUrl,"리뷰 쓰기",popOption);                     
            }            
            
         }
      });         

      
   });      
   

   /* 댓글 페이지 정보 */
    const cri = {
      productId : '${goodsInfo.groupProductId}',
      pageNum : 1,
      amount : 10
   }   
   
   /* 댓글 페이지 이동 버튼 동작 */
   $(document).on('click', '.pageMaker_btn a', function(e){
         
      e.preventDefault();
      
      let page = $(this).attr("href");   
      cri.pageNum = page;      
      
      replyListInit();
         
    });
   
   
   /* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
   let replyListInit = function(){
      $.getJSON("/reply/list", cri , function(obj){
         
         makeReplyContent(obj);
         
      });      
   }   
   
   /* 리뷰 수정 버튼 */
    $(document).on('click', '.update_reply_btn', function(e){
         
         e.preventDefault();
         let replyId = $(this).attr("href");       
         let popUrl = "/replyUpdate?replyId=" + replyId + "&productId=" + '${goodsInfo.groupProductId}' + "&memberId=" + '${member.memberId}';   
         let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"   
         
         window.open(popUrl,"리뷰 수정",popOption);         
       
    });   
   
    /* 리뷰 삭제 버튼 */
    $(document).on('click', '.delete_reply_btn', function(e){

      e.preventDefault();
      let replyId = $(this).attr("href");   
      
      $.ajax({
         data : {
            replyId : replyId,
            productId : '${goodsInfo.groupProductId}'
         },
         url : '/reply/delete',
         type : 'POST',
         success : function(result){
            replyListInit();
            alert('삭제가 완료되엇습니다.');
         }
      });      
         
    });   
   
   /* 댓글(리뷰) 동적 생성 메서드 */
   function makeReplyContent(obj){
      
      if(obj.list.length === 0){
         $(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
         $(".reply_content_ul").html('');
         $(".pageMaker").html('');
      } else{
         
         $(".reply_not_div").html('');
         
         const list = obj.list;
         const pf = obj.pageInfo;
         const userId = '${member.memberId}';      
         
         /* list */
         
         let reply_list = '';         
         
         $(list).each(function(i,obj){
            reply_list += '<li>';
            reply_list += '<div class="comment_wrap">';
            reply_list += '<div class="reply_top">';
            /* 아이디 */
            reply_list += '<span class="id_span">'+ obj.memberId+'</span>';
            /* 날짜 */
            reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
            /* 평점 */
            reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.rating +'</span>점</span>';
            if(obj.memberId === userId){
               reply_list += '<a class="update_reply_btn" href="'+ obj.replyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
            }
            reply_list += '</div>'; 
            reply_list += '<div class="reply_bottom">';
            reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
            reply_list += '</div>';
            reply_list += '</div>';
            reply_list += '</li>';
         });      
         
         $(".reply_content_ul").html(reply_list);         
         
         /* 페이지 버튼 */
         
         let reply_pageMaker = '';   
         
            /* prev */
            if(pf.prev){
               let prev_num = pf.pageStart -1;
               reply_pageMaker += '<li class="pageMaker_btn prev">';
               reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
               reply_pageMaker += '</li>';   
            }
            /* numbre btn */
            for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
               reply_pageMaker += '<li class="pageMaker_btn ';
               if(pf.cri.pageNum === i){
                  reply_pageMaker += 'active';
               }
               reply_pageMaker += '">';
               reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
               reply_pageMaker += '</li>';
            }
            /* next */
            if(pf.next){
               let next_num = pf.pageEnd +1;
               reply_pageMaker += '<li class="pageMaker_btn next">';
               reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
               reply_pageMaker += '</li>';   
            }   
            
            console.log(reply_pageMaker);
         $(".pageMaker").html(reply_pageMaker);            
         
      }      
      
   }
   
   
   
</script>

</body>
</html>