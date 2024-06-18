package org.hj.service;

import org.hj.model.memberVO;
import org.springframework.stereotype.Service;


public interface MemberService {
  public void memberJoin(memberVO member)throws Exception;
}
