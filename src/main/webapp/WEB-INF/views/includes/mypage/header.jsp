<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->	
            <div class="top_gnb_area">
                <ul class="list">	
                    <li><a href="/main">메인 페이지</a></li>
                    <li><a href="/member/logout.do">로그아웃</a></li>		
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>내 정보</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
	              <ul>
	                  <li> 
	                      <a class="admin_list_03" href="/mypage/${member.memberId}">내 정보</a>                            
	                  </li>                
	                  <li>
	                      <a class="admin_list_04" href="/mypage/orderList/${member.memberId}">주문 현황</a>                            
	                  </li>	
	                  <li>
	                      <a class="admin_list_05" href="/mypage/moneyCharge/${member.memberId}">충전</a>                           
	                  </li>                                                                                               
	              </ul>
                </div>