package com.ezen.jobsearch.viewann.model;

import java.util.List;
import java.util.Map;

public interface ViewAnnService {
	int insertViewAnn(ViewAnnVO viewAnnVo);
	int mypagerecentnoticeListDel(int viewSeq);
	List<Map<String, Object>> selectmypagerecentnoticeList(int memberSeq);
}
