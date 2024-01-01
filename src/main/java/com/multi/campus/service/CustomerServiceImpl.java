package com.multi.campus.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.multi.campus.mapper.CustomerMapper;
import com.multi.campus.vo.CustomerVO;
import com.multi.campus.vo.PagingVO;
@Repository
@Service
public class CustomerServiceImpl implements CustomerService{
@Inject
CustomerMapper mapper;

@Override
public int customerInsert(CustomerVO vo) {
	
	return mapper.customerInsert(vo);
}

@Override
public List<CustomerVO> customerPageList(PagingVO pVO) {
	
	return mapper.customerPageList(pVO);
}

@Override
public int totalRecord(PagingVO pVO) {
	
	return mapper.totalRecord(pVO);
}

@Override
public CustomerVO customerSelect(int no) {
	
	return mapper.customerSelect(no);
}

@Override
public int customerUpdate(CustomerVO vo) {
	
	return mapper.customerUpdate(vo);
}

@Override
public int customerDelete(int no) {
	
	return mapper.customerDelete(no);
}

@Override
public int replyWrite(int no) {
	
	return mapper.replyWrite(no);
}



}
