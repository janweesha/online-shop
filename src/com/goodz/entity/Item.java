package com.goodz.entity;

import java.util.Date;

public class Item {
/**
 * i_id int(5) primary key,
	i_name varchar(100) not null,
	c_id int(5) not null,
	u_id int(5) not null,
	i_num int(80) not null,
	i_price double,
	i_img varchar(200),
	i_date date,
	i_state int(1)
 */
	Integer i_id;
	String i_name;
	Integer c_id;
	Integer u_id;
	Integer i_num;
	Double i_price;
	String i_img;
	Date i_date;
	Integer i_state;
	public Item() {
		super();
	}
	public Item(Integer i_id, String i_name, Integer c_id, Integer u_id) {
		super();
		this.i_id = i_id;
		this.i_name = i_name;
		this.c_id = c_id;
		this.u_id = u_id;
	}
	public Item(Integer i_id, String i_name, Integer c_id, Integer u_id,
			Date i_date) {
		super();
		this.i_id = i_id;
		this.i_name = i_name;
		this.c_id = c_id;
		this.u_id = u_id;
		this.i_date = i_date;
	}
	public Item(Integer i_id, String i_name, Integer c_id, Integer u_id,
			Integer i_num, Double i_price, String i_img, Date i_date,
			Integer i_state) {
		super();
		this.i_id = i_id;
		this.i_name = i_name;
		this.c_id = c_id;
		this.u_id = u_id;
		this.i_num = i_num;
		this.i_price = i_price;
		this.i_img = i_img;
		this.i_date = i_date;
		this.i_state = i_state;
	}
	public Integer getI_id() {
		return i_id;
	}
	public void setI_id(Integer i_id) {
		this.i_id = i_id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Integer getI_num() {
		return i_num;
	}
	public void setI_num(Integer i_num) {
		this.i_num = i_num;
	}
	public Double getI_price() {
		return i_price;
	}
	public void setI_price(Double i_price) {
		this.i_price = i_price;
	}
	public String getI_img() {
		return i_img;
	}
	public void setI_img(String i_img) {
		this.i_img = i_img;
	}
	public Date getI_date() {
		return i_date;
	}
	public void setI_date(Date i_date) {
		this.i_date = i_date;
	}
	public Integer getI_state() {
		return i_state;
	}
	public void setI_state(Integer i_state) {
		this.i_state = i_state;
	}
	@Override
	public String toString() {
		return "Item [i_id=" + i_id + ", i_name=" + i_name + ", c_id=" + c_id
				+ ", u_id=" + u_id + ", i_num=" + i_num + ", i_price="
				+ i_price + ", i_img=" + i_img + ", i_date=" + i_date
				+ ", i_state=" + i_state + "]";
	}
	
}
