package com.somsomcloset.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.somsomcloset.mapper.AttachMapper;
import com.somsomcloset.model.AttachImageVO;
import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.PageDTO;
import com.somsomcloset.model.ProductVO;
import com.somsomcloset.model.ReplyDTO;
import com.somsomcloset.service.AdminService;
import com.somsomcloset.service.AttachService;
import com.somsomcloset.service.MemberService;
import com.somsomcloset.service.ProductService;
import com.somsomcloset.service.ReplyService;

@Controller
public class ProductController {

   private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
         
   @Autowired
   private AttachService attachService;
   
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private AdminService adminService;
   
   @Autowired
   private ProductService productService;
   
   @Autowired
   private ReplyService replyService;   
   
   @Autowired
   private AttachMapper attachMapper;
   
   //메인 페이지 이동
   @RequestMapping(value="/main", method = RequestMethod.GET)
   public void mainPageGET(Model model, HttpServletRequest request) throws Exception {
      
      logger.info("메인 페이지 진입");
      
   }
   
   
   /* 이미지 출력 */
   @GetMapping("/display")
   public ResponseEntity<byte[]> getImage(String fileName){
      
      logger.info("getImage()........" + fileName);
      
      File file = new File("c:\\upload\\" + fileName);
      
      ResponseEntity<byte[]> result = null;
      
      try {
         
         HttpHeaders header = new HttpHeaders();
         
         header.add("Content-type", Files.probeContentType(file.toPath()));
         
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
         
      }catch (IOException e) {
         e.printStackTrace();
      }
      
      return result;
      
   }
   
   
   /* 이미지 정보 반환 */
   @GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public ResponseEntity<List<AttachImageVO>> getAttachList(int productId){
      
      logger.info("getAttachList.........." + productId);
      
      return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(productId), HttpStatus.OK);
      
   }
   
   /* 상품 검색 */
   @GetMapping("/search")
   public String searchGoodsGET(Criteria cri, Model model, AuctionVO vo) {
      
      logger.info("cri : " + cri);
      if(cri.getType().equals("T")) {
    	  List<ProductVO> list = productService.getGoodsList(cri);
	      if(!list.isEmpty()) {
	         model.addAttribute("list", list);
	      } else {
	         model.addAttribute("listcheck", "empty");
	         
	         return "search";
	      }
	      model.addAttribute("pageMaker", new PageDTO(cri, productService.goodsGetTotal(cri)));
	      return "search";
      }
      if(cri.getCateName().equals("경매")) {
    	  
    	  logger.info("경매카테고리검색페이지");
    	  List<AuctionVO> list = productService.getAuctionGoodsList(cri);
    	  Date date = new Date();
    	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	  String sysdate = formatter.format(date).toString();
    	  System.out.println(formatter.format(date));
    	  
    	  if(!list.isEmpty()) {
    		  	for(AuctionVO lst: list) {
    		  	    if(lst.getendDate().toString().equals(sysdate)) {
    		  	    	productService.auctionCkUpdate(lst);//update
    		  	    }
    		  	    else {
    		  	    	System.out.println("else : " + lst.getendDate() + "    " + formatter.format(date));
    		  	    }
    		  	}
    		  	
    		  	List<AuctionVO> list2 = productService.getAuctionGoodsList(cri);
    	         model.addAttribute("list", list2);
    	         logger.info("list : " + list);
    	      } else {
    	         model.addAttribute("listcheck", "empty");
    	         
    	         return "auctionsearch";
    	      }
    	  model.addAttribute("pageMaker", new PageDTO(cri, adminService.auctionGetTotal(cri)));
    	  return "auctionsearch";
    	  
      }else if(cri.getCateName().equals("공동구매")) {
    	  
    	  logger.info("공동구매카테고리검색페이지");
    	  List<GroupProductVO> list = productService.getGroupProductGoodsList(cri);
    	  Date date = new Date();
    	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	  String sysdate = formatter.format(date).toString();
    	  System.out.println(formatter.format(date));
    	  
    	  if(!list.isEmpty()) {
    		  	for(GroupProductVO lst: list) {
    		  	    if(lst.getGroupProductEndDate().toString().equals(sysdate)) {
    		  	    	productService.groupProductCkUpdate(lst);//update
    		  	    }
    		  	    else {
    		  	    	System.out.println("else : " + lst.getGroupProductEndDate() + "    " + formatter.format(date));
    		  	    }
    		  	    
    		  	}
    		  	
    		  	List<GroupProductVO> list2 = productService.getGroupProductGoodsList(cri);
    	         model.addAttribute("list", list2);
    	         logger.info("list : " + list);
    	      } else {
    	         model.addAttribute("listcheck", "empty");
    	         
    	         return "groupProductsearch";
    	      }
    	  model.addAttribute("pageMaker", new PageDTO(cri, adminService.groupProductGetTotal(cri)));
    	  return "groupProductsearch";
      }
      else {
	      List<ProductVO> list = productService.getGoodsList(cri);
	      if(!list.isEmpty()) {
	         model.addAttribute("list", list);
	      } else {
	         model.addAttribute("listcheck", "empty");
	         
	         return "search";
	      }
	      model.addAttribute("pageMaker", new PageDTO(cri, productService.goodsGetTotal(cri)));
	      return "search";
      }
      
      
      
   }   
   /*경매 업뎃*/
   @ResponseBody
   @PostMapping("/auctionOrder/{memberId}")
   public String auctionOrderPageGET(AuctionVO vo, RedirectAttributes rttr, Model model, HttpServletRequest request) {
		
	  
	   String memberId = vo.getMemberId();
	   int highPrice = vo.getHighPrice();
	   int auctionId = vo.getAuctionId();	   
	   System.out.println("입찰" + memberId + highPrice + auctionId);
	   HttpSession session = request.getSession();
	   MemberVO mvo = (MemberVO)session.getAttribute("member");
		int result = productService.auctionUpdate(vo);
		
		rttr.addFlashAttribute("update_result", result);
		
		return "redirect:/auctionGoodsDetail";
	}
   /* 상품 상세 */
   @GetMapping("/goodsDetail/{productId}")
	public String goodsDetailGET(@PathVariable("productId")int productId, Model model) {
	
	    	  model.addAttribute("goodsInfo", productService.getGoodsInfo(productId));
	         return "/goodsDetail";
	}  
   /* 경매 상세 */
   @GetMapping("/auctiongoodsDetail/{auctionId}")
	public String auctiongoodsDetailGET(@PathVariable("auctionId")int auctionId, Model model) {
	   		 
	   			System.out.println(productService.getAuctionGoodsInfo(auctionId));
	    	  model.addAttribute("goodsInfo", productService.getAuctionGoodsInfo(auctionId));
	         return "/auctionGoodsDetail";

	} 
   
   /* 공구 상세 */
   @GetMapping("/groupProductDetail/{groupProductId}")
	public String groupProductDetailGET(@PathVariable("groupProductId")int groupProductId, Model model) {
	   		 
	   		System.out.println(productService.getGroupProductInfo(groupProductId));
	    	model.addAttribute("goodsInfo", productService.getGroupProductInfo(groupProductId));
	        return "/groupProductGoodsDetail";

	} 
   
   /* 리뷰 쓰기 */
   @GetMapping("/replyEnroll/{memberId}")
   public String replyEnrollWindowGET(@PathVariable("memberId")String memberId, int productId, Model model) {
      ProductVO product = productService.getProductIdName(productId);
      model.addAttribute("productInfo", product);
      model.addAttribute("memberId", memberId);
      
      return "/replyEnroll";
   }   
   
   /* 리뷰 수정 팝업창 */
   @GetMapping("/replyUpdate")
   public String replyUpdateWindowGET(ReplyDTO dto, Model model) {
      ProductVO product = productService.getProductIdName(dto.getProductId());
      model.addAttribute("productInfo", product);
      model.addAttribute("replyInfo", replyService.getUpdateReply(dto.getReplyId()));
      model.addAttribute("memberId", dto.getMemberId());
      
      return "/replyUpdate";
   }      
   
   
   
}