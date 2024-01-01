package com.multi.campus.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@NoArgsConstructor
@AllArgsConstructor
@Data //Getter,Setter,toString,equals

public class BoardVO {
	private int no;
	private String subject;
	private String content;
	private String userid;
	private int hit;
	private String writedate;
	private String ip;
	
}
