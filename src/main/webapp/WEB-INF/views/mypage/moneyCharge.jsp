<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>충전</title>
<link rel="stylesheet" href="/resources/css/member/mypage.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
<style type="text/css">
*{
	margin: 0;
	padding:0;
}
a{
	text-decoration: none;
}
a:link {color: black;}
a:visited {color: black;}
a:active {color: black;}
a:hover {color: black;}
ul{
    list-style: none;
}
/* 화면 전체 렙 */
.wrapper{
	width: 100%;
}
/* content 랩 */
.wrap{
	width : 1080px;
	margin: auto;
}
/* 홈페이지 기능 네비 */ 
.top_gnb_area{
	width: 100%;
    height: 50px;
    background-color: #f0f0f1;
    position:relative;
}
.top_gnb_area .list{
	position: absolute;
    top: 0px;
    right: 0;
    
}
.top_gnb_area .list li{
	list-style: none;	
    float : left;
    padding: 13px 15px 0 10px;
    font-weight: 900;
    cursor: pointer;
}

/* 관리제 페이지 상단 현페이지 정보 */
.admin_top_wrap{
    height:110px;
    line-height: 110px;
    background-color: #173b52;
    margin-bottom: 15px;
}
.admin_top_wrap>span{
    margin-left: 30px;
    display:inline-block;
    color: white;
    font-size: 50px;
    font-weight: bolder;
}
/* 관리자 wrap(네비+컨텐츠) */
.admin_wrap{
    
    
}

/* 관리자페이지 네비 영역 */
.admin_navi_wrap{
    width: 20%;
    height: 300px;
    float:left;
    height: 100%;
}
.admin_navi_wrap li{
    display: block;
    height: 80px;
    line-height: 80px;
    text-align: center;
}
.admin_navi_wrap li a{
    display: block;
    height: 100%;
    width: 95%;
    margin: 0 auto;
    cursor: pointer;
    font-size: 30px;
    font-weight: bolder;
}
 
.admin_list_05{
    background-color:#e5eaee;
} 



/* 관리자페이지 컨텐츠 영역 */
.admin_content_wrap{
    width: 80%;
    float:left;
    min-height:700px;
}
/* 관리자 컨텐츠 제목 영역 */
.admin_content_subject{	
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background-color: #94afc2;
    height: 80px;
    line-height: 80px;
    color: white;	
}
/* 관리자 컨텐츠 메인 영역 */
.form_section{
	width: 95%;
    margin-left: 2%;
    margin-top: 20px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}
.form_section_title{
	padding: 20px 35px;	
}
.form_section_title label{
	display: block;
    font-size: 20px;
    font-weight: 800;
}
.form_section_content{
	padding: 20px 35px;
    border-top: 1px solid #dbdde2;	
}
.form_section_content input{
	width: 98%;
    height: 25px;
    font-size: 20px;
    padding: 5px 1%;
}
.form_section_content textarea{
    width: 98%;
    height: 170px;
    font-size: 20px;	
}
.form_section_content select{
	width: 98%;
    height: 35px;
    font-size: 20px;
    text-align-last: center;
}
.input_block{
	background-color:#f9f9f9;	
}

/* 입력란 공란 경고 태그 */
.form_section_content span{	
	display: none;
    padding-top: 10px;
    text-align: center;
    color: #e05757;
    font-weight: 300;    
}



/* 버튼 영역 */
.btn_section{
	text-align: center;
	margin: 80px 0;
}
.btn{
    min-width: 180px;
    padding: 4px 30px;
    font-size: 25px;
    font-weight: 600;
    line-height: 40px;
}
.modify_btn{
	background-color: #b8d3e8;
	margin-left:15px;
}
.delete_btn{
	background-color: #efcdcd;
}
.delete_btn:hover{
	background-color : #e4a7a7;
}



/* footer navai 영역 */
.footer_nav{
	width:100%;
	height:50px;
}
.footer_nav_container{
	width: 100%;
	height: 100%;
	background-color: #173b52;
}
.footer_nav_container>ul{
	color:white;
	font-weight : bold;
	float:left;
	list-style:none;
	position:relative;
	padding-top:10px;
	line-height: 27px;
	font-family: dotum;
	margin-left: 10px;
}
.footer_nav_container>ul>li{
	display:inline;
	width: 45px;
	height: 19px;
	padding: 10px 9px 0 10px;
}
.footer_nav_container>ul>span{
	margin: 0 4px;
}
/* footer 영역 */
.footer{
	width:100%;
	height:130px;
	background-color:#D4DFE6;
	padding-bottom : 50px;
}
.footer_container{
	width: 100%;
	height: 100%;
	margin: auto;
}
.footer_left>img {
	width: 150%;
    height: 130px;
    margin-left: -20px;
    margin-top: -12px;
}
.footer_left{
	float :left;
	width: 170px;
	margin-left: 20px;
	margin-top : 30px;
	
}
.footer_right{
	float :left;
	width: 680px;
	margin-left: 70px;
	margin-top : 30px;
}
.btn_charge{
   background-color: #94afc2;
   margin-left:15px;
}
#chargeBtn:hover {
    background-color: #dfe8f5;
}


/* float 속성 해제 */
.clearfix{
	clear: both;
}</style>  
</head>
<body>
				<%@include file="../includes/mypage/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>충전</span></div>
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
	                   				<label>현재 금액</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input name="memberName" readonly ="readonly" value="<c:out value='${memberInfo.money }'></c:out>" >	                   			
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>은행명</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input name="memberMail" >
                   				<span id="warn_memberName">은행명을 입력해주세요.</span>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>카드 번호</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="memberMail" name="memberAddr1">
                   				<span id="warn_memberName">카드 번호를 입력해주세요.</span>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>카드 비밀번호</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="memberMail" name="memberAddr1">
                   				<span id="warn_memberName">카드 비밀번호를 입력해주세요.</span>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>충전할 금액</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="chargeMoney" name="memberAddr1">
                   				<span id="warn_memberName">충전할 금액을 입력해주세요.</span>
                   			</div>
                   		</div>
	                 		<div class="btn_section">
		                    	<button id="chargeBtn" class="btn btn_charge">충전</button>
		                    </div> 
	                    
                    </div>                    
                </div>
                
				<%@include file="../includes/mypage/footer.jsp" %>

<script>
	const form = {
			money : 0
	}
	$(".btn_charge").on("click", function(e){

		form.money = $(".chargeMoney").val();
		
		$.ajax({
			url : '/mypage/moneyChargeUpdate/${memberInfo.memberId}',
			type : 'POST',
			data : form,
			success : function (data) {
				alert("충전이 완료되었습니다.");
			}
		});
		
	});

</script>

</body>
</html>