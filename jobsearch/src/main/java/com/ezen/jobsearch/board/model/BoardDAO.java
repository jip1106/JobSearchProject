package com.ezen.jobsearch.board.model;

import java.util.List;

import com.ezen.jobsearch.common.SearchVO;

public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard(SearchVO searchVo);
	int deleteBoard(int boardSeq);
	int selectTotalRecord(SearchVO searchVo);
}
