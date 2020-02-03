package com.ezen.jobsearch.comment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jobsearch.common.SearchVO;

@Service
public class CommentSerivceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDao;

	@Override
	public int insertComment(CommentVO commentVo) {
		return commentDao.insertComment(commentVo);
	}

	@Override
	public List<Map<String,Object>> selectComment(SearchVO searchVo) {
		return commentDao.selectComment(searchVo);
	}


	
}
