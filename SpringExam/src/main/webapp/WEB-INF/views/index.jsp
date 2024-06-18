<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Medical University Hospital</title>
    <link rel="stylesheet" href="/resources/css/index.css" type="text/css">
</head>

<body>
    <header>
        <div class="header_1">
            <div class="header_1_menu">
                <a href="#">한국어</a>
                <a href="#">English</a>
                <a href="#">中文</a>
                <a href="#">日本語</a>
            </div>
        </div>
        <div class="header_2">
            <div class="logo">
                <a href="index.html"><img src="/resources/img/index_img/Logo_white 1.png" alt="Hospital_logo" /></a>
            </div>
            <div class="header_2_menu">
                <a href="certificate.html">예약/제증명</a>
                <a href="#">진료과</a>
                <a href="#">병원소개</a>
                <a href="#">찾아오시는길</a>
            </div>
            <div class="login">
                <a onclick="loginForm_btn()">로그인</a>
            </div>
        </div>
        <div class="login_form">
            <div class="login_member">
                <div style="padding: 50px 0;">
                    <h1>로그인</h1>
                    <p>글로벌메디컬대학병원 홈페이지 회원 서비스는</p>
                    <p>로그인 후 이용 가능합니다.</p>
                </div>
                <form action="">
                    <div class="login_container">
                        <input type="text" id="#" placeholder="아이디를 입력하세요">
                        <input type="password" id="#" placeholder="비밀번호를 입력하세요">
                        <input class="login_btn" type="submit" id="#" value="로그인">
                    </div>
                </form>
                <div class="serch_user_info">
                    <a href="membership.html">회원가입</a>
                    <span> | </span>
                    <a href="#">아이디찾기</a>
                    <span> | </span>
                    <a href="#">비밀번호찾기</a>
                </div>
                <div class="sns_login">
                    <a href="#"><img src="/resources/img/index_img/btnG_완성형.png"></a>
                    <a href="#"><img src="/resources/img/index_img/kakao_login_large_narrow.png"></a>
                </div>
            </div>
            <div class="login_staff_only">
                <div style="padding: 50px 0;">
                    <h1>직원 전용 로그인</h1>
                    <p>글로벌메디컬대학병원 의료진 전용 로그인입니다.</p>
                    <p>관계자가 아닐경우 일반 로그인을 이용해주세요.</p>
                </div>
                <form action="">
                    <div class="login_container">
                        <input class="form_lock" type="text" id="#" placeholder="아이디를 입력하세요">
                        <input class="form_lock" type="password" id="#" placeholder="비밀번호를 입력하세요">
                        <input class="login_btn" type="submit" id="#" value="로그인">
                    </div>
                    <p style="text-decoration: underline; color: #ff0000;">*부정 사용할 경우 관련 법에 따라 처벌받을 수 있습니다.</p>
                    <input class="locker" type="checkbox"> 확인했습니다.
                </form>
            </div>
            <button class="exit_btn" onclick="loginForm_btn()">닫기</button>
        </div>
    </header>
    <main>
        <div>
            <ul class="slider-container">
                <li class="slide1">
                    <img src="/resources/img/index_img/slide_1.png" alt="">
                </li>
                <li class="slide2">
                    <img src="/resources/img/index_img/slide_2.png" alt="">
                </li>
                <li class="slide3">
                    <img src="/resources/img/index_img/slide_3.png" alt="">
                </li>
                <li class="slide4">
                    <img src="/resources/img/index_img/slide_4.png" alt="">
                </li>
            </ul>
            <div class="remort">
                <a class="prev"><img src="/resources/img/index_img/prev-icon-black.png"></a>
                <a class="next"><img src="/resources/img/index_img/next-icon-black.png"></a>
            </div>
            <ul class="reserv_box_container">
                <li class="box_1">
                    <div>
                        <h3>첫 방문 간편 예약</h3>
                        <div class="textbox_form">
                            <input type="text" placeholder="전화번호(-제외) 입력">
                            <button>예약</button>
                        </div>
                        <p>전화예약 1600-xxxx</p>
                    </div>
                </li>
                <li class="box_2">
                    <div>
                        <h3>진료과 검색</h3>
                        <div class="textbox_form">
                            <input type="text" placeholder="진료과 입력">
                            <button>검색</button>
                        </div>
                        <p>증상으로 검색해보세요</p>
                    </div>
                </li>
                <li class="box_3">
                    <div>
                        <h3>의료진 검색</h3>
                        <div class="textbox_form">
                            <input type="text" placeholder="의료진 입력">
                            <button>검색</button>
                        </div>
                        <p>의료진의 진료 가능일자를 검색하세요</p>
                    </div>
                </li>
                <li class="box_4">
                    <div>
                        <h3>제증명</h3>
                        <div class="box_4_button_container">
                            <button onclick = "location.href = 'certificate.html' ">제증명 유의사항</button>
                            <button onclick = "location.href = 'certificate.html' ">증명서 발급신청</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="quick_menu_container">
            <a href="#">
                <img class="icon" src="/resources/img/index_img/icon_hover_1.png" alt="quick_menu_button_unhover">
                <img class="icon_hover" src="/resources/img/index_img/icon_1.png" alt="quick_menu_button_hover">
            </a>
            <a href="#">
                <img class="icon" src="/resources/img/index_img/icon_hover_2.png" alt="quick_menu_button_unhover">
                <img class="icon_hover" src="/resources/img/index_img/icon_2.png" alt="quick_menu_button_hover">
            </a>
            <a href="#">
                <img class="icon" src="/resources/img/index_img/icon_hover_3.png" alt="quick_menu_button_unhover">
                <img class="icon_hover" src="/resources/img/index_img/icon_3.png" alt="quick_menu_button_hover">
            </a>
            <a href="#">
                <img class="icon" src="/resources/img/index_img/icon_hover_4.png" alt="quick_menu_button_unhover">
                <img class="icon_hover" src="/resources/img/index_img/icon_4.png" alt="quick_menu_button_hover">
            </a>
            <a href="#">
                <img class="icon" src="/resources/img/index_img/icon_hover_5.png" alt="quick_menu_button_unhover">
                <img class="icon_hover" src="/resources/img/index_img/icon_5.png" alt="quick_menu_button_hover">
            </a>
        </div>
        <div class="ad_container">
            <a href="">
                <img src="/resources/img/index_img/AD.png" alt="ad_image">
            </a>
        </div>
        <div class="notices_container">
            <a>
                <img src="/resources/img/index_img/notice.png" alt="">
            </a>
            <div class="notice">
                <div class="notice_button">
                    <a>공지사항</a>
                    <a>건강소식</a>
                </div>
                <ul class="notice_title">
                    <li>
                        <a href="#">[ 중요 ] 의료 공백이 없도록 최선을 다하는 글로벌 메디컬 대학 병원이 되겠습니다.</a>
                    </li>
                    <li>
                        <a href="#">[ 중요 ] 2024년 5월 20일부터 신분증 지참 의무화</a>
                    </li>
                    <li>
                        <a href="#">[ 공고 ] 2024년 하계 대학생 자원봉사자 모집</a>
                    </li>
                    <li>
                        <a href="#">[ 공고 ] 2024년 하반기 제약사 신규 약물 사용 신청 접수 안내 및 주의사항</a>
                    </li>
                </ul>
            </div>
        </div>
    </main>
    <footer>
        <div class="footer_container">
            <div class="footer_links">
                <a href="#">이용약관</a>
                <a href="#">환자권리장전</a>
                <a href="#">개인정보처리정책</a>
                <a href="#">비급여진료비용안내</a>
            </div>
            <div class="hospital_info">
                <p>주소 : 서울특별시 고백로 123-4(행복동) 글로벌메디컬대학병원 한국지사 | 대표전화 : 1600-0000</p>
                <p>*이 홈페이지는 실제 병원 페이지가 아니며 글로벌 메디컬 대학 병원은 실제 존재하는 병원이 아닙니다.</p>
                <p>COPYRIGHT 2024 GLOBAL MEDICAL UNIVERSITY HOSPITAL ALL RIGHT RESERVED</p>
            </div>
        </div>
    </footer>
</body>
<script rel="javascript" type="text/javascript" src="/resources/js/index.js"></script>
</html>