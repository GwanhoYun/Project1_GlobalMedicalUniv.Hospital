package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.logins;
import org.hj.service.LoginsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("login")
public class loginController {
	

	    @Autowired
	    LoginsService loginsService;

	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String login(@RequestParam("id") String id,
	                        @RequestParam("password") String password,
	                        HttpSession session,
	                        RedirectAttributes redirectAttributes) {

	        logins member = new logins();
	        member.setId(id);
	        member.setPassword(password);

	        logins loginResult = loginsService.logins(member);

	        if (loginResult != null) {
	            session.setAttribute("login", loginResult); // 세션에 로그인 정보 추가
	            return "redirect:/fi"; // 로그인 성공 시 /fi 페이지로 리다이렉트
	        } else {
	            redirectAttributes.addFlashAttribute("error", "아이디 및 비밀번호가 틀렸습니다."); // 실패 메시지 추가
	            return "redirect:/home"; // 로그인 실패 시 다시 로그인 페이지로 리다이렉트
	        }
	    }

	    // 사용자 정보 페이지
	    @RequestMapping(value = "/fi", method = RequestMethod.GET)
	    public String userInfo(HttpSession session, Model model) {
	        logins loginResult = (logins) session.getAttribute("login");

	        if (loginResult != null) {
	            model.addAttribute("loginUser", loginResult.getName()); // 사용자 이름을 모델에 추가
	            return "fi"; // 로그인된 사용자의 정보를 표시할 페이지로 이동
	        } else {
	            return "redirect:/home"; // 로그인되지 않은 경우 다시 로그인 페이지로 리다이렉트
	        }
	    }

	    // 로그아웃 처리
	    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(HttpSession session) {
	        session.removeAttribute("login"); // 세션에서 로그인 정보 제거
	        session.invalidate(); // 세션 무효화
	        return "redirect:/home"; // 로그아웃 후에는 home 페이지로 리다이렉트
	    }
	    //네이버 컨트롤러
	    @RequestMapping("/naver.do")
	    public String naver() {
	        return "naver_login"; // 네이버 로그인 화면으로 이동
	    }
	    
	    @RequestMapping(value="/callback", method=RequestMethod.GET)
	    public String callBack() {
	        return "fi"; // 네이버 로그인 콜백 처리 페이지로 이동
	    }
	}
