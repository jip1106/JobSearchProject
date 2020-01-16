package com.ezen.jobsearch.resume.model;

import java.util.List;

public interface ResumeService {
	//자신 이력서 조회
	List<ResumeVO> selectResumeList(int memberSeq);
	
	//자신 이력서 카운트
	int selectMyResumeCount(int memberSeq);

	//등록버튼 클릭시 이력서 등록
	int insertResumeTest(ResumeVO resumeVo);

}
