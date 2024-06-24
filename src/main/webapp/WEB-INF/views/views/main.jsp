<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome SomsomCloset</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>  

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
            <a href="/main"><img src="resources/img/somsomlogo.jpg"></a>
         </div>
         <div class="search_area">
                   <div class="search_wrap">
                      <form id="searchForm" action="/search" method="get">
                         <div class="search_input">                         
                            <input type="text" name="keyword">
                            <input type="hidden" name="type" value = "T">
                             <button class='btn search_btn'>검 색</button>                            
                         </div>
                      </form>
                   </div>
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
      <div class="navi_bar_area">
      	<button class="dropbtn"><a href="search?type=C&cateName=신상">신상</a></button>
      	<button class="dropbtn"><a href="search?type=C&cateName=아우터">아우터</a></button>
      	<button class="dropbtn"><a href="search?type=C&cateName=상의">상의</a></button>
      	<button class="dropbtn"><a href="search?type=C&cateName=셔츠">셔츠</a></button>
     	<button class="dropbtn"><a href="search?type=C&cateName=원피스">원피스</a></button>
     	<button class="dropbtn"><a href="search?type=C&cateName=스커트">스커트</a></button>
      	<button class="dropbtn"><a href="search?type=C&cateName=팬츠">팬츠</a></button>
      	<button class="dropbtn"><a href="search?type=C&cateName=가방">가방</a></button>
      	<button class="dropbtn"><a href="search?type=C&cateName=신발">신발</a></button>
      	<button class="dropbtn"><a href="search?type=C&cateName=악세서리">악세서리</a></button>
		<button class="dropbtn"><a href="search?type=C&cateName=공동구매">공동구매</a></button>
		<button class="dropbtn"><a href="search?type=C&cateName=경매">경매</a></button>      
      </div>
      
      <div class="content_area">
      
         <div class="slide_div_wrap">
            <div class="slide_div">
               <div>
                  <a>
                     <img src="../resources/img/bannera.png">
                  </a>
               </div>
               <div>
                  <a>
                     <img src="../resources/img/bannerc.png">
                  </a>
               </div>
               <div>
                  <a>
                     <img src="../resources/img/welcomsom.jpg">
                  </a>
               </div>            
            </div>   
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
               <img src="resources/img/somsomlogo.jpg">
            </div>
            <div class="footer_right">
					SomSomCloset    대표이사 : 솜집사들
					<br>
					사업자등록번호 : ooo-oo-ooooo
					<br>
					대표전화 : oooo-oooo(발신자 부담전화)
					<br>
					<br>
					COPYRIGHT(C) <strong>SomSomCloset.com</strong>	ALL RIGHTS RESERVED.
				</div>
            <div class="clearfix"></div>
         </div>
      </div> <!-- class="footer" -->      
      
   </div>   <!-- class="wrap" -->
</div>   <!-- class="wrapper" -->

<script>

   $(document).ready(function(){
      
      $(".slide_div").slick(
            {
               dots: true,
               autoplay : true,
               autoplaySpeed: 5000
            }            
      );   
      
      $(".ls_div").slick({
         slidesToShow: 4,
         slidesToScroll: 4,
         prevArrow : "<button type='button' class='ls_div_content_prev'>이전</button>",      // 이전 화살표 모양 설정
         nextArrow : "<button type='button' class='ls_div_content_next'>다음</button>",      // 다음 화살표 모양 설정   
      });      
      
      /* 이미지 삽입 */
      $(".image_wrap").each(function(i, obj){
         
         const bobj = $(obj);
         
         if(bobj.data("productid")){
            const uploadPath = bobj.data("path");
            const uuid = bobj.data("uuid");
            const fileName = bobj.data("filename");
            
            const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
            
            $(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
         } else {
            $(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
         }
         
      });         
      
      
   });


   /* gnb_area 로그아웃 버튼 작동 */
   $("#gnb_logout_button").click(function(){
      //alert("버튼 작동");
      $.ajax({
         type:"POST",
         url:"/member/logout.do",
         success:function(data){
            document.location.reload();    
         } 
      }); // ajax 
   });
   
</script>

</body>
</html>