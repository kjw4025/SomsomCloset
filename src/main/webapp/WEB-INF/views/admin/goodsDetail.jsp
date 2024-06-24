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
                    <div class="admin_content_subject"><span>상품 상세</span></div>

                    <div class="admin_content_main">

                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품명</label>
                             </div>
                             <div class="form_section_content">
                                <input name="productName"  value="<c:out value="${goodsInfo.productName}"/>" disabled/>
                        
                             </div>
                          </div>
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>판매자</label>
                             </div>
                             <div class="form_section_content">
                                <input name="seller" value="<c:out value="${goodsInfo.seller}"/>" disabled>
                       
                             </div>
                          </div>            
           
                                   
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>카테고리</label>
                             </div>
                             <div class="form_section_content">
                                <div class="cate_wrap">
                                   <span>카테고리</span>
                                      <select class='cate1' name = 'cateName' disabled>
                                         <option selected value="none">${goodsInfo.cateName}</option>
                                      </select>
                                </div>
                                                                                  
                             </div>
                          </div>          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 가격</label>
                             </div>
                             <div class="form_section_content">
                                <input name="productPrice" value="<c:out value="${goodsInfo.productPrice}"/>" disabled>
                    
                             </div>
                          </div>               
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 재고</label>
                             </div>
                             <div class="form_section_content">
                                <input name="productStock" value="<c:out value="${goodsInfo.productStock}"/>" disabled>
                       
                             </div>
                          </div>          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 할인율</label>
                             </div>
                             <div class="form_section_content">
                                <input id="discount_interface" maxlength="2"  value="<c:out value="${goodsInfo.productDiscount}"/>"  disabled>
                                <input name="productDiscount" type="hidden" value="0" disabled>
                                <span class="step_val">할인 가격 : <span class="span_discount"></span></span>
                     
                             </div>
                          </div>                
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 소개</label>
                             </div>
                             <div class="form_section_content bit">
                                ${goodsInfo.productIntro}
                   
                             </div>
                          </div>    
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 내용</label>
                             </div>
                             <div class="form_section_content bit">
                                ${goodsInfo.productContents}
              
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
                          <input type="hidden" name='productId' value="${goodsInfo.productId}">
                        
                          <div class="btn_section">
                              <button id="cancelBtn" class="btn">상품 목록</button>
                             <button id="modifyBtn" class="btn enroll_btn">수정 </button>
                          </div>  
                    </div>                    
                
                <form id="moveForm" action="/admin/goodsManage" method="get" >
                   <input type="hidden" name="pageNum" value="${cri.pageNum}">
                  <input type="hidden" name="amount" value="${cri.amount}">
                  <input type="hidden" name="keyword" value="${cri.keyword}">
                  </form>
                 </div>
 				<%@include file="../includes/admin/footer.jsp" %>

	<script>
	
		$(document).ready(function(){
			
			/* 할인율 값 삽입 */
			let productDiscount = '<c:out value="${goodsInfo.productDiscount}"/>' * 100;
			$("#discount_interface").attr("value", productDiscount);
			
			
			ClassicEditor
				.create(document.querySelector('#productIntro_textarea'))
				.then(editor => {
					console.log(editor);
					editor.isReadOnly = true;
				})
				.catch(error=>{
					console.error(error);
				});
		
			ClassicEditor
			.create(document.querySelector('#productContents_textarea'))
			.then(editor => {
				console.log(editor);
				editor.isReadOnly = true;
			})
			.catch(error=>{
				console.error(error);
			});		
			
			
			/* 카테고리 */
			   let cateList = JSON.parse('${cateList}');

			   let cate1Array = new Array();
			   let cate1Obj = new Object();
			   
			   let cateSelect1 = $(".cate1");      
			   
			   /* 카테고리 배열 초기화 메서드*/
			   function makeCateArray(obj,array,cateList, tier){
			      for(let i = 0; i < cateList.length; i++){
			            obj = new Object();
			            
			            obj.cateName = cateList[i].cateName;
			            obj.cateCode = cateList[i].cateCode;

			            array.push(obj);            
			   
			      }
			   }   
			   
			   /* 배열 초기화 */
			   makeCateArray(cate1Obj,cate1Array,cateList,1);

			   
			   /* <option> 태그 */
			   for(let i = 0; i < cate1Array.length; i++){
			      cateSelect1.append("<option value='"+cate1Array[i].cateName+"'>" + cate1Array[i].cateName + "</option>");
			   }
			
			   $(".cate1 option").each(function(i,obj){
				   if(targetCate2.cateParent === obj.value){
					   $(obj).attr("selected", "selected");
				   }
			   });
			   
			/* 이미지 정보 호출 */
			let productId = '<c:out value="${goodsInfo.productId}"/>';
			let uploadReslut = $("#uploadReslut");			
			
			$.getJSON("/getAttachList", {productId : productId}, function(arr){	
				
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
			
			
			
		}); // $(document).ready
	
			
			
		/* 목록 이동 버튼 */
		$("#cancelBtn").on("click", function(e){
			e.preventDefault();
			$("#moveForm").submit();	
		});	
		
		/* 수정 페이지 이동 */
		$("#modifyBtn").on("click", function(e){
			alert("수정이 완료 되었습니다.");
			e.preventDefault();
			let addInput = '<input type="hidden" name="productId" value="${goodsInfo.productId}">';
			$("#moveForm").append(addInput);
			$("#moveForm").attr("action", "/admin/goodsModify");
			$("#moveForm").submit();
		});	
		
		
	</script>

</body>
</html>