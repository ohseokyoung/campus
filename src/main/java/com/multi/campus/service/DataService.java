package com.multi.campus.service;

import java.util.List;

import com.multi.campus.vo.DataVO;
import com.multi.campus.vo.DatafileVO;
import org.springframework.stereotype.Repository;

@Repository
public interface DataService {
	public List<DataVO> dataList();
	public int dataInsert(DataVO vo);
	public int datafileInsert(List<DatafileVO> list );
	public void dataHitCount(int no);
	public DataVO dataSelect(int no);
	public List<DatafileVO> getDataFile(int no);
	public int dataUpdate(DataVO vo);
	public int dataDelete(int no);
	public int dataRecordDelete(int no,String userid);
}
