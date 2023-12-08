package com.entity;

import java.sql.Blob;

public class product_entity {
	
private  int id;
private String  product_namel;
private String description ;
private String price;
private Blob image;
private double price2;
private int quantity;
public double getPrice2() {
	return price2;
}
public void setPrice2(double price2) {
	this.price2 = price2;
}
public Blob getImage() {
	return image;
}
public void setImage(Blob image) {
	this.image = image;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getProduct_namel() {
	return product_namel;
}
public void setProduct_namel(String product_namel) {
	this.product_namel = product_namel;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public void setQuantity(int i) {
	// TODO Auto-generated method stub
	this.quantity=i;
	
	
	
}
public double getQuantity() {
	// TODO Auto-generated method stub
	return quantity;
}

	

}
