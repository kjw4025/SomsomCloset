package com.somsomcloset.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsomcloset.mapper.AdminMapper;
import com.somsomcloset.mapper.AttachMapper;
import com.somsomcloset.mapper.ProductMapper;
import com.somsomcloset.model.AttachImageVO;
import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.CateFilterDTO;
import com.somsomcloset.model.CateVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.ProductVO;
import com.somsomcloset.model.SelectDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService{

   @Autowired
   private ProductMapper productMapper;
   
   @Autowired
   private AttachMapper attachMapper;
   
   @Autowired
   private AdminMapper adminMapper;   
   
   /* 상품 검색 */
   @Override
   public List<ProductVO> getGoodsList(Criteria cri) {
      
      String type = cri.getType();
      String[] typeArr = type.split("");
      
      List<ProductVO> list = productMapper.getGoodsList(cri);
     
      list.forEach(product -> {
         
         int productId = product.getProductId();
         
         List<AttachImageVO> imageList = attachMapper.getAttachList(productId);
         
         product.setImageList(imageList);
         
      });
      
      return list;
   }
   
   //경매 상품 리스트
   @Override
   public List<AuctionVO> getAuctionGoodsList(Criteria cri) {
	   String type = cri.getType();
	      String[] typeArr = type.split("");
	      
	      List<AuctionVO> list = productMapper.getAuctionGoodsList(cri);
	    
	      list.forEach(auction -> {
	         
	         int auctionId = auction.getAuctionId();
	         
	         List<AttachImageVO> imageList = attachMapper.getAttachList(auctionId);
	         
	         auction.setImageList(imageList);
	         
	      });
	      
	      return list;
   }

   /* 공동구매 리스트 */
   @Override
   public List<GroupProductVO> getGroupProductGoodsList(Criteria cri) {
	   String type = cri.getType();
	      String[] typeArr = type.split("");
	      
	      List<GroupProductVO> list = productMapper.getGroupProductGoodsList(cri);
	     
	      list.forEach(groupProduct -> {
	         
	         int groupProductId = groupProduct.getGroupProductId();
	         
	         List<AttachImageVO> imageList = attachMapper.getAttachList(groupProductId);
	         
	         groupProduct.setImageList(imageList);
	         
	      });
	      
	      return list;
   }
   /* 사품 총 갯수 */
   @Override
   public int goodsGetTotal(Criteria cri) {
      
      return productMapper.goodsGetTotal(cri);
      
   }   
   
   /* 검색결과 카테고리 필터 정보 */
   @Override
   public List<CateFilterDTO> getCateInfoList(Criteria cri) {

      List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();
      
      String[] typeArr = cri.getType().split("");
      
      return filterInfoList;
   }      
   
   /* 상품 정보 */
   @Override
   public ProductVO getGoodsInfo(int productId) {
      
      ProductVO goodsInfo = productMapper.getGoodsInfo(productId);
      goodsInfo.setImageList(adminMapper.getAttachInfo(productId));
      
      
      return goodsInfo;
   }      
   
   //경매 정보
   @Override
	public AuctionVO getAuctionGoodsInfo(int auctionId) {
		AuctionVO goodsInfo = productMapper.getAuctionGoodsInfo(auctionId);
	    goodsInfo.setImageList(adminMapper.getAttachInfo(auctionId));
	    
	    
	    return goodsInfo;
	}
   
   
   //공구 정보
	@Override
	public GroupProductVO getGroupProductInfo(int groupProductId) {
		GroupProductVO goodsInfo = productMapper.getGroupProductInfo(groupProductId);
	    goodsInfo.setImageList(adminMapper.getAttachInfo(groupProductId));
	    
	    
	    return goodsInfo;
	}
	
   @Override
   public ProductVO getProductIdName(int productId) {
      
      return productMapper.getProductIdName(productId);
   }


	
	//경매 업데이트
	@Override
	public int auctionCkUpdate(AuctionVO vo) {
		int result = productMapper.auctionCkUpdate(vo);
		
		return result;
	}
	@Override
	public int auctionUpdate(AuctionVO vo) {
		int result = productMapper.auctionUpdate(vo);
		/* */
		return result;
	}
	
	//공구 업데이트
	@Override
	public int groupProductCkUpdate(GroupProductVO vo) {
		int result = productMapper.groupProductCkUpdate(vo);
		
		return result;
	}
	@Override
	public int groupProductUpdate(GroupProductVO vo) {
		int result = productMapper.groupProductUpdate(vo);
		/* */
		return result;
	}

	
     
   
}