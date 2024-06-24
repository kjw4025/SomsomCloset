package com.somsomcloset.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsomcloset.mapper.MemberMapper;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper membermapper;

	/* 회원가입 */
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return membermapper.idCheck(memberId);
	}

	/* 로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return membermapper.memberLogin(member);
	}
	
	/* 주문자 정보 */
	@Override
	public MemberVO getMemberInfo(String memberId) {
		
		return membermapper.getMemberInfo(memberId);
		
	}
	
	/* 회원 목록*/
	@Override
	public List<MemberVO> memberGetList(Criteria cri) throws Exception {
		
		return membermapper.memberGetList(cri);
	}
	
	/* 회원 총 수 */
    @Override
    public int memberGetTotal(Criteria cri) throws Exception {
        
    	return membermapper.memberGetTotal(cri);
    }
    
	/* 회원 상세 페이지 */
	@Override
	public MemberVO memberGetDetail(String memberId) throws Exception {
		
		return membermapper.memberGetDetail(memberId);
	}	
	
	/* 회원 정보 수정 */
	@Override
	public int memberModify(MemberVO member) throws Exception {
		return membermapper.memberModify(member);
	}
	
	/* 회원 정보 삭제 */
	@Override
	public int memberDelete(String memberId) {
		
		
		return membermapper.memberDelete(memberId);
	}

	//충전
	@Override
	public int moneyCharge(MemberVO member) {
		// TODO Auto-generated method stub
		return membermapper.moneyCharge(member);
	}
}
