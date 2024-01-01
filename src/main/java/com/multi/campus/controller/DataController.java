package com.multi.campus.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.swing.Renderer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web .bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.multi.campus.service.DataService;
import com.multi.campus.vo.DataVO;
import com.multi.campus.vo.DatafileVO;

@Controller
@RequestMapping("/data")
public class DataController {
	@Autowired
	DataService service;
	
	//�ڷ�� ���
	@GetMapping("/list")
	public String dataList(Model model) {
		model.addAttribute("list",service.dataList());
		return "data/dataList";
	}
	//�ڷ�� �۵�� ��
	@GetMapping("/write")
	public String dataWrite() {
		return "data/dataWrite";
	}
	//�ڷ�� �۵��(DB)
	@PostMapping("/writeOk")
	@Transactional(rollbackFor={RuntimeException.class, SQLException.class})
	public ModelAndView dataWriteOk(DataVO vo, HttpSession session, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		
		vo.setUserid((String)session.getAttribute("logId"));
		
		
		String path=session.getServletContext().getRealPath("/uploadfile");
		System.out.println("path->"+path);
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)request;
		
		List<MultipartFile> filesList=mr.getFiles("filename");
		
		
		List<DatafileVO> uploadFileList=new ArrayList<DatafileVO>();
		
		if(filesList != null){
			for(int i=0;i<filesList.size();i++) {
				MultipartFile mf=filesList.get(i);
				
				String orgFilename = mf.getOriginalFilename();
				
				if(orgFilename!=null&&  !orgFilename.equals("")) {
					
					File f=new File(path,orgFilename);
					
					if(f.exists()) {
						
						for(int renameNum=1;;renameNum++) {
							//Ȯ���ڿ� ���ϸ� �и�
							int point = orgFilename.lastIndexOf(".");
							String filenameNoExt=orgFilename.substring(0,point);
							String ext=orgFilename.substring(point+1);
							
							//���ο� ���ϸ� �����
							String newFilename=filenameNoExt+"("+renameNum+")."+ext;//car(1).jpg
							f=new File(path,newFilename);
							if(!f.exists()) {
								orgFilename = newFilename;
								break;
							}
						}
							
					}
					
					//���ε�
					try {
						mf.transferTo(f);
					}catch (Exception e) {}
					
					
					DatafileVO fVO=new DatafileVO();
					fVO.setFilename(orgFilename);
					uploadFileList.add(fVO);
				}
			}
		}
		
		try {
			
			int result = service.dataInsert(vo);
			System.out.println(vo.getNo());
			
			for(DatafileVO fVO:uploadFileList) {
				fVO.setNo(vo.getNo());
				
			}
			int fileResult=service.datafileInsert(uploadFileList );
			
			
			mav.setViewName("redirect:list");
		}catch (Exception e) {
			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
			for(DatafileVO fVO: uploadFileList) {
				File f=new File(path,fVO.getFilename());
				f.delete();
			}
			
			mav.setViewName("data/dataResult");
		}
		
