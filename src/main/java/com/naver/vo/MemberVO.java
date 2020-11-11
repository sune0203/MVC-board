package com.naver.vo;

import java.util.Date;

public class MemberVO {
	private int num;
	private String email;
	private String pw;
	private String name;
	private String tel;
	private Date regdate;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [num=" + num + "email=" + email + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", regdate="
				+ regdate + "]";
	}
	
}