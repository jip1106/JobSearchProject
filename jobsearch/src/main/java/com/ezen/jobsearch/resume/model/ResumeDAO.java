package com.ezen.jobsearch.resume.model;

import java.util.List;
import java.util.Map;

public interface ResumeDAO {
	List<Map<String, Object>> selectEmp();
	List<Map<String, Object>> selectCate();
	List<Map<String, Object>> selectLoca();

}
