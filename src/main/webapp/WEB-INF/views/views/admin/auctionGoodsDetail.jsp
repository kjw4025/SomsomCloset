<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
 <style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>
</head>
<body>
				<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>경매 상품 상세</span></div>

                    <div class="admin_content_main">

                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품명</label>
                             </div>
                             <div class="form_section_content">
                                <input name="productName"  value="<c:out value="${auctionGoodsInfo.productName}"/>" disabled/>
                        
                             </div>
                          </div>       
                                           
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 가격</label>
                             </div>
                             <div class="form_section_content">
                                <input name="productPrice" value="<c:out value="${auctionGoodsInfo.productPrice}"/>" disabled>
                    
                             </div>
                          </div>         
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>경매 종료일</label>
                             </div>
                             <div class="form_section_content">
                                <input name="endDate" value="<fmt:formatDate value="${auctionGoodsInfo.endDate}" pattern="yyyy-MM-dd"/>" disabled>
                             </div>
                          </div>   
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>호가</label>
                             </div>
                             <div class="form_section_content">
                                <input name="highPrice" value="<c:out value="${auctionGoodsInfo.highPrice}"/>" disabled>
                    
                             </div>
                          </div>   
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>낙찰자</label>
                             </div>
                             <div class="form_section_content">
                                <input name="memberId" value="<c:out value="${auctionGoodsInfo.memberId}"/>" disabled>
                    
                             </div>
                          </div>                                     
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 이미지</label>
                             </div>
                             <div class="form_section_content">
                           <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
                           <div id="uploadResult">
                           <!-- 
                              <div id="result_card">
                                 <div class="imgDeleteBtn">x</div>
                                 <img src="/display?fileName=test.png">
                              </div>
                               -->                                                      
                           </div>
                             </div>
                          </div>                           
                          <input type="hidden" name='auctionId' value="${auctionGoodsInfo.auctionId}">
                        
                          <div class="btn_section">
                              <button id="cancelBtn" class="btn">경매 목록</button>
                             <button id="deleteBtn" class="btn enroll_btn">삭제 </button>
                          </div>  
                    </div>                    
                
                <form id="moveForm" action="/admin/auctionManage" method="get" >
                   <input type="hidden" name="pageNum" value="${cri.pageNum}">
                  <input type="hidden" name="amount" value="${cri.amount}">
                  <input type="hidden" name="keyword" value="${cri.keyword}">
                  </form>
                 </div>
 				<%@include file="../includes/admin/footer.jsp" %>

	<script>
	
		$(document).ready(function(){
				
			   
			/* 이미지 정보 호출 */
			let productId = '<c:out value="${auctionGoodsInfo.auctionId}"/>';
			let uploadReslut = $("#uploadReslut");			
			
			$.getJSON("/getAttachList", {auctionId : auctionId}, function(arr){	
				
				if(arr.length === 0){	
					
					let str = "";
					str += "<div id='result_card'>";
					str += "<img src='/resources/img/goodsNoImage.png'>";
					str += "</div>";
					
					uploadReslut.html(str);						
					
					return;
				}				
				
				let str = "";
				let obj = arr[0];	
				
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				str += "<div id='result_card'";
				str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
				str += ">";
				str += "<img src='/display?fileName=" + fileCallPath +"'>";
				str += "</div>";		
				
				uploadReslut.html(str);						
				
			});					
			
			
			
		}); 
	
			
			
		/* 목록 이동 버튼 */
		$("#cancelBtn").on("click", function(e){
			e.preventDefault();
			$("#moveForm").submit();	
		});	
		
		/* 삭제 버튼 */
		$("#deleteBtn").on("click", function(e){
			alert("삭제되었습니다.");
			e.preventDefault();
			let moveForm = $("#moveForm");
			moveForm.find("input").remove();
			moveForm.append('<input type="hidden" name="auctionId" value="${auctionGoodsInfo.auctionId}">');
			moveForm.attr("action", "/admin/auctionGoodsDelete");
			moveForm.attr("method", "post");
			moveForm.submit();
		});	
		
		
	</script>

</body>
</html>