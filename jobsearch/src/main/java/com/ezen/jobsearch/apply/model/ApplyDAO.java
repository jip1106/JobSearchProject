package com.ezen.jobsearch.apply.model;

import java.util.List;
import java.util.Map;

public interface ApplyDAO {
	int insertApply(ApplyVO applyVo);
	List<Map<String, Object>> selectmypageapplyList(int memberSeq);
}