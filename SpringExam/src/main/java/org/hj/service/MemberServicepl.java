package org.hj.service;

import org.hj.model.memberVO;
import org.hj.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServicepl implements MemberService {

  @Autowired
  MemberMapper membermapper;
  
  @Override
  public void memberJoin(memberVO member) throws Exception{
      membermapper.memberJoin(member);
      
      
  }
  
  @Override
  public int idCheck(String id) throws Exception {
   
   return membermapper.idCheck(id);
  }
  
  @Override
  public memberVO findId(String name, String email) {
    System.out.println("service name 값 : "+name);
    System.out.println("service email 값 : " + email);
    return membermapper.findId(name, email);
  }
}
