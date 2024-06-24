package com.somsomcloset.model;

import java.sql.Date;
import java.util.List;

public class AuctionVO {
	private int auctionId;//경매 id
	private String productName;
	private int productPrice;//상품 가격
	private Date endDate; //경매 종료 날자
	private int highPrice;
	private String memberId; //낙찰자
	private int auctionCk; //낙찰 완료 여부
	
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	public int getAuctionId() {
		return auctionId;
	}
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
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
	public Date getendDate() {
		return endDate;
	}
	public void setendDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getHighPrice() {
		return highPrice;
	}
	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getAuctionCk() {
		return auctionCk;
	}
	public void setAuctionCk(int auctionCk) {
		this.auctionCk = auctionCk;
	}
	
	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	@Override
	public String toString() {
		return "AuctionVO [auctionId=" + auctionId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", endDate=" + endDate + ", highPrice=" + highPrice + ", memberId=" + memberId
				+ ", auctionCk=" + auctionCk + "]";
	}
	
	
	
}
