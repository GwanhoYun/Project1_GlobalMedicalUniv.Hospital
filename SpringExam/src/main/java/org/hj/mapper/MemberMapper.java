package org.hj.mapper;

import org.hj.model.memberVO;

public interface MemberMapper {
  
  //회원가입
  public void memberJoin(memberVO member);

  //아이디 중복 검사
  public int idCheck(String id);
  
}
