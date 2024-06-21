package org.hj.controller;

import org.hj.model.memberVO;
import org.hj.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class memberShipController {
  
  
  @Autowired
  private MemberService memberservice;
  
  
  //회원가입 페이지 이동
  @RequestMapping(value = "membership", method = RequestMethod.GET)
  public String membership_2() {
    return "/_membership_2";
   }
  
  //회원가입 페이지 이동
  @RequestMapping(value = "membership1", method = RequestMethod.GET)
  public String membership_1() {
    return "/_membership_1";
   }
  
  

  
  //회원가입 버튼
  //여기 /join 값은 view 에서 줄 예정
  @RequestMapping(value = "/membership", method = RequestMethod.POST)
  public String Join(memberVO member) throws Exception {
    
    memberservice.memberJoin(member);
    System.out.print("값이 db로 전송되었습니다.");
    return "/membership_3";
   }
  
  //아이디 중복 검사
  @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
  @ResponseBody
  public String memberIdChkPOST(String id) throws Exception {
    
    
    int result = memberservice.idCheck(id);
    
    
    
    if (result != 0) {
     
     return "fail";   //중복 아이디가 존재
    
    } else {
     
     return "success";  //중복 아이디 X
     
    } // 0: 사용 가능한 아이디, 1: 사용중인 아이디, 기타: 오류
  } //memberIdChkPOST() 종료
  
  @RequestMapping(value = "membershipTest", method = RequestMethod.POST)
  public String JoinTest(memberVO member) throws Exception {
    
    memberservice.memberJoin(member);
    
    return "redirect:/";
   }
  

  
  
  
}


