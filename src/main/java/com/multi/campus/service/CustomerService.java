package com.multi.campus.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.multi.campus.vo.CustomerVO;
import com.multi.campus.vo.PagingVO;
@Repository
@Service
public interface CustomerService {
	public int customerInsert(CustomerVO vo);
	public List<CustomerVO> customerPageList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
	public CustomerVO customerSelect(int no);
	public int customerUpdate(CustomerVO vo);
	public int customerDelete(int no);
	public int replyWrite(int no);
}
