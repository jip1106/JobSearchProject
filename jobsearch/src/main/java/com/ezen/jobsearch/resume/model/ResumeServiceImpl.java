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
	public List<Map<String,Object>> selectResumeListMap(int memberSeq) {
		
		return resumeDao.selectResumeListMap(memberSeq);
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

	@Override
	public Map<String, Object> selectMyResumeInfo(String resumeSeq) {
		// TODO Auto-generated method stub
		return resumeDao.selectMyResumeInfo(resumeSeq);
	}

	@Override
	public int updateResume(ResumeVO resumeVo) {
		// TODO Auto-generated method stub
		return resumeDao.updateResume(resumeVo);
	}

	@Override
	public List<ResumeVO> selectResumeList(int memberSeq) {
		// TODO Auto-generated method stub
		return resumeDao.selectResumeList(memberSeq);
	}

	@Override
	public int deleteResume(String resumeSeq) {
		// TODO Auto-generated method stub
		return resumeDao.deleteResume(resumeSeq);
	}

	@Override
	public List<Map<String, Object>> selectAllResume(ResumeSearchVO resumeSearchVo) {
		// TODO Auto-generated method stub
		return resumeDao.selectAllResume(resumeSearchVo);
	}

	@Override
	public Map<String, Object> selectResumeByresumeSeq(String resumeSeq) {
		// TODO Auto-generated method stub
		return resumeDao.selectResumeByresumeSeq(resumeSeq);
	}




}
