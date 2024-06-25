package org.hj.service;

import java.util.ArrayList;
import java.util.Date;

import org.hj.mapper.MediBoardMapper;
import org.hj.model.MediboardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

	@Service
	public class MediBoardServiceImpl implements MediBoardService {
		
		@Autowired
		MediBoardMapper Medibm;	
		

		public void insertBoard(MediboardVO board) {
	
		        Medibm.insertBoard(board);
	
		}
		
	     //진료 확인서 양식 데이터용
	     public MediboardVO dateForprint(Date selectedDate){
			
			return Medibm.dateForprint(selectedDate);
		}
		
		public ArrayList<MediboardVO> MediPrint2(String uname2,String userId) {
			
			return Medibm.MediPrint2(uname2,userId);
		};
		
		@Override
		public ArrayList<MediboardVO> Medilist(int pageNo, int pageSize) {
			// SQL 쿼리에서 데이터를 가져올 시작 행을 계산.
			// startRow는 현재 페이지의 첫 번째 인덱스.
			// 예: pageNo = 1 인 경우, startRow = (1 - 1) * 10 = 0 (첫 번째 레코드부터 시작)
			// 예: pageNo = 2 인 경우, startRow = (2 - 1) * 10 = 10 (11번째 레코드부터 시작)
			 int startRow = (pageNo - 1) * pageSize;
		     
		     return Medibm.Medilist(startRow, pageSize);
		}

		@Override
	    public int getTotalCount() {
			
	        return Medibm.getTotalCount();
	        
	    }
		
	    @Override
	    public ArrayList<MediboardVO> Medisearch(String keyword, String searchType) {
	    	//System.out.println(keyword+" 서비스 파일임 ");
	    	//System.out.println(searchType);
	    	return Medibm.Medisearch(keyword, searchType);
	    }
	    
	    @Override
	    public MediboardVO Medidetail(MediboardVO board) {
	    	 return Medibm.Medidetail(board);
	    };
	    
	    @Override
	    public MediboardVO detailforMODI(MediboardVO board) {
	    	 return Medibm.detailforMODI(board);
	    };
	    
	    @Override
	    public void Medimodify(MediboardVO board) {
	    	  Medibm.Medimodify(board);
	    };
	    
	    @Override
	    public void Medidelete(MediboardVO board) {
	    	  Medibm.Medidelete(board);
	    };
	    
	    @Override
	    public ArrayList<MediboardVO> findByName(String name) {
	    	//System.out.println(name+"여기는 서비스");
	        return Medibm.findByName(name);
	    }
	    
	    
}
