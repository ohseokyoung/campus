package com.multi.campus.vo;

import lombok.ToString;

@ToString
public class PagingVO {
	private int nowPage=1;
	private int onePageRecord=5;
	
	private int totalRecord;
	private int totalPage;
	
	private int offsetPoint=(nowPage-1)*onePageRecord;
	
	//������ �ѹ���
	private int onePageCount=5;
	private int startPage=1;
	
	//�˻���
	private String searchKey;
	private String searchWord;

	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		//�ش������� ��ġ�� ���
		offsetPoint = (nowPage-1)*onePageRecord;
		
		//����������: ���������� ��ȣ�� �ٲ�
		startPage = (nowPage-1)/onePageCount*onePageCount+1;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//����������
				//  31   /  5  =6
		totalPage =(int)Math.ceil(totalRecord/(double)onePageRecord) ;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		
		
	}

	public int getOffsetPoint() {
		return offsetPoint;
	}

	public void setOffsetPoint(int offsetPoint) {
		this.offsetPoint = offsetPoint;
	}

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	
}
