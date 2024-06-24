package com.somsomcloset.service;

import java.util.List;

import com.somsomcloset.model.OrderCancelDTO;
import com.somsomcloset.model.OrderDTO;
import com.somsomcloset.model.OrderPageItemDTO;

public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);	
	
	/* 공구 주문 정보 */
	public List<OrderPageItemDTO> getGroupGoodsInfo(List<OrderPageItemDTO> orders);	
	
	/* 주문 */
	public void  order(OrderDTO orw);	
	
	/* 주문 */
	public void  groupOrder(OrderDTO orw);
	
	/* 주문 취소 */
	public void orderCancle(OrderCancelDTO dto);


	
	
}
