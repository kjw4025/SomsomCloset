package com.somsomcloset.mapper;

import java.util.List;

import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.CateFilterDTO;
import com.somsomcloset.model.CateVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.ProductVO;
import com.somsomcloset.model.SelectDTO;

public interface ProductMapper {

	/* 상품 검색 */
	public List<ProductVO> getGoodsList(Criteria cri);
	
	//경매 리스트
	public List<AuctionVO> getAuctionGoodsList(Criteria cri);
			
	//공동구매 리스트
	public List<GroupProductVO> getGroupProductGoodsList(Criteria cri);
		
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);		
	
	/* 상품 검색 */
	public List<AuctionVO> getAuctionList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int auctionGetTotal(Criteria cri);			
	
	public String[] getGoodsIdList(String keyword);
	
	/* 검색 대상 카테고리 리스트 */
	public String[] getCateList(Criteria cri);
	
	/* 카테고리 정보(+검색대상 갯수) */
	public CateFilterDTO getCateInfo(Criteria cri);	
	
	/* 상품 정보 */
	public ProductVO getGoodsInfo(int productId);	
	
	//경매 상품 정보
	public AuctionVO getAuctionGoodsInfo(int auctionId);
	
	//공구 상품 정보
	public GroupProductVO getGroupProductInfo(int groupProductId);
	
	/* 상품 id 이름 */
	public ProductVO getProductIdName(int productId);	
	
	/* 평줌순 상품 정보 */
	public List<SelectDTO> likeSelect();

	//경매 업데이트
	public int auctionUpdate(AuctionVO vo);

	public int auctionCkUpdate(AuctionVO vo);
	
	//공구 업데이트
	public int groupProductUpdate(GroupProductVO vo);

	public int groupProductCkUpdate(GroupProductVO vo);
	
	
	
}
