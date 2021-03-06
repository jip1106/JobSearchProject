package com.ezen.jobsearch.apply.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplyServiceImpl implements ApplyService {
	
	@Autowired
	private ApplyDAO applyDao;
		
	@Override
	public int insertApply(ApplyVO applyVo) {		
		return applyDao.insertApply(applyVo);
	}
	
	@Override
	public List<Map<String, Object>> selectmypageapplyList(int memberSeq) {
		return applyDao.selectmypageapplyList(memberSeq);
	}

	@Override
	public int selectApplyYN(ApplyVO applyVo) {
		return applyDao.selectApplyYN(applyVo);
	}

	@Override
	public int deleteApply(int applySeq) {
		return applyDao.deleteApply(applySeq);
	}

	@Override
	public int updateFlag(ApplyVO applyVo) {
		return applyDao.updateFlag(applyVo);
	}

	@Override
	public List<Map<String, Object>> selectCountByDate(int month) {
		return applyDao.selectCountByDate(month);
	}
}
