package org.hj.controller;

import org.hj.model.memberVO;
import org.hj.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class memberShipController {
  
  
  @Autowired
  private MemberService memberservice;
  
  
  //회원가입 페이지 이동
  @RequestMapping(value = "membership", method = RequestMethod.GET)
  public String membership() {
    return "/_membership_2";
   }
  
  

  
  //회원가입 버튼
  //여기 /join 값은 view 에서 줄 예정
  @RequestMapping(value = "membership", method = RequestMethod.POST)
  public String Join(memberVO member) throws Exception {
    
    memberservice.memberJoin(member);
    
    return "/membership_3";
   }
  
  @RequestMapping(value = "membershipTest", method = RequestMethod.POST)
  public String JoinTest(memberVO member) throws Exception {
    
    memberservice.memberJoin(member);
    
    return "redirect:/";
   }
  

  
  
  
}
