package com.ezen.jobsearch.member.model;

import java.util.HashMap;
import java.util.List;

import com.ezen.jobsearch.common.SearchVO;

public interface MemberService {
	public static final int EDIT_PASS=1; 
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	
	//회원가입
	int insertMember(MemberVO memberVo);
	
	//회원 시퀀스 최대값 리턴
	int selectMaxmemSeq();
	//아이디 중복검사
	int dupchkIdCount(String memberId);
	
	//회원가입 인증번호 발송
	String sendCertiNumberMail(String inputMail);
	
	String selectPwd(String memberId);
	//로그인
	MemberVO selectMember(String memberId,String regType);
	
	//아이디찾기
	List<HashMap<String,String>> findId(String memberName, String phone);
	
	//비밀번호 랜덤 생성 발송
	String sendRandomPassword(String inputMail);
	
	//비밀번호 업데이트
	int updatePassword(HashMap<String,String> hMap);
	
	
	//관리자 회원 리스트 조회
	List<MemberVO> selectMemberList(MemberVO searchVo);
	
	List<MemberVO> selectAll();

	int selectTotalRecord(MemberVO searchVo);

	//관리자 회원 삭제, 삭제 취소
	int deleteMember(String memberSeq, String type);
	
	//회원수정 
	MemberVO selectMember(String memberId);
	
	//회원정보 업데이트
	int updateMember(MemberVO vo);
	
	//회원정보 탈퇴
	public int withdrawMember(String memberId);
}
