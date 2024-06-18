package org.hj.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
		@GetMapping("/test1.jsp")
		public String test1() {
			return "foword:quiz/test1";
		}
		@GetMapping("/test2.jsp")
		public String test2() {
			return "foword:quiz/test2";
		}
		@GetMapping("/test3.jsp")
		public String test3() {
			return "foword:/test3";
		}
		@GetMapping("/quiz/test1")
		public String quizTest1() {
			return "test1";
		}
		@GetMapping("/quiz/test2")
		public String quizTest2() {
			return "test2";
		}
		@GetMapping("/test3")
		public String quizTest3() {
			return "test3";
		}
}
