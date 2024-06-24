package com.somsomcloset.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somsomcloset.mapper.AdminMapper;
import com.somsomcloset.model.AttachImageVO;
import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.CateVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.OrderDTO;
import com.somsomcloset.model.ProductVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;	
	
	/* 공구 상품 등록 */
	@Override
	public void groupProductEnroll(GroupProductVO groupProduct) {
		// TODO Auto-generated method stub
		adminMapper.groupProductEnroll(groupProduct);
		System.out.println("groupProductEnroll impl ; " + groupProduct);
	}
	
	/* 경매 상품 등록 */
	@Transactional
	@Override
	public void auctionEnroll(AuctionVO auction) {
		
		
		adminMapper.auctionEnroll(auction);
		System.out.println("auctionEnroll impl ; " + auction);
		
		
	}
	/* 상품 등록 */
	@Transactional
	@Override
	public void productEnroll(ProductVO product) {
		
		adminMapper.productEnroll(product);
		
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		
		product.getImageList().forEach(attach ->{
			
			attach.setProductId(product.getProductId());
			adminMapper.imageEnroll(attach);
			
		});
		
		
	}

	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		return adminMapper.cateList();
	}

	/* 상품 리스트 */
	@Override
	public List<ProductVO> goodsGetList(Criteria cri) {
		
		//log.info("goodsGetTotalList()..........");
		
		return adminMapper.goodsGetList(cri);
	}
	
	/* 경매 상품 리스트 */
	@Override
	public List<AuctionVO> auctionGetList(Criteria cri) {
		
		//log.info("goodsGetTotalList()..........");
		
		return adminMapper.auctionGetList(cri);
	}
	
	/* 공구 상품 리스트 */
	@Override
	public List<GroupProductVO> groupProductGetList(Criteria cri) {
		
		//log.info("goodsGetTotalList()..........");
		
		return adminMapper.groupProductGetList(cri);
	}

	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri) {
		
		//log.info("goodsGetTotal().........");
		
		return adminMapper.goodsGetTotal(cri);
	}	
	
	/* 경매 상품 총 갯수 */
	public int auctionGetTotal(Criteria cri) {
		
		//log.info("goodsGetTotal().........");
		
		return adminMapper.auctionGetTotal(cri);
	}
	
	/* 공구 상품 총 갯수 */
	public int groupProductGetTotal(Criteria cri) {
		
		//log.info("goodsGetTotal().........");
		
		return adminMapper.groupProductGetTotal(cri);
	}
	
	/* 상품 조회 페이지 */
	@Override
	public ProductVO goodsGetDetail(int productId) {
		
		return adminMapper.goodsGetDetail(productId);
	}	
	
	/* 경매 상품 조회 페이지 */
	@Override
	public AuctionVO auctionGoodsGetDetail(int auctionId) {
		
		return adminMapper.auctionGoodsGetDetail(auctionId);
	}	
	
	/* 공구 상품 조회 페이지 */
	@Override
	public GroupProductVO groupProductGetDetail(int groupProductId) {
		
		return adminMapper.groupProductGetDetail(groupProductId);
	}
	
	/* 상품 정보 수정 */
	@Transactional
	@Override
	public int goodsModify(ProductVO vo) {

		int result = adminMapper.goodsModify(vo);
		/* */
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminMapper.deleteImageAll(vo.getProductId());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setProductId(vo.getProductId());
				adminMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;
	}	
	
	/* 경매 상품 정보 수정 */
	@Transactional
	@Override
	public int auctionGoodsModify(AuctionVO vo) {

		int result = adminMapper.auctionGoodsModify(vo);
		/* */
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminMapper.deleteImageAll(vo.getAuctionId());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setProductId(vo.getAuctionId());
				adminMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;
	}	
	
	
	/* 상품 정보 삭제 */
	@Override
	@Transactional
	public int goodsDelete(int productId) {

		//log.info("goodsDelete..........");
		
		adminMapper.deleteImageAll(productId);			
		
		return adminMapper.goodsDelete(productId);
	}		
	
	
	/* 경매 상품 정보 삭제 */
	@Override
	@Transactional
	public int auctionGoodsDelete(int auctionId) {

		//log.info("goodsDelete..........");
		
		adminMapper.deleteImageAll(auctionId);			
		
		return adminMapper.auctionGoodsDelete(auctionId);
	}	
	
	/* 공구 상품 정보 삭제 */
	@Override
	@Transactional
	public int groupProductDelete(int groupProductId) {

		//log.info("goodsDelete..........");
		
		adminMapper.deleteImageAll(groupProductId);			
		
		return adminMapper.groupProductDelete(groupProductId);
	}	
	
	
	/* 지정 상품 이미지 정보 얻기 */
	@Override
	public List<AttachImageVO> getAttachInfo(int productId) {
		
		//log.info("getAttachInfo........");
		
		return adminMapper.getAttachInfo(productId);
	}
	
	/* 주문 상품 리스트 */
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return adminMapper.getOrderList(cri);
	}
	
	/* 주문 총 갯수 */
	@Override
	public int getOrderTotal(Criteria cri) {
		return adminMapper.getOrderTotal(cri);
	}
	

		
	
	
}
