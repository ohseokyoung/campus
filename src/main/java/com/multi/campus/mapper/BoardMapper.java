package com.multi.campus.mapper;

import java.util.List;

import com.multi.campus.vo.BoardVO;
import com.multi.campus.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardMapper {
	public int boardInsert(BoardVO vo);
	public List<BoardVO> boardPageList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
	public BoardVO boardSelect(int no);
	public void hitCount(int no);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(int no);
}
