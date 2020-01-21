package com.ezen.jobsearch.viewann.model;

import java.util.List;
import java.util.Map;

public interface ViewAnnDAO {
	int insertViewAnn(ViewAnnVO viewAnnVo);
	int selectViewAnnYN(ViewAnnVO viewAnnVO);
	List<ViewAnnVO> selectViewAnn(int memberSeq);
	int deleteOldView(int memberSeq);
	int mypagerecentnoticeListDel(int viewSeq);
	List<Map<String, Object>> selectmypagerecentnoticeList(int memberSeq);
}
