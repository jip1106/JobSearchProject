package com.ezen.jobsearch.board.model;

import java.util.List;

public interface BoardService {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard(String boardType);
	int deleteBoard(List<BoardVO> list);
}
