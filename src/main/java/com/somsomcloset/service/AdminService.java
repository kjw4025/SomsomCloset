package com.somsomcloset.service;

import java.util.List;

import com.somsomcloset.model.AttachImageVO;
import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.CateVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.OrderDTO;
import com.somsomcloset.model.ProductVO;

public interface AdminService {
	
	public void productEnroll(ProductVO product);
	public void auctionEnroll(AuctionVO auction);
	public void groupProductEnroll(GroupProductVO groupProduct);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/* 상품 리스트 */
	public List<ProductVO> goodsGetList(Criteria cri);
	
	/* 경매 리스트 */
	public List<AuctionVO> auctionGetList(Criteria cri);
	
	/* 공구 리스트 */
	public List<GroupProductVO> groupProductGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);	
	
	/* 경매 상품 총 개수 */
	public int auctionGetTotal(Criteria cri);
	
	/* 공구 상품 총 개수 */
	public int groupProductGetTotal(Criteria cri);
	
	/* 상품 조회 페이지 */
	public ProductVO goodsGetDetail(int productId);	
	
	/* 경매 상품 조회 페이지 */
	public AuctionVO auctionGoodsGetDetail(int auctionId);
	
	/* 공구 상품 조회 페이지 */
	public GroupProductVO groupProductGetDetail(int groupProductId);
	
	/* 상품 수정 */
	public int goodsModify(ProductVO vo);	
	
	/* 경매 상품 수정 */
	public int auctionGoodsModify(AuctionVO vo);
	
	/* 상품 정보 삭제 */
	public int goodsDelete(int productId);		
	
	/* 경매 상품 정보 삭제 */		
	public int auctionGoodsDelete(int auctionId);
	
	/* 공구 상품 정보 삭제 */		
	public int groupProductDelete(int groupProductId);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int productId);	
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);		
	
}
