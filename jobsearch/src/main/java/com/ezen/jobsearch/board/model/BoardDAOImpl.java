package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.jobsearch.common.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.board.";
	
	@Override
	public int insertBoard(BoardVO boardVo) {		
		return sqlSession.insert(namespace+"insertBoard", boardVo);
	}

	@Override
	public List<BoardVO> selectBoard(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectBoard", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}

	@Override
	public BoardVO selectByBoardSeq(int boardSeq) {
		return sqlSession.selectOne(namespace+"selectByBoardSeq", boardSeq);
	}

	@Override
	public int updateBoard(BoardVO boardVo) {
		return sqlSession.update(namespace+"updateBoard", boardVo);
	}

	@Override
	public int deleteBoard(int boardSeq) {
		return sqlSession.delete(namespace+"deleteBoard", boardSeq);
	}

	@Override
	public int updateHits(int boardSeq) {
		return sqlSession.update(namespace+"updateHits", boardSeq);
	}

	@Override
	public List<BoardVO> selectMainBoard(BoardVO boardVo) {
		return sqlSession.selectList(namespace+"selectMainBoard", boardVo);
	}

	@Override
	public BoardVO selectMemberName(int boardSeq) {
		return sqlSession.selectOne(namespace+"selectMemberName", boardSeq);
	}

	@Override
	public BoardVO selectByrowNum(int boardSeq) {
		return sqlSession.selectOne(namespace+"selectByrowNum", boardSeq);
	}

	
}
