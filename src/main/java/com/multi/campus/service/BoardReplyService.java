package com.multi.campus.service;

import java.util.List;

import com.multi.campus.vo.BoardReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardReplyService {
	public int replyInsert(BoardReplyVO vo);
	public List<BoardReplyVO> replySelect(int no);
	public int replyUpdate(BoardReplyVO vo);
	public int replyDelete(int replyno);
}
