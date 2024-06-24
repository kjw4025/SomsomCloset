package com.somsomcloset.model;

import java.sql.Date;
import java.util.List;

public class ProductVO {
	private int productId;//상품 id
	private String productName;//상품 이름
	private String seller;//판매자 이름
	private String cateName;//카테고리 이름
	private int productPrice;//상품 가격
	private int productStock;//상품 재고
	private int productDiscount;//상품 할인률
	private String productIntro;//상품 소개
	private String productContents;//상품 목차
	private Date regDate;//등록 날짜
	private Date updateDate;//수정 날짜
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public int getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}
	public String getProductIntro() {
		return productIntro;
	}
	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}
	public String getProductContents() {
		return productContents;
	}
	public void setProductContents(String productContents) {
		this.productContents = productContents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	
	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", seller=" + seller
				+", cateName=" + cateName + ", productPrice=" + productPrice
				+ ", productStock=" + productStock + ", productDiscount=" + productDiscount + ", productIntro="
				+ productIntro + ", productContents=" + productContents + ", regDate=" + regDate + ", updateDate="
				+ updateDate + ", imageList=" + imageList + "]";
	}
	
	
	
	
}
