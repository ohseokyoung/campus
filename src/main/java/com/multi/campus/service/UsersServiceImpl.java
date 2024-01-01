package com.multi.campus.service;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.multi.campus.mapper.UsersMapper;
import com.multi.campus.vo.UsersVO;
@Repository
@Service
public class UsersServiceImpl implements UsersService {
	@Inject
	UsersMapper mapper;
	
	@Override
	public int idCheck(String userid) {
		return mapper.idCheck(userid);
	}

	@Override
	public int usersInsert(UsersVO vo) {
		return mapper.usersInsert(vo);
	}

	@Override
	public UsersVO loginSelect(String userid, String userpwd) {
		return mapper.loginSelect(userid, userpwd);
	}

	@Override
	public int userUpdate(UsersVO vo) {
		
		return mapper.userUpdate(vo);
	}

	@Override
	public UsersVO userSelect(String userid) {
		
		return mapper.userSelect(userid);
	}

	@Override
	public List<UsersVO> userList() {
		
		return mapper.userList();
	}

	@Override
	public List<UsersVO> todaySignup(LocalDate date) {

		return mapper.todaySignup(date);
	}

	@Override
	public List<UsersVO> monthSignup() {
		
		return mapper.monthSignup();
	}

	@Override
	public List<UsersVO> monthSignupPrevious() {

		return mapper.monthSignupPrevious();
	}

	@Override
	public int userDelete(String userid) {
		
		return mapper.userDelete(userid);
	}

	@Override
	public int userManager(String userid) {
		
		return mapper.userManager(userid);
	}

	

}
