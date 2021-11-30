package com.company.model;

import java.util.Date;

public class ProductVO {
	private String pronum;
	private String proname;
	private String director;
	private String synop;
	private String actor;
	private Date openingdate;
	private int proprice;
	private int procnt;
	private String proimg;
	
	public String getPronum() {
		return pronum;
	}
	public void setPronum(String pronum) {
		this.pronum = pronum;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public int getProprice() {
		return proprice;
	}
	public void setProprice(int proprice) {
		this.proprice = proprice;
	}
	public String getProimg() {
		return proimg;
	}
	public void setProimg(String proimg) {
		this.proimg = proimg;
	}
	public int getProcnt() {
		return procnt;
	}
	public void setProcnt(int procnt) {
		this.procnt = procnt;
	}
	
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getSynop() {
		return synop;
	}
	public void setSynop(String synop) {
		this.synop = synop;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public Date getOpeningdate() {
		return openingdate;
	}
	public void setOpeningdate(Date openingdate) {
		this.openingdate = openingdate;
	}
}