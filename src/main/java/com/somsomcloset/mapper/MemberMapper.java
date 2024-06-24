package com.somsomcloset.mapper;

import java.util.List;

import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.MemberVO;

public interface MemberMapper {

	/* 회원가입 */
	public void memberJoin(MemberVO member);

	/* 아이디 중복 검사 */
	public int idCheck(String memberId);
	
	/* 로그인 */
	public MemberVO memberLogin(MemberVO member);
	
	/* 주문자 주소 정보 */
	public MemberVO getMemberInfo(String memberId);		
	
	/* 회원 목록 */
	public List<MemberVO> memberGetList(Criteria cri);
	
	/* 작가 총 수 */
    public int memberGetTotal(Criteria cri);
    
    /* 작가 정보 수정 */
	public int memberModify(MemberVO member);
	
	/* 작가 상세 */
	public MemberVO memberGetDetail(String memberId);
	
	/* 회원 삭제 */
	public int memberDelete(String memberId);

	/* 충전 */
	public int moneyCharge(MemberVO member);
	
}
