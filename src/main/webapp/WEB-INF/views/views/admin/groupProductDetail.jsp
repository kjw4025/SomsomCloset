<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 상세 페이지</title>
<link rel="stylesheet" href="../resources/css/admin/groupProductDetail.css">
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
                    <div class="admin_content_subject"><span>공구 상품 상세</span></div>

                    <div class="admin_content_main">

                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품명</label>
                             </div>
                             <div class="form_section_content">
                                <input name="groupProductName"  value="<c:out value="${groupProductInfo.groupProductName}"/>" disabled/>
                        
                             </div>
                          </div>       
                                    
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>판매자</label>
                             </div>
                             <div class="form_section_content">
                                <input name="groupProductSeller" value="<c:out value="${groupProductInfo.groupProductSeller}"/>" disabled>        
                             </div>
                          </div> 
                                 
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 가격</label>
                             </div>
                             <div class="form_section_content">
                                <input name="groupProductPrice" value="<c:out value="${groupProductInfo.groupProductPrice}"/>" disabled>        
                             </div>
                          </div>         
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 재고</label>
                             </div>
                             <div class="form_section_content">
                                <input name="groupProductStock" value="<c:out value="${groupProductInfo.groupProductStock}"/>" disabled>        
                             </div>
                          </div>
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>할인율</label>
                             </div>
                             <div class="form_section_content">
                                <input name="groupProductDiscount" value="<c:out value="${groupProductInfo.groupProductDiscount}"/>" disabled>        
                             </div>
                          </div>  
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 소개</label>
                             </div>
                             <div class="form_section_content bit">
                                ${groupProductInfo.groupProductIntro}
                   
                             </div>
                          </div>    
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 내용</label>
                             </div>
                             <div class="form_section_content bit">
                                ${groupProductInfo.groupProductContents}
              
                             </div>
                          </div>
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>공동 구매 종료일</label>
                             </div>
                             <div class="form_section_content">
                                <input name="groupProductEndDate" value="<fmt:formatDate value="${groupProductInfo.groupProductEndDate}" pattern="yyyy-MM-dd"/>" disabled>
                             </div>
                          </div>                                     
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 이미지</label>
                             </div>
                             <div class="form_section_content">
                           <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
                           <div id="uploadResult">                                                  
                           </div>
                             </div>
                          </div>                           
                          <input type="hidden" name='groupProductId' value="${groupProductInfo.groupProductId}">
                        
                          <div class="btn_section">
                              <button id="cancelBtn" class="btn">공구 목록</button>
                             <button id="deleteBtn" class="btn enroll_btn">삭제 </button>
                          </div>  
                    </div>                    
                
                <form id="moveForm" action="/admin/groupProductManage" method="get" >
                   <input type="hidden" name="pageNum" value="${cri.pageNum}">
                  <input type="hidden" name="amount" value="${cri.amount}">
                  <input type="hidden" name="keyword" value="${cri.keyword}">
                  </form>
                 </div>
 				<%@include file="../includes/admin/footer.jsp" %>

	<script>
	
		$(document).ready(function(){
				
			   
			/* 이미지 정보 호출 */
			let productId = '<c:out value="${groupProductInfo.groupProductId}"/>';
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
			moveForm.append('<input type="hidden" name="groupProductId" value="${groupProductInfo.groupProductId}">');
			moveForm.attr("action", "/admin/groupProductDelete");
			moveForm.attr("method", "post");
			moveForm.submit();
		});	
		
		
	</script>

</body>
</html>