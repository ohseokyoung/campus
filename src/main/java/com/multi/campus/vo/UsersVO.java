package com.multi.campus.vo;

public class UsersVO {
	private String userid;
	private String userpwd;
	private String username;
	
	private String tel;// 010-1234-5678
	private String tel1;//010
	private String tel2;//1234
	private String tel3;//5678
	
	private String email;
	private String zipcode;
	private String addr;
	private String addrdetail;
	private String writedate;
	private String manager;
	
	@Override
	public String toString() {
		return "UsersVO [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", tel=" + tel
				+ ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", email=" + email + ", zipcode=" + zipcode
				+ ", addr=" + addr + ", addrdetail=" + addrdetail  + ", writedate=" + writedate
				+ "]";
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		tel=tel1+"-"+tel2+"-"+tel3;
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		
		String t[]=tel.split("-");
		tel1=t[0];
		tel2=t[1];
		tel3=t[2];
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}

	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}
	
}
