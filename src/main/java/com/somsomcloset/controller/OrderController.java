package com.somsomcloset.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.somsomcloset.model.AuctionVO;
import com.somsomcloset.model.MemberVO;
import com.somsomcloset.model.OrderDTO;
import com.somsomcloset.model.OrderPageDTO;
import com.somsomcloset.model.ProductVO;
import com.somsomcloset.service.MemberService;
import com.somsomcloset.service.OrderService;
import com.somsomcloset.service.ProductService;
import com.sun.org.slf4j.internal.Logger;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;

	
	
	@GetMapping("/order/{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {
		System.out.println("orderPageGET opd.getOrders() : " + opd.getOrders());
		System.out.println("orderPageGET orderService.getGoodsInfo(opd.getOrders()) : " + orderService.getGoodsInfo(opd.getOrders()));
		System.out.println("orderPageGET memberInfo : " + memberService.getMemberInfo(memberId));
		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
		return "/order";
	}	
	
	@GetMapping("/groupOrder/{memberId}")
	public String groupOrderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {
		System.out.println("orderPageGET opd.getOrders() : " + opd.getOrders());
		System.out.println("orderPageGET orderService.getGoodsInfo(opd.getOrders()) : " + orderService.getGroupGoodsInfo(opd.getOrders()));
		System.out.println("orderPageGET memberInfo : " + memberService.getMemberInfo(memberId));
		model.addAttribute("orderList", orderService.getGroupGoodsInfo(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
		return "/order2";
	}	
	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) throws Exception {
		
		System.out.println(od);		
		
		orderService.order(od);
		
		MemberVO member = new MemberVO();
		
		member = memberService.memberGetDetail(od.getMemberId());
		HttpSession session = request.getSession();
		System.out.println(member.getMemberId() + " " + member.getMemberPw());
		try {
			memberService.memberLogin(member);
			
			
			session.setAttribute("member", member);
			System.out.println("성공");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("실패");
		}
		
		return "redirect:/main";

	}	
	
	@PostMapping("/groupOrder")
	public String groupOrderPagePost(OrderDTO od, HttpServletRequest request) throws Exception {
		
System.out.println(od);		
		
		orderService.groupOrder(od);
		
		MemberVO member = new MemberVO();
		
		member = memberService.memberGetDetail(od.getMemberId());
		HttpSession session = request.getSession();
		System.out.println(member.getMemberId() + " " + member.getMemberPw());
		try {
			memberService.memberLogin(member);
			
			
			session.setAttribute("member", member);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/main";

	}
	
}
