package com.ezen.jobsearch.resume.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeServiceImpl implements ResumeService{
	
	
	@Autowired
	private ResumeDAO resumeDao;
	
	@Override
	public List<Map<String, Object>> selectEmp() {
		return resumeDao.selectEmp();
	}
	
	@Override
	public List<Map<String, Object>> selectCate() {
		return resumeDao.selectCate();
	}
	
	@Override
	public List<Map<String, Object>> selectLoca() {
		return resumeDao.selectLoca();
	}
	
	@Override
	public List<ResumeVO> resumeList(int memberSeq) {
		return resumeDao.resumeList(memberSeq);
	}
	

	@Override
	public int resumeListCount(int memberSeq) {
		return resumeDao.resumeListCount(memberSeq);
	}

	
	@Override
	public int resumeListDel(int resumeSeq) {
		return resumeDao.resumeListDel(resumeSeq);
	}

	@Override
	public List<ResumeVO> selectResumeList(int memberSeq) {
		
		return resumeDao.selectResumeList(memberSeq);
	}

	@Override
	public int selectMyResumeCount(int memberSeq) {
		// TODO Auto-generated method stub
		return resumeDao.selectMyResumeCount(memberSeq);
	}

	@Override
	public int insertResumeTest(ResumeVO resumeVo) {
		// TODO Auto-generated method stub
		return resumeDao.insertResumeTest(resumeVo);
	}


}
