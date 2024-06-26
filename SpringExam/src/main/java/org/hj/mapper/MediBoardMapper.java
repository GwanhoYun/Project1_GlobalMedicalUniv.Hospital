package org.hj.mapper;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.hj.model.MediboardVO;


public interface MediBoardMapper {



	
	//차트 작성용
	public void insertBoard(MediboardVO board);
	
    //진료 확인서 양식 데이터용
    public MediboardVO dateForprint(@Param("selectedDate") Date selectedDate, @Param("userId") String userId);

     //진료 확인서 환자 내원일
    public ArrayList<MediboardVO> MediPrint2(@Param("uname2") String uname2, @Param("userId") String userId);
	
	// 게시판 페이지 글 내용(검색 사용x)
    public ArrayList<MediboardVO> Medilist(@Param("startRow") int startRow, @Param("pageSize") int pageSize);
    
    //테이블의 행 갯수(글 갯수)
    int getTotalCount();
    
    // 게시판 페이지 글 내용(검색 사용o)
    public ArrayList<MediboardVO> Medisearch(@Param("keyword") String keyword, @Param("searchType") String searchType);
    
    //차트 내용 보기
    public MediboardVO Medidetail(MediboardVO board);
    
    //차트 내용 보기(수정할 내용을 보기위함) 
    public MediboardVO detailforMODI(MediboardVO board);
    
    //차트 내용 수정 
    public void Medimodify(MediboardVO board);
    
    //차트 삭제
    public void Medidelete(MediboardVO board);
    
    // 관리자 차트 작성 생년월일,성별 자동입력 기능용
    public ArrayList<MediboardVO> findByName(@Param("name") String name);
    
}
