package com.multi.campus.mapper;

import java.util.List;

import com.multi.campus.vo.CustomerVO;
import com.multi.campus.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CustomerMapper {
	public int customerInsert(CustomerVO vo);
	public List<CustomerVO> customerPageList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
	public CustomerVO customerSelect(int no);
	public int customerUpdate(CustomerVO vo);
	public int customerDelete(int no);
	public int replyWrite(int no);
}
