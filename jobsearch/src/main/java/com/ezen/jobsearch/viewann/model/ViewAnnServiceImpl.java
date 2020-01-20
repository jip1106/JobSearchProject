package com.ezen.jobsearch.viewann.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViewAnnServiceImpl implements ViewAnnService {
		
	@Autowired
	private ViewAnnDAO viewAnnDao;
	
	final static int ALREADY_SEEN=-1;
	
	//이미 목록에 있으면 추가하지 않음
	@Override
	public int insertViewAnn(ViewAnnVO viewAnnVo) {
		if(viewAnnDao.selectViewAnnYN(viewAnnVo)!=0) {
			return ALREADY_SEEN;
			//최근 본 공고가 10개 이상이면 가장 오래된 것 삭제 후 등록
		}else if(viewAnnDao.selectViewAnn(viewAnnVo.getRefMemberseq()).size()>9) {
			viewAnnDao.deleteOldView(viewAnnVo.getRefMemberseq());
			return viewAnnDao.insertViewAnn(viewAnnVo);
		}
		return viewAnnDao.insertViewAnn(viewAnnVo);
	}
	
}
