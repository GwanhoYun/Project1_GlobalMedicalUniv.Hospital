package org.hj.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.hj.model.memberVO;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberMapper {
  
  //회원가입
  public void memberJoin(memberVO member);

  //아이디 중복 검사
  public int idCheck(String id);
  
  public memberVO findId(@Param("name") String name, @Param("email") String email);
  
}
