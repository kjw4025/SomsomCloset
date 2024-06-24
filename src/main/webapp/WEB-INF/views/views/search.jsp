<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="resources/css/search.css">
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
            <a href="/main"><img src="resources/img/somsomlogo.jpg"></a>
         </div>
         <div class="search_area">
                   <div class="search_wrap">
                      <form id="searchForm" action="/search" method="get">
                         <div class="search_input">                      
                            <input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>">
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
      
         <!-- 게시물 o -->
         <c:if test="${listcheck != 'empty'}">        

            <div class="list_search_result">
               <table class="type_list">
                  <colgroup>
                     <col width="110">
                     <col width="*">
                     <col width="120">
                     <col width="120">
                     <col width="120">
                  </colgroup>
                  <tbody id="searchList>">
                     <c:forEach items="${list}" var="list">
                        <tr>
                           <td class="image">
                              <div class="image_wrap" data-productId="${list.imageList[0].productId}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
                                 <img>
                              </div>                              
                           </td>
                           <td class="detail">
                              <div class="category">
                                 [${list.cateName}]
                              </div>
                              <div class="title">
                                 <c:choose> 
                                    <c:when test="${list.productStock <= 0}">                                                               
                                       <a href="/goodsDetail/${list.productId}">
                                          <del>${list.productName}</del>(품절)
                                       </a>                        
                                    </c:when> 
                                    <c:otherwise>                                        
                                       <a href="/goodsDetail/${list.productId}">
                                          ${list.productName}
                                       </a>                                    
                                    </c:otherwise>
                                 </c:choose> 
                                 </div>
                              
                           <td class="price">
                              <div class="org_price">
                                 <del>
                                    <fmt:formatNumber value="${list.productPrice}" pattern="#,### 원" />
                                 </del>
                              </div>
                              <div class="sell_price">
                                 <strong>
                                    <fmt:formatNumber value="${list.productPrice * (1-(list.productDiscount/100))}" pattern="#,### 원" />
                                 </strong>
                              </div>
                           </td>
                           <td class="option"></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               
               </table>
            </div>
            
            <!-- 페이지 이동 인터페이스 -->
            <div class="pageMaker_wrap">
               <ul class="pageMaker">
                            
                  <!-- 이전 버튼 -->
                  <c:if test="${pageMaker.prev }">
                           <li class="pageMaker_btn prev">
                              <a href="${pageMaker.pageStart -1}">이전</a>
                           </li>
                  </c:if>
                           
                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                           <li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                              <a href="${num}">${num}</a>
                           </li>   
                        </c:forEach>
                        
                         <!-- 다음 버튼 -->
                         <c:if test="${pageMaker.next}">
                            <li class="pageMaker_btn next">
                               <a href="${pageMaker.pageEnd + 1 }">다음</a>
                            </li>
                         </c:if>
               </ul>
            </div>      
            
            <form id="moveForm" action="/search" method="get" >
               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
               <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
               <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
               <input type="hidden" name="cateName" value="<c:out value="${pageMaker.cri.cateName}"/>">
               <input type="hidden" name="type" value="${pageMaker.cri.type}">
            </form>                     

         
         </c:if>
         <!-- 게시물 x -->
         <c:if test="${listcheck == 'empty'}">
            <div class="table_empty">
               검색결과가 없습니다.
            </div>
         </c:if>
         
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
      
   </div>   <!-- class="wrap" -->
</div>   <!-- class="wrapper" -->

<script>

   $(document).ready(function(){
   
      // 검색 타입 selected
      const selectedType = '<c:out value="${pageMaker.cri.type}"/>';
      if(selectedType != ""){
         $("select[name='type']").val(selectedType).attr("selected", "selected");   
      }
      
      /* 이미지 삽입 */
      $(".image_wrap").each(function(i, obj){
         
         const bobj = $(obj);
         
         const uploadPath = bobj.data("path");
         const uuid = bobj.data("uuid");
         const fileName = bobj.data("filename");
         
         const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
         
         $(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
         
      });
         
      
   });      

   /* gnb_area 로그아웃 버튼 작동 */
   $("#gnb_logout_button").click(function(){
      $.ajax({
         type:"POST",
         url:"/member/logout.do",
         success:function(data){
            document.location.reload();    
         } 
      }); // ajax 
   });
   

   /* 페이지 이동 버튼 */
   
   const moveForm = $('#moveForm');
   
   $(".pageMaker_btn a").on("click", function(e){
      
      e.preventDefault();
      
      moveForm.find("input[name='pageNum']").val($(this).attr("href"));
      
      moveForm.submit();
      
   });      
   
   
   /* 검색 필터 */
   let buttonA = $("#filter_button_a");
   let buttonB = $("#filter_button_b");
   
   buttonA.on("click", function(){
      $(".filter_b").css("display", "none");
      $(".filter_a").css("display", "block");      
      buttonA.attr("class", "filter_button filter_active");
      buttonB.attr("class", "filter_button");
   });   
   
   buttonB.on("click", function(){
      $(".filter_a").css("display", "none");
      $(".filter_b").css("display", "block");
      buttonB.attr("class", "filter_button filter_active");
      buttonA.attr("class", "filter_button");      
   });      
   
   /* 필터링 태그 동작 */
   $(".filter_content a").on("click", function(e){
      e.preventDefault();
      
      let type = '<c:out value="${pageMaker.cri.type}"/>';
      if(type === 'A' || type === 'T'){
         type = type + 'C';   
      }
      let keyword = '<c:out value="${pageMaker.cri.keyword}"/>';
      let cateCode= $(this).attr("href");
      
      $("#filter_form input[name='keyword']").val(keyword);
      $("#filter_form input[name='cateCode']").val(cateCode);
      $("#filter_form input[name='type']").val(type);
      $("#filter_form").submit();
      
   });
   
   
   
   
   
   
</script>

</body>
</html>