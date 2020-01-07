package com.ezen.jobsearch.member.model;

import java.util.HashMap;
import java.util.List;

import com.ezen.jobsearch.common.SearchVO;

public interface MemberDAO {
	//회원가입
	int insertMember(MemberVO memberVo);
	
	int selectMaxmemSeq();
	
	//중복확인
	int dupchkIdCount(String memberId);
	
	String selectPwd(String memberId);
	MemberVO selectMember(String memberId,String regType);
	
	//아이디찾기
	List<HashMap<String,String>> findId(String memberName, String phone);

	int updatePassword(HashMap<String, String> hMap);
	
	
	//관리자 회원 리스트
	List<MemberVO> selectMemberList(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
}
