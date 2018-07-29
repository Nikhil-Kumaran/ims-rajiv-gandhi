package adminoperations.items;

import java.io.Serializable;

public class ItemsFormBean implements Serializable{
	private int item_id=0;
	
	private String type_category_id=null;
	private String category_id=null;
	private String product_name=null;
	private String product_brand=null;
	private String unit=null;
	private float price=0;
	private int stock=0;
	private int updated_stock=0;
	private String search_category=null;
	private String search_name=null;
	private String supplier=null;
	
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getSearch_name() {
		return search_name;
	}
	public void setSearch_name(String search_name) {
		this.search_name = search_name;
	}
	public String getSearch_category() {
		return search_category;
	}
	public void setSearch_category(String search_category) {
		this.search_category = search_category;
	}
	
	public String getType_category_id() {
		return type_category_id;
	}
	public void setType_category_id(String type_category_id) {
		this.type_category_id = type_category_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public int getUpdated_stock() {
		return updated_stock;
	}
	public void setUpdated_stock(int updated_stock) {
		this.updated_stock = updated_stock;
	}
	
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	
	
}