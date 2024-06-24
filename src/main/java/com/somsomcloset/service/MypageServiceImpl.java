package com.somsomcloset.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somsomcloset.mapper.AdminMapper;
import com.somsomcloset.mapper.MemberMapper;
import com.somsomcloset.mapper.MypageMapper;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.OrderDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j

public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mypageMapper;
	
	/* 주문 상품 리스트 */
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return mypageMapper.getOrderList(cri);
	}
	
	/* 주문 총 갯수 */
	@Override
	public int getOrderTotal(Criteria cri) {
		return mypageMapper.getOrderTotal(cri);
	}
	
	/* 주문자 주소 정보 */
	@Override
	public MemberVO getMemberInfo(String memberId) {
		
		return mypageMapper.getMemberInfo(memberId);
		
	}
	
    
	/* 회원 상세 페이지 */
	@Override
	public MemberVO memberGetDetail(String memberId) throws Exception {
		
		return mypageMapper.memberGetDetail(memberId);
	}	
	
	/* 회원 정보 수정 */
	@Override
	public int memberModify(MemberVO member) throws Exception {
		return mypageMapper.memberModify(member);
	}
	
	/* 회원 정보 삭제 */
	@Override
	public int memberDelete(String memberId) {
		
		
		return mypageMapper.memberDelete(memberId);
	}
}
