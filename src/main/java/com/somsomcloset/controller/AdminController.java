package com.somsomcloset.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.somsomcloset.model.AttachImageVO;
import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.GroupProductVO;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.OrderCancelDTO;
import com.somsomcloset.model.OrderDTO;
import com.somsomcloset.model.PageDTO;
import com.somsomcloset.model.ProductVO;
import com.somsomcloset.service.AdminService;
import com.somsomcloset.service.MemberService;
import com.somsomcloset.service.OrderService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	/* 관리자 메인 페이지 이동 */
	@RequestMapping(value="main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception{
		
		logger.info("관리자 페이지 이동");
		
	}

	/* 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "goodsManage", method = RequestMethod.GET)
	public void goodsManageGET(Criteria cri, Model model) throws Exception{
		
		logger.info("상품 관리(상품목록) 페이지 접속");
		System.out.println("goodsManageGET cri : " + cri);
		/* 상품 리스트 데이터 */
		List list = adminService.goodsGetList(cri);
		System.out.println("goodsManage list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
		
	}
	
	/* 경매 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "auctionManage", method = RequestMethod.GET)
	public void auctionManageGET(Criteria cri, Model model) throws Exception{
		
		logger.info("경매 관리(상품목록) 페이지 접속");
		System.out.println("auctionManageGET cri : " + cri);
		/* 상품 리스트 데이터 */
		List list = adminService.auctionGetList(cri);
		System.out.println("auctionManageGET list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.auctionGetTotal(cri)));
		
	}
	
	/* 공구 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "groupProductManage", method = RequestMethod.GET)
	public void groupProductManageGET(Criteria cri, Model model) throws Exception{
		
		logger.info("공구 관리(상품목록) 페이지 접속");
		System.out.println("groupProductManageGET cri : " + cri);
		/* 상품 리스트 데이터 */
		List list = adminService.groupProductGetList(cri);
		System.out.println("groupProductManageGET list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.auctionGetTotal(cri)));
		
	}
	
	/* 상품 등록 페이지 접속 */
	@RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
	public void goodsEnrollGET(Model model) throws Exception{
		
		logger.info("상품 등록 페이지 접속");
		
		ObjectMapper objm = new ObjectMapper();
		
		List list = adminService.cateList();
		System.out.println("cateList" + list);
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
		//logger.info("변경 전.........." + list);
		//logger.info("변경 gn.........." + cateList);
		
	}
	/* 경매 등록 페이지 접속 */
	@RequestMapping(value = "auctionGoodsEnroll", method = RequestMethod.GET)
	public void auctionGoodsEnrollGET(Model model) throws Exception{
		
		logger.info("경매 등록 페이지 접속");
		
		ObjectMapper objm = new ObjectMapper();
		
	}
	
	/* 상품 조회 페이지, 상품 수정 페이지 */
	@GetMapping({"/goodsDetail", "/goodsModify"})
	public void goodsGetInfoGET(int productId, Criteria cri, Model model) throws JsonProcessingException {
		System.out.println("goodsGetInfoGET() productId : " + productId);
		logger.info("goodsGetInfo()........." + productId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		/* 카테고리 리스트 데이터 */
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));		
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		
		/* 조회 페이지 정보 */
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(productId));
		
	}
	
	/* 상품 정보 수정 */
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(ProductVO vo, RedirectAttributes rttr) {
		
		logger.info("goodsModifyPOST.........." + vo);
		
		int result = adminService.goodsModify(vo);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/goodsManage";		
		
	}	
	
	/* 상품 정보 삭제 */
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int productId, RedirectAttributes rttr) {
		
		logger.info("goodsDeletePOST..........");
		/**/
		List<AttachImageVO> fileList = adminService.getAttachInfo(productId);
		
		if(fileList != null) {
			
			List<Path> pathList = new ArrayList();
			
			fileList.forEach(vo ->{
				
				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);
				
			});
			
			pathList.forEach(path ->{
				path.toFile().delete();
			});
			
		}		
		
		int result = adminService.goodsDelete(productId);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/goodsManage";
		
	}	
	
	/* 상품 등록 */
	@PostMapping(value = "/goodsEnroll")
	public String goodsEnrollPOST(ProductVO product, RedirectAttributes rttr) {
		
		logger.info("goodsEnrollPOST......" + product);
		System.out.println(product.toString());
		
		
		if(product.getCateName().equals("경매")) {
			AuctionVO auction = new AuctionVO();
			auction.setProductName(product.getProductName());
			auction.setProductPrice(product.getProductPrice());
			auction.setHighPrice(product.getProductPrice());
			auction.setMemberId("anonymous");
			auction.setAuctionCk(0);
			adminService.auctionEnroll(auction);
			
			rttr.addFlashAttribute("enroll_result", auction.getProductName());
			
			return "redirect:/admin/auctionManage";
		}else if(product.getCateName().equals("공동구매")){
			GroupProductVO groupProduct = new GroupProductVO();
			groupProduct.setGroupProductName(product.getProductName());
			groupProduct.setGroupProductSeller(product.getSeller());
			groupProduct.setCateName(product.getCateName());
			groupProduct.setGroupProductPrice(product.getProductPrice());
			groupProduct.setGroupProductStock(product.getProductStock());
			groupProduct.setGroupProductDiscount(product.getProductDiscount());
			groupProduct.setGroupProductIntro(product.getProductIntro());
			groupProduct.setGroupProductContents(product.getProductContents());
			groupProduct.setGroupProductCK(0);
			
			adminService.groupProductEnroll(groupProduct);
			rttr.addFlashAttribute("enroll_result", groupProduct.getGroupProductName());
			return "redirect:/admin/groupProductManage";
		}else {
			adminService.productEnroll(product);
			
		}
		
		rttr.addFlashAttribute("enroll_result", product.getProductName());
		
		return "redirect:/admin/goodsManage";
	}
	
	
	/* 경매 상품 조회 페이지 */
	@GetMapping({"/auctionGoodsDetail"})
	public void auctionGoodsGetInfoGET(int auctionId, Criteria cri, Model model) throws JsonProcessingException {
		System.out.println("auctionGoodsGetInfoGET() auctionId : " + auctionId);
		logger.info("auctionGoodsGetInfo()........." + auctionId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		
		/* 조회 페이지 정보 */
		model.addAttribute("auctionGoodsInfo", adminService.auctionGoodsGetDetail(auctionId));
		
	}
	
	/* 공구 상품 조회 페이지 */
	@GetMapping({"/groupProductDetail"})
	public void groupProductGetInfoGET(int groupProductId, Criteria cri, Model model) throws JsonProcessingException {
		System.out.println("groupProductGetInfoGET() groupProductId : " + groupProductId);
		logger.info("groupProductGetInfoGET()........." + groupProductId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		
		/* 조회 페이지 정보 */
		model.addAttribute("groupProductInfo", adminService.groupProductGetDetail(groupProductId));
		
	}
	
	/* 경매 상품 정보 삭제 */
	@PostMapping("/auctionGoodsDelete")
	public String auctionGoodsDeletePOST(int auctionId, RedirectAttributes rttr) {
		
		logger.info("auctionGoodsDeletePOST.........." + auctionId);
		/**/
		List<AttachImageVO> fileList = adminService.getAttachInfo(auctionId);
		
		if(fileList != null) {
			
			List<Path> pathList = new ArrayList();
			
			fileList.forEach(vo ->{
				
				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);
				
			});
			
			pathList.forEach(path ->{
				path.toFile().delete();
			});
			
		}		
		
		int result = adminService.auctionGoodsDelete(auctionId);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/auctionManage";
		
	}	
	
	/* 공구 상품 정보 삭제 */
	@PostMapping("/groupProductDelete")
	public String groupProductDeletePOST(int groupProductId, RedirectAttributes rttr) {
		
		logger.info("groupProductDeletePOST.........." + groupProductId);
		/**/
		List<AttachImageVO> fileList = adminService.getAttachInfo(groupProductId);
		
		if(fileList != null) {
			
			List<Path> pathList = new ArrayList();
			
			fileList.forEach(vo ->{
				
				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);
				
			});
			
			pathList.forEach(path ->{
				path.toFile().delete();
			});
			
		}		
		
		int result = adminService.groupProductDelete(groupProductId);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/groupProductManage";
		
	}	
	
	/* 멤버 관리 페이지 접속 */
	@RequestMapping(value = "memberManage", method = RequestMethod.GET)
	public void memberManageGET(Criteria cri, Model model) throws Exception{
		
		logger.info("회원 관리 페이지 접속.........." + cri);
		
		/* 멤버 목록 출력 데이터 */
		List list = memberService.memberGetList(cri);

		model.addAttribute("list",list);
		/* 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, memberService.memberGetTotal(cri)));
		
	}	
	
	/* 회원 상세 페이지 */
	@GetMapping({"/memberDetail", "/memberModify"})
	public void memberGetInfoGET(String memberId, Criteria cri, Model model) throws Exception {
		
		logger.info("memberDetail......." + memberId);
		
		/* 회원 관리 페이지 정보 */
		model.addAttribute("cri", cri);
		
		/* 선택 회원 정보 */
		model.addAttribute("memberInfo", memberService.memberGetDetail(memberId));
		
	}
   
	/* 회원 정보 수정 */
	@PostMapping("/memberModify")
	public String memberModifyPOST(MemberVO member, RedirectAttributes rttr) throws Exception{
		
		logger.info("memberModifyPOST......." + member);
		
		int result = memberService.memberModify(member);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/memberManage";
		
	}	
	
    /* 회원 정보 삭제 */
	@PostMapping("/memberDelete")
	public String memberDeletePOST(String memberId, RedirectAttributes rttr) {
		
		logger.info("memberDeletePOST..........");
		
		int result = 0;
		
		try {
			
			result = memberService.memberDelete(memberId);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/memberManage";
			
		}
		
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/memberManage";
		
	}
   
	
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}// for		
		
		String uploadFolder = "C:\\upload";
		
		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {
			
			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				
				multipartFile.transferTo(saveFile);
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
					BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
					
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			
			list.add(vo);
			
		} //for

		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		} // catch
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	/* 주문 현황 페이지 */
	@GetMapping("/orderList")
	public String orderListGET(Criteria cri, Model model) {
		
		List<OrderDTO> list = adminService.getOrderList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, adminService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		
		return "/admin/orderList";
	}	
	
	
	/* 주문삭제 */
	@PostMapping("/orderCancle")
	public String orderCanclePOST(OrderCancelDTO dto) {
		
		orderService.orderCancle(dto);
		
		return "redirect:/admin/orderList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount() + "&pageNum=" + dto.getPageNum();
	}		
	
}
