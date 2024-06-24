<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<link rel="stylesheet" href="../resources/css/admin/memberDetail.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
				<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>회원 상세</span></div>
                    <div class="admin_content_main">
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
                   				<input class="input_block" name="memberName" readonly="readonly" value="<c:out value='${memberInfo.memberName }'></c:out>" >
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>메일</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="memberMail" readonly="readonly" value="<c:out value='${memberInfo.memberMail }'></c:out>" >
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
                   				<button id="cancelBtn" class="btn">회원 목록</button>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    	</div> 
                    </div>                    
                </div>
                
                <form id="moveForm" method="get">
                	<input type="hidden" name="memberId" value='<c:out value="${memberInfo.memberId }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
				<%@include file="../includes/admin/footer.jsp" %>

<script>

	let moveForm = $("#moveForm");

	/* 회원 관리 페이지 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=memberId]").remove();
		moveForm.attr("action", "/admin/memberManage")
		moveForm.submit();
		
	});
	
	/* 회원 수정 페이지 이동 버튼 */
	$("#modifyBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/memberModify");
		moveForm.submit();
		
	});

</script>

</body>
</html>