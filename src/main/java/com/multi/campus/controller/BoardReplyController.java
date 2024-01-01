package com.multi.campus.controller;

import java.util.List;


import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.campus.service.BoardReplyService;
import com.multi.campus.vo.BoardReplyVO;

@Controller
@RequestMapping("/boardReply")
public class BoardReplyController {
	@Autowired
	BoardReplyService service;
	
	//��۵��
	@PostMapping("/write")
	@ResponseBody
	public String replyWrite(BoardReplyVO vo, HttpSession session) {//coment��no�� BoardReplyVO���� userid��HttpSessiondptj
		vo.setUserid((String)session.getAttribute("logId"));
		int result=service.replyInsert(vo);
		
		return result+"";
	}
	
	//��۸��
	@GetMapping("/list")
	@ResponseBody
	public List<BoardReplyVO> replyList(int no) {
		List<BoardReplyVO> replyList=service.replySelect(no);
		return replyList;
	}
	
	//��ۼ���(DB)
	@PostMapping("/editOk")
	@ResponseBody
	public String replyEditOk(BoardReplyVO vo) {
		return service.replyUpdate(vo)+"";
	}
	//��� ����
	@GetMapping("/delete")
	@ResponseBody
	public String replyDelete(int replyno) {
		return service.replyDelete(replyno)+"";
	}
}
