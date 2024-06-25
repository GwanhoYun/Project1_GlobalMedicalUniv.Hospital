package org.hj.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.hj.model.MediboardVO;
import org.hj.model.logins;
import org.hj.service.MediBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MediBoardController {
  
	@Autowired
	MediBoardService Medibs;
	
	
	@GetMapping("/Mediboard")
	public String Mediboard() {
		
	return "Medicode/viewChart"; 
	
	}
	
	@GetMapping("/MediboardInsert")
	public String MediboardInsert() {
    //차트 작성 페이지로 이동
	return "Medicode/writeChart"; 
	
	}
	
    
    @PostMapping("/Mediwrite")
    public String write(MediboardVO board, Model model) {
    	//글쓴 내용을 넘김
    	 System.out.println("Controller method called");
    	 System.out.println(board);
	    
	        Medibs.insertBoard(board); 

        return "redirect:/adminPage";
    }
    
	@GetMapping("/viewChart")
	public String detail (MediboardVO board, Model model) {
		//글 번호가 데이터베이스로 잘 넘어가는지 확인
		System.out.println(board);
	
		model.addAttribute("Medidetail", Medibs.Medidetail(board));
		return "Medicode/viewChart";
	}
	
	@GetMapping("/viewforMODI")
	public String detailforMODI(MediboardVO board, Model model) {
		//글 번호가 데이터베이스로 잘 넘어가는지 확인
		System.out.println(board);
	
		model.addAttribute("detailforMODI", Medibs.detailforMODI(board));
		return "Medicode/mediModify";
	}
	
	@GetMapping("/Medimodify")
	public String modify (MediboardVO board, Model model) {
		//글 번호가 데이터베이스로 잘 넘어가는지 확인
		System.out.println(board);
		Medibs.Medimodify(board);
		return "redirect:/adminPage";
	}
	
	@GetMapping("/Medidelete")
	public String delete (MediboardVO board, Model model) {
		//글 번호가 데이터베이스로 잘 넘어가는지 확인
		System.out.println(board);
		Medibs.Medidelete(board);
		return "redirect:/adminPage";
	}
    
	@GetMapping("/CertificatePrint")
	public String print2(Model model, HttpSession session) {
		//동명이인으로 인한 데이터 혼동이 있을수 있으니 아이디도 같이 가져간다.
		logins loginUser = (logins) session.getAttribute("login");
		String uname2 = loginUser.getName();
		String userId = loginUser.getId();
		System.out.println(uname2);
		System.out.println(userId);
		
		model.addAttribute("UDate", Medibs.MediPrint2(uname2,userId));
		
	return "Medicode/certificate_print"; 
	
	}
	
	@PostMapping("/PrintCertificateData")
	public String printCertificateData(@RequestParam("selectedDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date selectedDate, Model model) {
		
		System.out.println(selectedDate);
		
		model.addAttribute("UserData", Medibs.dateForprint(selectedDate));
		
	return "Medicode/certificate_print"; 
	
	}

    
	@GetMapping("/adminPage")
	public String list(@RequestParam(defaultValue = "1") int pageNo, Model model, MediboardVO board) {	
        int pageSize = 20; // 페이지당 게시글 수
        int totalCount = Medibs.getTotalCount(); // 전체 게시글 수
        
        // 페이지 수 계산
        int pageCount = (int) Math.ceil((double) totalCount / pageSize);
		
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageCount", pageCount);
		model.addAttribute("Medilist", Medibs.Medilist(pageNo, pageSize));
		
		return "Medicode/adminPage";
	}
	
    @GetMapping("/Medisearch")
    public String search(@RequestParam("keyword")String keyword, @RequestParam("searchType")String searchType, Model model) {
    	//System.out.println(keyword);
    	//System.out.println(searchType);
    	model.addAttribute("searchresult", Medibs.Medisearch(keyword, searchType));
        return "Medicode/adminPage";
    }
    
    @GetMapping("/searchPatient")
    @ResponseBody
    public ArrayList<MediboardVO> searchpatient(@RequestParam String name, Model model) {
    	//System.out.println(name);
    	ArrayList<MediboardVO> patient = Medibs.findByName(name);
        //System.out.println(patient);
        return patient;
        
    }
    
    
	
}
