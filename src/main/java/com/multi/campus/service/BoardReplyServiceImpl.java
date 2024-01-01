package com.multi.campus.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.multi.campus.mapper.BoardReplyMapper;
import com.multi.campus.vo.BoardReplyVO;
@Repository
@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	@Inject
	BoardReplyMapper mapper;

	@Override
	public int replyInsert(BoardReplyVO vo) {
		return mapper.replyInsert(vo);
	}

	@Override
	public List<BoardReplyVO> replySelect(int no) {
		return mapper.replySelect(no);
	}

	@Override
	public int replyUpdate(BoardReplyVO vo) {
		return mapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int replyno) {
		return mapper.replyDelete(replyno);
	}
}
