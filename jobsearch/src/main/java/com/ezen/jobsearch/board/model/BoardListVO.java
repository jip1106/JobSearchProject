package com.ezen.jobsearch.board.model;

import java.util.List;

public class BoardListVO {
	private List<BoardVO> boardList;

	public List<BoardVO> getBoardList() {
		return boardList;
	}
	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}
	@Override
	public String toString() {
		return "BoardListVO [boardList=" + boardList + "]";
	}	
	
}
