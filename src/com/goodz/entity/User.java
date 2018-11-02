package com.goodz.entity;

import com.goodz.utils.UUIDUtils;

public class User {
	private Integer u_id;
	private String u_name;
	private String u_pwd;
	private String u_head="resources/img/head/head_1.jpg";
	private String u_mail;
	private String u_tel;
	private String u_gender;
	private Integer u_state;
	private String u_code=UUIDUtils.getUUID();
	public User() {
		super();
	}
	public User(Integer u_id, String u_name, String u_pwd) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pwd = u_pwd;
	}
	
	public User(Integer u_id, String u_name, String u_pwd,String u_head) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pwd = u_pwd;
		this.u_head=u_head;
	}
	
	public User(Integer u_id, String u_name, String u_pwd, String u_head,
			String u_mail) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pwd = u_pwd;
		this.u_head = u_head;
		this.u_mail = u_mail;
	}
	public User(Integer u_id, String u_name, String u_pwd, String u_mail,
			String u_tel, String u_gender, Integer u_state, String u_code) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pwd = u_pwd;
		this.u_mail = u_mail;
		this.u_tel = u_tel;
		this.u_gender = u_gender;
		this.u_state = u_state;
		this.u_code = u_code;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_mail() {
		return u_mail;
	}
	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	public Integer getU_state() {
		return u_state;
	}
	public void setU_state(Integer u_state) {
		this.u_state = u_state;
	}
	public String getU_code() {
		return u_code;
	}
	public void setU_code(String u_code) {
		this.u_code = u_code;
	}
	
	public String getU_head() {
		return u_head;
	}
	public void setU_head(String u_head) {
		this.u_head = u_head;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_name=" + u_name + ", u_pwd=" + u_pwd
				+ ", u_head=" + u_head + ", u_mail=" + u_mail + ", u_tel="
				+ u_tel + ", u_gender=" + u_gender + ", u_state=" + u_state
				+ ", u_code=" + u_code + "]";
	}
}
