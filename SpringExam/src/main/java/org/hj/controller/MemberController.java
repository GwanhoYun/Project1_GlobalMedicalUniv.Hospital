
package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.LoginVO;
import org.hj.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@Autowired
	LoginService ls;
	
	// 회원가입
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member () {
		return "member/memberin";
	}
	
	// 회원가입서버로 내가 입력한 값을 보냄
	@RequestMapping(value = "/member", method = RequestMethod.POST)
	public String memberPost (LoginVO member, HttpSession session) {
	 session.setAttribute("member", member); // 세선에 정보 저장
	 System.out.println("세션에 저장된 회원 정보: " + member);
		return "board/list";
}
	
	
	

	
}
