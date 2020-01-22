package com.ezen.jobsearch.resume.model;

import java.util.List;
import java.util.Map;


public interface ResumeService {
	List<Map<String, Object>> selectEmp();
	List<Map<String, Object>> selectCate();
	List<Map<String, Object>> selectLoca();
	List<ResumeVO> resumeList(int memberSeq);
	int resumeListCount(int memberSeq);
	int resumeListDel(int resumeSeq);
	
	//자신 이력서 조회
	List<ResumeVO> selectResumeList(int memberSeq);
	
	//자신 이력서 카운트
	int selectMyResumeCount(int memberSeq);

	//등록버튼 클릭시 이력서 등록
	int insertResumeTest(ResumeVO resumeVo);
	//이력서등록정보
	Map<String, Object> selectMyResumeInfo(String resumeSeq);

}
