package com.somsomcloset.service;

import java.util.List;

import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.OrderDTO;

public interface MypageService {
	/* 주문자 정보 */
	public MemberVO getMemberInfo(String memberId);	

	/* 회원 정보 수정 */
	public int memberModify(MemberVO author) throws Exception;	
	
	/* 회원 상세 페이지 */
	public MemberVO memberGetDetail(String memberId) throws Exception;
	
	/* 회원 정보 삭제 */
	public int memberDelete(String memberId);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList( Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
}
