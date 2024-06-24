package com.somsomcloset.service;

import java.util.List;

import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.CateFilterDTO;
import com.somsomcloset.model.CateVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.ProductVO;
import com.somsomcloset.model.SelectDTO;

public interface ProductService {

	/* 상품 검색 */
	public List<ProductVO> getGoodsList(Criteria cri); //일반상품
	
	public List<AuctionVO> getAuctionGoodsList(Criteria cri); //경매
	
	public List<GroupProductVO> getGroupProductGoodsList(Criteria cri); //공구
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);	
	
	/* 검색결과 카테고리 필터 정보 */
	public List<CateFilterDTO> getCateInfoList(Criteria cri);
	
	/* 상품 정보 */
	public ProductVO getGoodsInfo(int productId);
	
	//경매 상품 정보
	public AuctionVO getAuctionGoodsInfo(int auctionId);
	
	//공구 상품 정보
	public GroupProductVO getGroupProductInfo(int groupProductId);
	
	/* 상품 id 이름 */
	public ProductVO getProductIdName(int productId);

	//경매 업데이트
	public int auctionUpdate(AuctionVO vo);
	public int auctionCkUpdate(AuctionVO vo);
	
	//공구 업데이트
	public int groupProductUpdate(GroupProductVO vo);
	public int groupProductCkUpdate(GroupProductVO vo);
	
	
}
