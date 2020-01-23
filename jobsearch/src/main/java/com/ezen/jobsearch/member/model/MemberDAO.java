package com.ezen.jobsearch.member.model;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
	//회원가입
	int insertMember(MemberVO memberVo);
	
	int selectMaxmemSeq();
	
	//중복확인
	int dupchkIdCount(String memberId);
	
	String selectPwd(String memberId);
	
	MemberVO selectMember(String memberId, String regType);
	
	//아이디찾기
	List<HashMap<String,String>> findId(String memberName, String phone);

	int updatePassword(HashMap<String, String> hMap);
	
	
	//관리자 회원 리스트
	List<MemberVO> selectMemberList(MemberVO searchVo);
	int selectTotalRecord(MemberVO searchVo);
	List<MemberVO> selectAll();

	//관리자 회원 삭제, 삭제 취소
	int deleteMember(String memberSeq, String type);
	
	//회원수정정보 불러오기
	MemberVO selectMember(String memberId);
	
	//회원정보 업데이트
	int updateMember(MemberVO vo);
	
	//회원정보 삭제
	int withdrawMember(String memberId);
}

