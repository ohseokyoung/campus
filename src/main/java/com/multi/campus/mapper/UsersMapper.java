package com.multi.campus.mapper;

import java.time.LocalDate;
import java.util.List;


import com.multi.campus.vo.UsersVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UsersMapper {
	public int idCheck(String userid);
	public int usersInsert(UsersVO vo);
	public UsersVO loginSelect(String userid, String userpwd);
	public int userUpdate(UsersVO vo);
	public UsersVO userSelect(String userid);
	
	public List<UsersVO> userList();
    public List<UsersVO> todaySignup(LocalDate date);
    public List<UsersVO> monthSignup();
    public List<UsersVO> monthSignupPrevious();
    public int userDelete(String userid);
    public int userManager(String userid);

}
