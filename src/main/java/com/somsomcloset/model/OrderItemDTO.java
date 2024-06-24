package com.somsomcloset.model;

public class OrderItemDTO {

	private int orderitemId;
	/* 주문 번호 */
	private String orderId;
	
	/* 상품 번호 */
    private int productId;
    
	/* 주문 수량 */
    private int productCount;
    
	/* orderItem 기본키 */
    private int orderItemId;
    
	/* 상품 한 개 가격 */
    private int productPrice;
    
	/* 상품 할인 율 */
    private double productDiscount;
    
	/* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 할인 적용된 가격 */
    private int salePrice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
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

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
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

	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalSavePoint() {
		return totalSavePoint;
	}

	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}

	@Override
	public String toString() {
		return "OrderItemDTO [orderitemId=" + orderitemId + ", orderId=" + orderId + ", productId=" + productId + ", productCount=" + productCount + ", orderItemId="
				+ orderItemId + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount + ", savePoint="
				+ savePoint + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + ", totalSavePoint="
				+ totalSavePoint + "]";
	}
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.productPrice * (1-(this.productDiscount/100)));
		this.totalPrice = this.salePrice*this.productCount;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint * this.productCount;
	}

	public int getOrderitemId() {
		return orderitemId;
	}

	public void setOrderitemId(int orderitemId) {
		this.orderitemId = orderitemId;
	}		
    
    
	
}
