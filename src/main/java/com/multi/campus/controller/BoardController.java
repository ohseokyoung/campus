package com.multi.campus.controller;

import java.util.List;


import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.multi.campus.service.BoardService;
import com.multi.campus.vo.BoardVO;
import com.multi.campus.vo.PagingVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	//�Խ���
	@GetMapping("/board/list")
	public ModelAndView boardList(PagingVO pVO) {
		ModelAndView mav=new ModelAndView();
		//�ѷ��ڵ� ��
		pVO.setTotalRecord(service.totalRecord(pVO));
		//DB����(page,�˻�)
		List<BoardVO> list=service.boardPageList(pVO);
		
		mav.addObject("pVO", pVO);
		mav.addObject("list", list);
		mav.setViewName("board/boardList");
		return mav;
	}
	//�۾�����
	@GetMapping("/board/write")
	public String boardWrite() {
		return "board/boardWrite";
	}
	//�۵��(DB)
	@PostMapping("/board/writeOk")

	public ModelAndView boardWriteOk(BoardVO vo, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		vo.setIp(request.getRemoteAddr());
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		
		int result = service.boardInsert(vo);
		if(result>0) {//�۵��
			mav.setViewName("redirect:list");
		}else {//��Ͻ���
			mav.addObject("msg", "���");
			mav.setViewName("board/boardResult");
		}
		return mav;
	}
	
	//�۳��뺸��
	@GetMapping("/board/view")
	public ModelAndView boardView(int no, PagingVO pVO) {
		
		service.hitCount(no);//��ȸ�� ����
		BoardVO vo=service.boardSelect(no);
		ModelAndView mav= new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("pVO", pVO);
		mav.setViewName("board/boardView");
		
		return mav;
	}
	//�ۼ��� ��
	@GetMapping("/board/edit")
	public ModelAndView boardEdit(int no) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",service.boardSelect(no));
		mav.setViewName("board/boardEdit");
		return mav;
	}
	//�ۼ���(DB)
	@PostMapping("/board/editOk")
	public ModelAndView boardEditOk(BoardVO vo) {
		int result=service.boardUpdate(vo);
		ModelAndView mav=new ModelAndView();
		if(result>0) {//��������
			mav.setViewName("redirect:view?no="+vo.getNo());
		}else {//��������
			mav.addObject("msg","����");
			mav.setViewName("board/boardResult");
		}
		return mav;
	}
	//�Խñ� ����
	@GetMapping("/board/delete")
	public ModelAndView boardDelete(int no) {
		ModelAndView mav=new ModelAndView();
		int result=service.boardDelete(no);
		if(result>0) {//��������
			mav.setViewName("redirect:list");
		}else {//��������
			mav.setViewName("redirect:view?no="+no);
		}
		return mav;
	}
}
