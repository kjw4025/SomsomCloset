package com.somsomcloset.mapper;

import java.util.List;

import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.OrderDTO;

public interface MypageMapper {
	
	 /* 회원 정보 수정 */
	public int memberModify(MemberVO member);
		
	/* 회원 상세 */
	public MemberVO memberGetDetail(String memberId);
	
	/* 주문자 주소 정보 */
	public MemberVO getMemberInfo(String memberId);
	
	/* 회원 탈퇴 */
	public int memberDelete(String memberId);
	
	/*내 주문 보기 */
	public List<OrderDTO> getOrderList(Criteria cri);	
	
	/* 내 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
}