package com.ezen.jobsearch.viewann.model;

import java.util.List;

public interface ViewAnnDAO {
	int insertViewAnn(ViewAnnVO viewAnnVo);
	int selectViewAnnYN(ViewAnnVO viewAnnVO);
	List<ViewAnnVO> selectViewAnn(int memberSeq);
	int deleteOldView(int memberSeq);
}