		return mav;
	}
	//�۳��� ����
	@GetMapping("/view/{no}")
	public ModelAndView dataView(@PathVariable("no") int no) {
		
		service.dataHitCount(no);
		
		DataVO vo=service.dataSelect(no);
		
		List<DatafileVO> fileList=service.getDataFile(no);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("fileList",fileList);
		mav.setViewName("data/dataView");
		
		return mav;
	}
	//�� ������
	@GetMapping("/edit/{no}")
	public ModelAndView dataEdit(@PathVariable("no") int no) {
		ModelAndView mav= new ModelAndView();
		
		
		mav.addObject("vo",service.dataSelect(no));
		
		List<DatafileVO> fList=service.getDataFile(no);
		mav.addObject("fList",fList);
		mav.addObject("fileCount",fList.size());
		
		
		mav.setViewName("data/dataEdit");
		return mav;
	}
	//�ڷ�� �ۼ���(DB)
	@PostMapping("/editOk")
	@Transactional(rollbackFor = {RuntimeException.class,SQLException.class})
								
	public ModelAndView dataEditOk(DataVO vo, HttpServletRequest request) {
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		

		List<DatafileVO> dbFileList = service.getDataFile(vo.getNo());//(17,m01.gif), (17,m02.gif), (17,m03.gif)
		
		//���� ���ε�� ���� ó��
		String path=request.getSession().getServletContext().getRealPath("/uploadfile");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		List<MultipartFile> mrFileList = mr.getFiles("filename");
		
		//���� �߰��� ���ϸ��
		List<DatafileVO> newFileList= fileUpload(path,mrFileList);//(0,car.jpg),(0,car2.jpg)//���ڸ� �ٲٰ� dbFileList�� ��ģ��.
		
		//�����ͺ��̽� �۾�
		ModelAndView mav = new ModelAndView();
		try {
		
			if(vo.getDelFile()!=null && vo.getDelFile().size()>0) {
				for(int i=0;i<vo.getDelFile().size();i++) {
					String del=vo.getDelFile().get(i);
					for(int j=0;j<dbFileList.size();j++) {
						DatafileVO dfVO=dbFileList.get(j);
						if(del.equals(dfVO.getFilename())) {
							dbFileList.remove(j);
							j--;
						}
					}
				}
			}
			
	
			if(newFileList.size()>0) {
				for(DatafileVO dfVO:newFileList) {
					dfVO.setNo(vo.getNo());
					dbFileList.add(dfVO);
				}
			}
			
			
			
			//����÷������(DB) �����
			int delResult = service.dataDelete(vo.getNo());
			
			//÷������(DB) �߰�
			int insertResult=service.datafileInsert(dbFileList);
			
			//���۾�����Ʈ
			int result =service.dataUpdate(vo);
			
			//������ ������ ����
			if(vo.getDelFile()!=null&&vo.getDelFile().size()>0) {
				for(String delFileName :vo.getDelFile()) {
					File f=new File(path,delFileName);
					f.delete();
				}
			}
		
			mav.setViewName("redirect:view/"+vo.getNo());
			
		}catch (Exception e) {
			e.printStackTrace();
			
			//�����ͺ��̽� ������ �ѹ�(rollback)
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			//���ξ��ε��� ���������
			for(DatafileVO dfVO:newFileList) {
				File f=new File(path,dfVO.getFilename());
				f.delete();
			}
			
			mav.setViewName("data/dataResult");
		}
		return mav;
	}
	//�ڷ�� ����
	@GetMapping("/del/{no}")
	@Transactional(rollbackFor = {RuntimeException.class, SQLException.class})
	public ModelAndView dataDelete(@PathVariable("no") int no, HttpSession session) {
		String path=session.getServletContext().getRealPath("/uploadfile");
		ModelAndView mav=new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		try {
			
			List<DatafileVO> fileList = service.getDataFile(no);
			
			int result =service.dataRecordDelete(no,userid);
			
			for(DatafileVO vo: fileList) {
				File f=new File(path,vo.getFilename());
				f.delete();
			}
			mav.setViewName("redirect:/data/list");
		}catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			mav.setViewName("redirect:/data/view/"+no);
			
		}
		return mav;
	}
	
	//���� ���ε� ����
	public List<DatafileVO> fileUpload(String path,List<MultipartFile> filesList) {
		
		List<DatafileVO> uploadFileList=new ArrayList<DatafileVO>();
		
		if(filesList != null){
			for(int i=0;i<filesList.size();i++) {
				MultipartFile mf=filesList.get(i);
				
				String orgFilename = mf.getOriginalFilename();
				
				if(orgFilename!=null&&  !orgFilename.equals("")) {
					
					File f=new File(path,orgFilename);
					
					if(f.exists()) {
						
						for(int renameNum=1;;renameNum++) {
							//Ȯ���ڿ� ���ϸ� �и�
							int point = orgFilename.lastIndexOf(".");
							String filenameNoExt=orgFilename.substring(0,point);
							String ext=orgFilename.substring(point+1);
							
							//���ο� ���ϸ� �����
							String newFilename=filenameNoExt+"("+renameNum+")."+ext;
							f=new File(path,newFilename);
							if(!f.exists()) {
								orgFilename = newFilename;
								break;
							}
						}
							
					}
					
					//���ε�
					try {
						mf.transferTo(f);
					}catch (Exception e) {}
					
					DatafileVO fVO=new DatafileVO();
					fVO.setFilename(orgFilename);
					uploadFileList.add(fVO);
				}
			}
		}
		return uploadFileList;
	}
}
