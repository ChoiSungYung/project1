package com.company.model;

import java.util.Date;

public class GalleryVO {
	private String g_id;
	private String g_name;
	private String g_img;
	private String g_content;
	private Date resdate;
	
	public String getG_id() {
		return g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}
	public String getG_img() {
		return g_img;
	}
	public void setG_img(String g_img) {
		this.g_img = g_img;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public Date getResdate() {
		return resdate;
	}
	public void setResdate(Date resdate) {
		this.resdate = resdate;
	}

}