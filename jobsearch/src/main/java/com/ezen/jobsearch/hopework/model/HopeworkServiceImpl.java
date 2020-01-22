package com.ezen.jobsearch.hopework.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HopeworkServiceImpl implements HopeworkService{

	@Autowired
	private HopeworkDAO hopeworkDao;
	
	@Override
	public int insertHopework(HopeworkVO hopeworkVo) {
		
		return hopeworkDao.insertHopework(hopeworkVo);
	}

	@Override
	public int updateHopework(HopeworkVO hopeworkVo) {
		
		return hopeworkDao.updateHopework(hopeworkVo);
	}

}
