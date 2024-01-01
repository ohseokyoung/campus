package com.multi.campus.mapper;

import java.util.List;

import com.multi.campus.vo.BoardReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardReplyMapper {
	public int replyInsert(BoardReplyVO vo);
	public List<BoardReplyVO> replySelect(int no);
	public int replyUpdate(BoardReplyVO vo);
	public int replyDelete(int replyno);

}
