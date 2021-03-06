package com.you.payment;

import java.sql.Date;

public class PaymentDTO {
	private int pnum;
	private String pid;
	private Date pdate;
	private String pcategory;
	private int pcategorynum;
	private String pcardtype;
	private String pname;
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getPcategory() {
		return pcategory;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public int getPcategorynum() {
		return pcategorynum;
	}
	public void setPcategorynum(int pcategorynum) {
		this.pcategorynum = pcategorynum;
	}
	public String getPcardtype() {
		return pcardtype;
	}
	public void setPcardtype(String pcardtype) {
		this.pcardtype = pcardtype;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
}
