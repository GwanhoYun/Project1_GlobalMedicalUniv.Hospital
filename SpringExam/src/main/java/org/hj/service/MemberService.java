package org.hj.service;

import org.hj.model.memberVO;
import org.springframework.stereotype.Service;


public interface MemberService {
  public void memberJoin(memberVO member)throws Exception;
  
//아이디 중복 검사
 public int idCheck(String id) throws Exception;
 
 public memberVO findId(String name, String email);
}
