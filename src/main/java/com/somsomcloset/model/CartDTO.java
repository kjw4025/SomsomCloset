package com.somsomcloset.model;

import java.util.List;

public class CartDTO {
	
    private int cartId;
    
    private String memberId;
    
    private int productId;
    
    private int productCount;
    
    private String productName;
    
    private int productPrice;
    
    private double productDiscount;
    
    // 추가
    private int salePrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;  
    
	/* 상품 이미지 */
	private List<AttachImageVO> imageList;	    
    

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public double getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(double productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}	
	
	public int getPoint() {
		return point;
	}

	public int getTotalPoint() {
		return totalPoint;
	}
	
	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}	

	public void initSaleTotal() {
		this.salePrice = (int) (this.productPrice * (1-this.productDiscount/100));
		this.totalPrice = this.salePrice*this.productCount;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point * this.productCount;		
	}

	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", productId=" + productId + ", productCount="
				+ productCount + ", productName=" + productName + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount
				+ ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + ", point=" + point + ", totalPoint="
				+ totalPoint + ", imageList=" + imageList + "]";
	}

	    
	
	
    
}

