package com.entity;

public class order extends product_entity{
	
	private int order;
	private int uid;
	private int quantity;
	private String date; 
	
	
	public order() {
		
		
	}


	public order(int order, int uid, int quantity, String date) {
		super();
		this.order = order;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
	}


	public order(int uid, int quantity, String date) {
		super();
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
	}


	public int getOrder() {
		return order;
	}


	public void setOrder(int order) {
		this.order = order;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}
	
}
