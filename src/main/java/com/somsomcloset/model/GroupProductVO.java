package com.somsomcloset.model;

import java.sql.Date;
import java.util.List;

public class GroupProductVO {
	private int groupProductId;
	private String groupProductName; //상품명 
	private String groupProductSeller; //판매자
	private String cateName; //카테고리
	private int groupProductPrice; //상품가격
	private int groupProductStock; // 상품 재고(한정수량)
	private int groupProductDiscount; //상품 할인율
	private String groupProductIntro; //상품 소개
	private String groupProductContents; //상품 내용
	private Date groupProductEndDate; //마감일(Sysdate + 7)
	private int groupProductCK;
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	public int getGroupProductId() {
		return groupProductId;
	}
	public void setGroupProductId(int groupProductId) {
		this.groupProductId = groupProductId;
	}
	public String getGroupProductName() {
		return groupProductName;
	}
	public void setGroupProductName(String groupProductName) {
		this.groupProductName = groupProductName;
	}
	public String getGroupProductSeller() {
		return groupProductSeller;
	}
	public void setGroupProductSeller(String groupProductSeller) {
		this.groupProductSeller = groupProductSeller;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public int getGroupProductPrice() {
		return groupProductPrice;
	}
	public void setGroupProductPrice(int groupProductPrice) {
		this.groupProductPrice = groupProductPrice;
	}
	public int getGroupProductStock() {
		return groupProductStock;
	}
	public void setGroupProductStock(int groupProductStock) {
		this.groupProductStock = groupProductStock;
	}
	public int getGroupProductDiscount() {
		return groupProductDiscount;
	}
	public void setGroupProductDiscount(int groupProductDiscount) {
		this.groupProductDiscount = groupProductDiscount;
	}
	public String getGroupProductIntro() {
		return groupProductIntro;
	}
	public void setGroupProductIntro(String groupProductIntro) {
		this.groupProductIntro = groupProductIntro;
	}
	public String getGroupProductContents() {
		return groupProductContents;
	}
	public void setGroupProductContents(String groupProductContents) {
		this.groupProductContents = groupProductContents;
	}
	public Date getGroupProductEndDate() {
		return groupProductEndDate;
	}
	public void setGroupProductEndDate(Date groupProductEndDate) {
		this.groupProductEndDate = groupProductEndDate;
	}
	
	
	public int getGroupProductCK() {
		return groupProductCK;
	}
	public void setGroupProductCK(int groupProductCK) {
		this.groupProductCK = groupProductCK;
	}
	
	
	public List<AttachImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	@Override
	public String toString() {
		return "GroupProductVO [groupProductId=" + groupProductId + ", groupProductName=" + groupProductName
				+ ", groupProductSeller=" + groupProductSeller + ", cateName=" + cateName + ", groupProductPrice="
				+ groupProductPrice + ", groupProductStock=" + groupProductStock + ", groupProductDiscount="
				+ groupProductDiscount + ", groupProductIntro=" + groupProductIntro + ", groupProductContents="
				+ groupProductContents + ", groupProductEndDate=" + groupProductEndDate + ", groupProductCK="
				+ groupProductCK + "]";
	}
	
	
	
	
	
}
