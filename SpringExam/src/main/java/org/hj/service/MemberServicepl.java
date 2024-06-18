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
}
