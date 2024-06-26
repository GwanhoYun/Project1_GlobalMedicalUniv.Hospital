# 👨‍💻Project1_GlobalMedicalUniv.Hospital

"글로벌메디컬대학병원"이라는 가상의 병원의 로그인(일반 회원, 직원 회원)및 회원가입, 그리고 진단서 출력을 구현하는 프로젝트입니다.
- - - - -
##프로젝트 개요

  + 🕐2024년 6월 10일 ~ 2024년 6월 26일
  + 🎨메인 페이지 디자인, UI UX 구상
  + 👨‍💻html, css, javascript 페이지 마크업
  + 👨‍💻sql서버 연결, 로그인, 네이버 소셜 로그인, 회원가입 기능 구현
  + 👨‍💻회원 정보를 바탕으로 진단서 출력 기능 구현
- - - - -
##초기 프로젝트 기획
  + **UX편의성 중시, 불필요한 페이지 이동 및 페이지 생성 최소화**
   
      1. 검색, 서비스 버튼으로 최대한 많은 서비스를 이용할 수 있도록 구상.
      2. 메인 페이지에서 바로 로그인이 가능, 불필요한 페이지 이동 제거, 공간 활용.
      3. 소셜 로그인(네이버)를 지원하여 가입없이 손쉬운 로그인 제공.
  + **회원가입 정보 입력**
   
      1. 회원가입 유형 (14세 미만, 14세 이상, 직원) 에 따라 정보 입력 란이 유동적으로 변화하도록 스크립트 작성.
      2. ajax를 활용하여 아이디 중복확인 기능 제공.
      3. 사용자의 입력에 대한 유효성 검사를 실시하여, 잘못 입력시 실시간 경고 메시지 출력, 사용자의 정보 입력을 가이드함.
      4. 유효하지 않은 텍스트(ID에 한글 입력 등)에 대해서는 입력 자체를 차단. 작성 내용 삭제 등 불편을 방지함.
      5. 회원가입 완료 후 메인 페이지로 이동해 사용자가 로그인을 할 수 있도록 유도.
  + **증명서 출력**
   
      1. 메인 페이지에서 제증명 아이콘을 통해 접근하기 쉽도록 구상.
      2. 발급 과정을 4단계로 설명, 사용자가 발급 과정을 쉽게 이해할 수 있도록 편의성을 제공함.
      3. 진료 기록과 회원 정보를 비교해 쉽게 증명서 발급 가능.
  + **직원 페이지(의사의 차트 입력)**
    
     * ___의료진의 차트 입력 사항에 대해서는 의료 체계에 대한 지식이 없어, 임의로 구상, 개발함을 알림___
       
      1. 환자 정보를 쉽게 입력하고, 재방문한 환자의 경우 인적 사항을 자동으로 입력되도록 함.
      2. 직원 로그인 시 직원임을 확인하고 즉시 직원 페이지로 이동시켜 편의를 제공함.
      3. 우측에 드롭 다운 메뉴를 제공하여 의료진에게 각종 편의 기능을 제공함.
- - - - -
🛠##프로젝트 진행 중 추가 사항

  + **회원가입 폼에 이메일 작성 추가 건**
    
      1.아이디 찾기 시 신원 조회 용으로 추가
  + **비회원 로그인 건**
    
      1. 메인 페이지에서 첫 방문 간편 예약 기능을 제공하여 로그인 없이 예약이 가능하도록 편의 제공.
  + **아이디 찾기 기능 구현 건**
   
      1. 이메일로 인증번호를 받아 이름과 대조해 아이디를 찾아주도록 구상.
      2. 시간 부족으로 기능은 구현되지 않음.
- - - - -
🤸‍♂️##팀원 소개

  *윤관호(프로젝트 팀장)
    + UX, UI, 웹페이지 디자인 담당
    + HTML, CSS, JAVASCRIPT 프론트엔드 담당
    + 디지털 리소스 제작, 관리
      
  *장종민
    + 데이터 베이스 설계 및 최적화 담당
    + 로그인, 소셜 로그인 기능 구현
      
  *강동현
    + 데이터 베이스 설계 및 최적화 담당
    + 회원가입 기능 구현
    + 아이디 / 비밀번호 찾기 구현
 
  *주진성
    + 증명서 출력, 자동화 기능 구현
    + 차트 페이지 구현
    
