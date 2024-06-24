package com.somsomcloset.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.somsomcloset.model.MemberVO;
import com.somsomcloset.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {

   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   private MemberService memberservice;
   
   
   //회원가입 페이지 이동
   @RequestMapping(value="/join", method=RequestMethod.GET)
   public void loginGET() {
      
      logger.info("회원가입 페이지");
      
   }
   
   //회원가입
   @RequestMapping(value="/join", method=RequestMethod.POST)
   public String joinPOST(MemberVO member) throws Exception{
      
      String Pw = "";         
      
      Pw = member.getMemberPw();         
      member.setMemberPw(Pw);      
      
      /* 회원가입 쿼리 */
      memberservice.memberJoin(member);
      
      return "redirect:/main";
      
   }
   
   //로그인 페이지 이동
   @RequestMapping(value="/login", method = RequestMethod.GET)
   public void joinGET() {
      
      logger.info("로그인 페이지");
      
   }
   
   @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
   @ResponseBody
   public String memberIdChkPOST(String memberId) throws Exception{
      
      int result = memberservice.idCheck(memberId);
      
      if(result != 0) {
         
         return "fail"; 
         
      } else {
         
         return "success";
         
      }      
      
   }   
   

   @RequestMapping(value="login.do", method=RequestMethod.POST)
   public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
      
      HttpSession session = request.getSession();
   
      MemberVO lvo = memberservice.memberLogin(member); 
      
      if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/member/login";
            
        }
        
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:/main";
      
   }
   
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";        
        
    }
    
    @RequestMapping(value="logout.do", method=RequestMethod.POST)
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
       
       HttpSession session = request.getSession();
       
       session.invalidate();
       
    }
    
    
   
}