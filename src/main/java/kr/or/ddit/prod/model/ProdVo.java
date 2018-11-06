package kr.or.ddit.prod.model;

import java.util.Date;

public class ProdVo {
	String prod_id      ;
	String prod_name    ;
	String lprod_nm     ;
	Date prod_insdate ;
	String buyer_name   ;
	String buyer_mail  ;
	
	ProdVo(){}
	
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getLprod_nm() {
		return lprod_nm;
	}
	public void setLprod_nm(String lprod_nm) {
		this.lprod_nm = lprod_nm;
	}
	
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_mail() {
		return buyer_mail;
	}

	public void setBuyer_mail(String buyer_mail) {
		this.buyer_mail = buyer_mail;
	}

	public Date getProd_insdate() {
		return prod_insdate;
	}

	public void setProd_insdate(Date prod_insdate) {
		this.prod_insdate = prod_insdate;
	}

	@Override
	public String toString() {
		return "ProdVo [prod_id=" + prod_id + ", prod_name=" + prod_name
				+ ", lprod_nm=" + lprod_nm + ", buyer_name=" + buyer_name
				+ ", buyer_mail=" + buyer_mail + "]";
	}

	
}
