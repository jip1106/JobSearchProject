package com.ezen.jobsearch.comment.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentSerivceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDao;

	@Override
	public int insertComment(CommentVO commentVo) {
		return commentDao.insertComment(commentVo);
	}

	
}
