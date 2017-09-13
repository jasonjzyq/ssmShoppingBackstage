package org.lanqiao.entity;

public class Product {
	private Integer productId;

	private String productName;

	private Float price;

	private String describe;

	private Integer inventory;

	private String productPic;

	// private Integer typeId;
	private Type type;

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName == null ? null : productName.trim();
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe == null ? null : describe.trim();
	}

	public Integer getInventory() {
		return inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public String getProductPic() {
		return productPic;
	}

	public void setProductPic(String productPic) {
		this.productPic = productPic == null ? null : productPic.trim();
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	// public Integer getTypeId() {
	// return typeId;
	// }
	//
	// public void setTypeId(Integer typeId) {
	// this.typeId = typeId;
	// }
}