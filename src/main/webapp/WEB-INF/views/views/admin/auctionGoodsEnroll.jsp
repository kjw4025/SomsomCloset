<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 등록</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
   #result_card img{
      max-width: 100%;
       height: auto;
       display: block;
       padding: 5px;
       margin-top: 10px;
       margin: auto;   
   }
   #result_card {
      position: relative;
   }
   .imgDeleteBtn{
       position: absolute;
       top: 0;
       right: 5%;
       background-color: #ef7d7d;
       color: wheat;
       font-weight: 900;
       width: 30px;
       height: 30px;
       border-radius: 50%;
       line-height: 26px;
       text-align: center;
       border: none;
       display: block;
       cursor: pointer;   
   }
   
</style>
</head>
<body>

            <%@include file="../includes/admin/header.jsp" %>
            
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>경매 등록</span></div>
                    <div class="admin_content_main">
                       <form action="/admin/goodsEnroll" method="post" id="enrollForm">
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품명</label>
                             </div>
                             <div class="form_section_content">
                                <input name="productName">
                                <span class="ck_warn productName_warn">상품명을 입력해주세요.</span>
                             </div>
                          </div>            
                     
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>상품 가격</label>
                             </div>
                             <div class="form_section_content">
                                <input name="productPrice" value="0">
                                <span class="ck_warn productPrice_warn">상품 가격을 입력해주세요.</span>
                             </div>
                          </div>               
                           <div class="form_section">
                             <div class="form_section_title">
                                <label>경매 종료일</label>
                             </div>
                             <div class="form_section_content">
                             	<c:set var="endDate" value="<%=new Date(new Date().getTime() + 60*60*24*1000*7)%>"/>
                                <input name="endDate" readonly="readonly" value ="<fmt:formatDate value="${endDate}"/>"> 경매는 일주일 후 자동으로 종료됩니다.</input>
                                <span class="ck_warn productPrice_warn"></span>
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
                          
                         </form>
                            <div class="btn_section">
                               <button id="cancelBtn" class="btn">취 소</button>
                             <button id="enrollBtn" class="btn enroll_btn">등 록</button>
                          </div> 
                    </div>                    
                </div>
 
             <%@include file="../includes/admin/footer.jsp" %>
             
<script>

   let enrollForm = $("#enrollForm")
   
/* 취소 버튼 */
$("#cancelBtn").click(function(){
   
   location.href="/admin/goodsManage"
   
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
   
   e.preventDefault();
   enrollForm.submit();
   
});


/* 위지윅 적용 */
 
   ClassicEditor
      .create(document.querySelector('#productIntro_textarea'))
      .catch(error=>{
         console.error(error);
      });
      
   ClassicEditor
   .create(document.querySelector('#productContents_textarea'))
   .catch(error=>{
      console.error(error);
   });

/* 캘린더 위젯 적용 */

   /* 설정 */
   const config = {
      dateFormat: 'yy-mm-dd',
      showOn : "button",
      buttonText:"날짜 선택",
       prevText: '이전 달',
       nextText: '다음 달',
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNames: ['일','월','화','수','목','금','토'],
       dayNamesShort: ['일','월','화','수','목','금','토'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       yearSuffix: '년',
        changeMonth: true,
        changeYear: true
   }

   /* 캘린더 */
   $(function() {
     $( "input[name='publeYear']" ).datepicker(config);
   });
   

   /* 배열 초기화 */
   makeCateArray(cate1Obj,cate1Array,cateList,1);

   
   /* <option> 태그 */
   for(let i = 0; i < cate1Array.length; i++){
      cateSelect1.append("<option value='"+cate1Array[i].cateName+"'>" + cate1Array[i].cateName + "</option>");
   }
   
   
   
   /* 할인율 Input 설정 */
   
   $("#discount_interface").on("propertychange change keyup paste input", function(){
      
      let userInput = $("#discount_interface");
      let discountInput = $("input[name='productDiscount']");
      
      let discountRate = userInput.val();               // 사용자가 입력한 할인값
      let sendDiscountRate = discountRate / 100;         // 서버에 전송할 할인값
      let goodsPrice = $("input[name='productPrice']").val();         // 원가
      let discountPrice = goodsPrice * (1 - sendDiscountRate);      // 할인가격
      
      if(!isNaN(discountRate)){
         $(".span_discount").html(discountPrice);      
         discountInput.val(discountRate);            
      }

      
   });   
   
 

 
   
   /* 이미지 업로드 */
   $("input[type='file']").on("change", function(e){
      
      /* 이미지 존재시 삭제 */
      if($("#result card").length > 0){
         deleteFile();
      }
      
      let formData = new FormData();
      let fileInput = $('input[name="uploadFile"]');
      let fileList = fileInput[0].files;
      let fileObj = fileList[0];
      
      if(!fileCheck(fileObj.name, fileObj.size)){
         return false;
      }
      
      formData.append("uploadFile", fileObj);
      
      $.ajax({
         url: '/admin/uploadAjaxAction',
          processData : false,
          contentType : false,
          data : formData,
          type : 'POST',
          dataType : 'json',
          success : function(result){
             console.log(result);
             showUploadImage(result);
          },
          error : function(result){
             alert("이미지 파일이 아닙니다.");
          }
      });      

      
   });
      
   /* var, method related with attachFile */
   let regex = new RegExp("(.*?)\.(jpg|png)$");
   let maxSize = 1048576; //1MB   
   
   function fileCheck(fileName, fileSize){

      if(fileSize >= maxSize){
         alert("파일 사이즈 초과");
         return false;
      }
           
      if(!regex.test(fileName)){
         alert("해당 종류의 파일은 업로드할 수 없습니다.");
         return false;
      }
      
      return true;      
      
   }   
   
   
   /* 이미지 출력 */
   function showUploadImage(uploadResultArr){
      
      /* 전달받은 데이터 검증 */
      if(!uploadResultArr || uploadResultArr.length == 0){return}
      
      let uploadResult = $("#uploadResult");
      
      let obj = uploadResultArr[0];
      
      let str = "";
      
      let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
      //replace 적용 하지 않아도 가능
      //let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
      
      str += "<div id='result_card'>";
      str += "<img src='/display?fileName=" + fileCallPath +"'>";
      str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
      str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
      str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
      str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";      
      str += "</div>";      
      
         uploadResult.append(str);     
        
   }   
   
   
   /* 이미지 삭제 버튼 동작 */
   $("#uploadResult").on("click", ".imgDeleteBtn", function(e){
      
      deleteFile();
      
   });
   
   /* 파일 삭제 메서드 */
   function deleteFile(){
      
      let targetFile = $(".imgDeleteBtn").data("file");
      
      let targetDiv = $("#result_card");
      
      $.ajax({
         url: '/admin/deleteFile',
         data : {fileName : targetFile},
         dataType : 'text',
         type : 'POST',
         success : function(result){
            console.log(result);
            
            targetDiv.remove();
            $("input[type='file']").val("");
            
         },
         error : function(result){
            console.log(result);
            
            alert("파일을 삭제하지 못하였습니다.")
         }
      });
   }
   
   
</script>             

</body>
</html>