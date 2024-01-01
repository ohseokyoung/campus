package com.multi.campus.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.multi.campus.mapper.DataMapper;
import com.multi.campus.vo.DataVO;
import com.multi.campus.vo.DatafileVO;
@Repository
@Service
public class DataServiceImpl implements DataService {
	@Inject
	DataMapper mapper;

	@Override
	public List<DataVO> dataList() {
		return mapper.dataList();
	}

	@Override
	public int dataInsert(DataVO vo) {
		return mapper.dataInsert(vo);
	}

	@Override
	public int datafileInsert(List<DatafileVO> list) {
		return mapper.datafileInsert(list);
	}

	@Override
	public void dataHitCount(int no) {
		mapper.dataHitCount(no);
		
	}

	@Override
	public DataVO dataSelect(int no) {
		return mapper.dataSelect(no);
	}

	@Override
	public List<DatafileVO> getDataFile(int no) {
		return mapper.getDataFile(no);
	}

	@Override
	public int dataUpdate(DataVO vo) {
		return mapper.dataUpdate(vo);
	}

	@Override
	public int dataDelete(int no) {
		return mapper.dataDelete(no);
	}

	@Override
	public int dataRecordDelete(int no, String userid) {
		return mapper.dataRecordDelete(no, userid);
	}
}
