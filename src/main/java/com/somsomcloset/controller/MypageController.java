package com.somsomcloset.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.somsomcloset.model.AttachImageVO;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.OrderCancelDTO;
import com.somsomcloset.model.OrderDTO;
import com.somsomcloset.model.PageDTO;
import com.somsomcloset.model.ProductVO;
import com.somsomcloset.model.ReplyDTO;
import com.somsomcloset.service.AttachService;
import com.somsomcloset.service.MemberService;
import com.somsomcloset.service.MypageService;
import com.somsomcloset.service.OrderService;
import com.somsomcloset.service.ProductService;
import com.somsomcloset.service.ReplyService;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private OrderService orderService;
	
	/* 마이페이지 */	
	@GetMapping("/{memberId}")
	public String memberPageGET(@PathVariable("memberId") String memberId, Model model) throws Exception {
		logger.info("마이페이지 진입");
		
		model.addAttribute("memberInfo", memberService.memberGetDetail(memberId));
		return "mypage/memberDetail";
	}
   
	/* 멤버 정보 수정 */
	@PostMapping("/memberModify/{memberId}")
	public String memberModifyPOST(MemberVO member, RedirectAttributes rttr) throws Exception{
		
		logger.info("memberModifyPOST......." + member);
		
		int result = memberService.memberModify(member);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/mypage/memberDetail";
		
	}
	
	/* 돈 충전 페이지 접속*/
	@GetMapping("/moneyCharge/{memberId}")
	public String moneyChargegetInfo(@PathVariable("memberId") String memberId, Model model, RedirectAttributes rttr) throws Exception{
		
		System.out.println("충전 페이지 접속");
		model.addAttribute("memberInfo", memberService.memberGetDetail(memberId));
		return "/mypage/moneyCharge";
	}
	/*돈 post*/
	   @PostMapping("/moneyChargeUpdate/{memberId}")
	   public String moneyChargePOST(MemberVO member, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
	      
	      logger.info("moneyChargePOST......." + member);
	      System.out.println("돈 충전");
	      int chargeMoney = member.getMoney();
	      System.out.println(chargeMoney);
	      int result = memberService.moneyCharge(member);
	      
	      rttr.addFlashAttribute("charge_result", result);
	      HttpSession session = request.getSession();
	      member = memberService.memberGetDetail(member.getMemberId());
	      
	      System.out.println(member.getMemberId() + " " + member.getMemberPw());
			try {
				memberService.memberLogin(member);
				
				System.out.println("성공");
				session.setAttribute("member", member);
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
				System.out.println("실패");
			}
	      return "redirect:/mypage/main";
	      
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
			
			return "redirect:/mypage/main";
			
		}
		
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/mypage/main";
		
	}
	
	@GetMapping("/orderList/{memberId}")
	public String orderListGET(String memberId, Criteria cri, Model model) {
		
		List<OrderDTO> list = mypageService.getOrderList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, mypageService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		
		return "/mypage/orderList";
	}	
	
	
	/* 주문삭제 */
	@PostMapping("/orderCancle")
	public String orderCanclePOST(OrderCancelDTO dto) {
		
		orderService.orderCancle(dto);
		
		return "redirect:/mypage/orderList";
	}		
			
}
