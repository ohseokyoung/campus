package com.multi.campus.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.multi.campus.mapper.BoardMapper;
import com.multi.campus.vo.BoardVO;
import com.multi.campus.vo.PagingVO;
@Repository
@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardMapper mapper;

	@Override
	public int boardInsert(BoardVO vo) {
		
		return mapper.boardInsert(vo);
	}

	@Override
	public List<BoardVO> boardPageList(PagingVO pVO) {
		return mapper.boardPageList(pVO);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return mapper.totalRecord(pVO);
	}

	@Override
	public BoardVO boardSelect(int no) {
		return mapper.boardSelect(no);
	}

	@Override
	public void hitCount(int no) {
		mapper.hitCount(no);
		
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return mapper.boardUpdate(vo);
	}

	@Override
	public int boardDelete(int no) {
		return mapper.boardDelete(no);
	}
}
