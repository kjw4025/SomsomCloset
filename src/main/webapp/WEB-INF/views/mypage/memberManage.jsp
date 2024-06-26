<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="../resources/css/admin/memberManage.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>

				<%@include file="../includes/mypage/header.jsp" %>
				
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>회원 관리</span></div>
					<div class="author_table_wrap">
						<!-- 게시물 O -->
						<c:if test="${listCheck != 'empty' }">
	                    	<table class="author_table">
	                    		<thead>
	                    			<tr>
	                    				<td class="th_column_1">회원 ID</td>
	                    				<td class="th_column_2">회원 이름</td>
	                    				<td class="th_column_3"> 메일</td>
	                    				<td class="th_column_4"> 우편번호</td>
	                    				<td class="th_column_5"> 주소 </td>
	                    				<td class="th_column_6"> 상세주소 </td>
	                    			</tr>
	                    		</thead>
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.memberId}"></c:out> </td>
	                    			<td>
	                    				<a class="move" href='<c:out value="${list.memberId}"/>'>
	                    					<c:out value="${list.memberName}"></c:out>
	                    				</a> 	                    				
	                    			</td>
	                    			<td><c:out value="${list.memberMail}"></c:out> </td>
	                    			<td><c:out value="${list.memberAddr1}"></c:out> </td>
	                    			<td><c:out value="${list.memberAddr2}"></c:out> </td>
	                    			<td><c:out value="${list.memberAddr3}"></c:out> </td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>						
						</c:if>
						
                		<!-- 게시물 x -->
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 회원이 없습니다.
                			</div>
                		</c:if> 						
                			
                    </div> 
                    
                    <!-- 검색 영역 -->
                    <div class="search_wrap">
                    	<form id="searchForm" action="/admin/memberManage" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<button class='btn search_btn'>검 색</button>
                    		</div>
                    	</form>
                    </div>                    

                    <!-- 페이지 이동 인터페이스 영역 -->
                    <div class="pageMaker_wrap" >
                    
	                    <ul class="pageMaker">
	                    
	                    	<!-- 이전 버튼 -->
	                    	<c:if test="${pageMaker.prev}">
	                    		<li class="pageMaker_btn prev">
	                    			<a href="${pageMaker.pageStart - 1}">이전</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    	<!-- 페이지 번호 -->
	                    	<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
	                    		<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
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
                    
					<form id="moveForm" action="/admin/memberManage" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>                    
                                       
                </div>
 
 				<%@include file="../includes/mypage/footer.jsp" %>

<script>
$(document).ready(function(){
	
	let result = '<c:out value="${enroll_result}"/>';
	let mresult = '<c:out value="${modify_result}"/>';
	
	checkResult(result);
	checkmResult(mresult);
	
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("작가'${enroll_result}'을 등록하였습니다.");
		
	}
	
	function checkmResult(mresult){
		
		if(mresult === '1'){
			alert("회원 정보 수정을 완료하였습니다.");
		} else if(mresult === '0') {
			alert("회원 정보 수정을 하지 못하였습니다.")	
		}
		
	}
	
	/* 삭제 결과 경고창 */
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제되었습니다.");
	} else if(delete_result == 2){
		alert("해당 작가 데이터를 사용하고 있는 데이터가 있어서 삭제 할 수 없습니다.")
	}		
	

});

let moveForm = $('#moveForm');
let searchForm = $('#searchForm');

/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

/* 회원 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});

/* 작가 상세 페이지 이동 */
$(".move").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='memberId' value='"+ $(this).attr("href") + "'>");
	moveForm.attr("action", "/admin/memberDetail");
	moveForm.submit();
	
});

</script>

</body>
</html>