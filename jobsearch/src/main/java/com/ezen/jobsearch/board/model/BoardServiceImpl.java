package com.ezen.jobsearch.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jobsearch.common.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;
	
	@Override
	public int insertBoard(BoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	@Override
	public List<BoardVO> selectBoard(SearchVO searchVo) {
		return boardDao.selectBoard(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return boardDao.selectTotalRecord(searchVo);
	}

	@Override
	public BoardVO selectByBoardSeq(int boardSeq) {
		return boardDao.selectByBoardSeq(boardSeq);
	}

	@Override
	public int updateBoard(BoardVO boardVo) {
		return boardDao.updateBoard(boardVo);
	}
	
}
