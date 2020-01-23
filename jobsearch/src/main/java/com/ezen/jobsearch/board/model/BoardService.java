package com.ezen.jobsearch.board.model;

import java.util.List;

import com.ezen.jobsearch.common.SearchVO;

public interface BoardService {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	BoardVO selectByBoardSeq(int boardSeq);
	int updateBoard(BoardVO boardVo);
	int deleteBoard(List<BoardVO> list);
	int updateHits(int boardSeq);
}
