package model.customer;

import javax.persistence.*;

public class ProductsBean {

	private int id;
	
	private String prodName;
	private String prodDesc;
	private String prodPrice;
	private String prodCategory;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdDesc() {
		return prodDesc;
	}
	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}
	public String getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getProdCategory() {
		return prodCategory;
	}
	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}
}
