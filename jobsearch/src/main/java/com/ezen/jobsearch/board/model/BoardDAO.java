package com.ezen.jobsearch.board.model;

import java.util.List;

public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard(String boardType);
	int deleteBoard(int boardSeq);
}
