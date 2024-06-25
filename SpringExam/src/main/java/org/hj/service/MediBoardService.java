package org.hj.service;

import java.util.ArrayList;

import org.hj.model.MediboardVO;


public interface MediBoardService {
     
     
     
     //차트 작성용
     public void insertBoard(MediboardVO board);
     
     //진료 확인서 양식용
     public MediboardVO MediPrint(String uname);
     
     //차트 리스트(검색 사용x)
     public ArrayList<MediboardVO> Medilist(int pageNo, int pageSize);
     
     //테이블의 행 갯수(글 갯수)
     public int getTotalCount();
     
     //차트 리스트(검색 사용o)
     public ArrayList<MediboardVO> Medisearch(String keyword, String searchType);
     
     //차트 내용 보기 
     public MediboardVO Medidetail(MediboardVO board);
     
     //차트 내용 보기(수정할 내용을 보기위함) 
     public MediboardVO detailforMODI(MediboardVO board);
     
     //차트 내용 수정 
     public void Medimodify(MediboardVO board);
     
     //차트 삭제
     public void Medidelete(MediboardVO board);
     
     // 관리자 차트 작성 생년월일,성별 자동입력 기능용
     public ArrayList<MediboardVO> findByName(String name); 

     
}
	
	
	
	
	





	
