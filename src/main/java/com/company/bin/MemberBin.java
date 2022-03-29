package com.company.bin;

import java.sql.Date;

public class MemberBin {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String address;
	private Date reg;
	private String nAd;
	private String dAd;
	private String grade;
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getReg() {
		return reg;
	}
	public void setReg(Date reg) {
		this.reg = reg;
	}
	public String getnAd() {
		return nAd;
	}
	public void setnAd(String nAd) {
		this.nAd = nAd;
	}
	public String getdAd() {
		return dAd;
	}
	public void setdAd(String dAd) {
		this.dAd = dAd;
	}
}
