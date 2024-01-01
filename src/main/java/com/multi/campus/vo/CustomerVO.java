package com.multi.campus.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerVO {

	private int no;
	private String subject;
	private String content;
	private String userid;
	private String writedate;
	private String ip;
	private String reply;
	private String type;
}


