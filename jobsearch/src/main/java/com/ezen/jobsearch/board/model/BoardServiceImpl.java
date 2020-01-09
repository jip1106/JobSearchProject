package com.ezen.jobsearch.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public int deleteBoard(List<BoardVO> list) {
		int cnt=0;
		try {
			for(BoardVO boardVo : list) {
				int boardSeq=boardVo.getBoardSeq();
				if(boardSeq!=0) {
					cnt=boardDao.deleteBoard(boardSeq);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return boardDao.selectTotalRecord(searchVo);
	}
	
}
