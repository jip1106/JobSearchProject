package com.ezen.jobsearch.comment.model;

import java.util.List;
import java.util.Map;

import com.ezen.jobsearch.common.SearchVO;

public interface CommentService {
	int insertComment(CommentVO commentVo);
	List<Map<String,Object>> selectComment(SearchVO searchVo);
	int deleteComment(int commentSeq);
	Map<String,Object> selectByCommentSeq(int commentSeq);
	int updateComment(CommentVO commentVo);
}
