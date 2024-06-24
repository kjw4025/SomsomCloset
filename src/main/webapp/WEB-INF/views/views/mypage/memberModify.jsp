<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<link rel="stylesheet" href="../resources/css/admin/memberModify.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
				<%@include file="../includes/mypage/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>회원 상세</span></div>
                    <div class="admin_content_main">
                    	<form id="modifyForm" action="/admin/memberModify" method="post">
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>회원 ID</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" name="memberId" readonly="readonly" value="<c:out value='${memberInfo.memberId }'></c:out>">
	                   			</div>
	                   		</div>                    
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>회원 이름</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input name="memberName" value="<c:out value='${memberInfo.memberName }'></c:out>" >
	                   				<span id="warn_memberName">작가 이름을 입력 해주세요.</span>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>메일</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input name="memberMail" value="<c:out value='${memberInfo.memberMail }'></c:out>" >
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>우편번호</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="memberAddr1" readonly="readonly" value="<c:out value='${memberInfo.memberAddr1 }'></c:out>" >
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>주소</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="memberAddr2" readonly="readonly" value="<c:out value='${memberInfo.memberAddr2 }'></c:out>" >
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>상세주소</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="memberAddr3" readonly="readonly" value="<c:out value='${memberInfo.memberAddr3 }'></c:out>" >
                   			</div>
                   		</div>
	                 		<div class="btn_section">
	                   			<button id="cancelBtn" class="btn">취소</button>
		                    	<button id="modifyBtn" class="btn modify_btn">수 정</button>
		                    	<button id="deleteBtn" class="btn delete_btn">삭 제</button>
		                    </div> 
	                    </form>
                    </div>                    
                </div>
                
                <form id="moveForm" method="get">
                	<input type="hidden" name="memberId" value='<c:out value="${memberInfo.memberId }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
				<%@include file="../includes/mypage/footer.jsp" %>

<script>

	let moveForm = $("#moveForm");
	let modifyForm = $("#modifyForm");
	



	/* 작가 상세 페이지 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		
		e.preventDefault();
				
		moveForm.attr("action", "/admin/memberDetail")
		moveForm.submit();
		
	});
	
	/* 삭제 버튼 */
	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="memberId" value="${memberInfo.memberId}">');
		moveForm.attr("action", "/admin/memberDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});	
	
	/* 취소 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();
	});
	
	/* 회원 수정 버튼 작동 및 유효성 검사 */
	$("#modifyBtn").on("click", function(e){

		let memberName = $(".form_section_content input[name='memberName']").val();
		let memberIntro = $(".form_section_content textarea").val();		

		let	nameCk = false;
		let introCk = false;		
		
		e.preventDefault();
		modifyForm.submit();	
		
	});
	
	
	

</script>

</body>
</html>