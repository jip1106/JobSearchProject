package com.ezen.jobsearch.resume.model;

import java.util.List;
import java.util.Map;

public interface ResumeDAO {
	List<Map<String, Object>> selectEmp();

}
