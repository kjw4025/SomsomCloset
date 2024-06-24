package com.somsomcloset.service;

import java.util.List;

import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.MemberVO;

public interface MemberService {

	/* 회원가입 */
	public void memberJoin(MemberVO member) throws Exception;
	
	/* 아이디 중복 검사 */
	public int idCheck(String memberId) throws Exception;
	
	/* 로그인 */
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	/* 주문자 정보 */
	public MemberVO getMemberInfo(String memberId);	
	
	/* 회원 목록 */
	public List<MemberVO> memberGetList(Criteria cri) throws Exception;

	/* 회원 정보 수정 */
	public int memberModify(MemberVO member) throws Exception;
	
	/* 회원 총 수 */
    public int memberGetTotal(Criteria cri) throws Exception;
    
	/* 회원 상세 페이지 */
	public MemberVO memberGetDetail(String memberId) throws Exception;
	
	/* 회원 정보 삭제 */
	public int memberDelete(String memberId);

	//충전
	public int moneyCharge(MemberVO member);
	
}
