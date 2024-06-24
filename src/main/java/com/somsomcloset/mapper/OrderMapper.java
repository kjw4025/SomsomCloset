package com.somsomcloset.mapper;

import java.util.List;

import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.OrderDTO;
import com.somsomcloset.model.OrderItemDTO;
import com.somsomcloset.model.OrderPageItemDTO;
import com.somsomcloset.model.ProductVO;

public interface OrderMapper {

	/* 주문 상품 정보(주문 페이지) */	
	public OrderPageItemDTO getGoodsInfo(int productId);	
	
	/* 공구 주문 상품 정보(주문 페이지) */	
	public OrderPageItemDTO getGroupGoodsInfo(int productId);	
	
	/* 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getOrderInfo(int productId);
	
	/* 공구 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getGroupOrderInfo(int productId);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);	

	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	
	/* 주문 아이템 테이블 등록 */
	public int enrollGroupOrderItem(OrderItemDTO orid);
	
	/* 주문 금액 차감 */
	public int deductMoney(MemberVO member);	
	
	/* 주문 재고 차감 */
	public int deductStock(ProductVO product);	
	
	/* 주문 재고 차감 */
	public int deductGroupStock(GroupProductVO product);
	
	/* 주문 취소 */
	public int orderCancle(String orderId);
	
	/* 주문 상품 정보(주문취소) */
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	/* 주문 정보(주문취소) */
	public OrderDTO getOrder(String orderId);
	
	
}
