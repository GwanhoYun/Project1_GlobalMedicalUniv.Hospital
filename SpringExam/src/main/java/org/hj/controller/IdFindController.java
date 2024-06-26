package org.hj.controller;

import org.hj.model.memberVO;
import org.hj.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IdFindController {
  @Autowired
  private MemberService memberservice;
  
  @RequestMapping(value="idfind", method = RequestMethod.POST)
  public String idfind(memberVO member,String id)throws Exception{
    System.out.print(id);
    return "/idfind_Result";
  }
}
