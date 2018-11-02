package com.goodz.entity;

public class Cata
{
	Integer c_id;
	String c_name;
	public Cata() {
		super();
	}
	public Cata(Integer c_id, String c_name) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
	}
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	@Override
	public String toString() {
		return "Cata [c_id=" + c_id + ", c_name=" + c_name + "]";
	}
}
