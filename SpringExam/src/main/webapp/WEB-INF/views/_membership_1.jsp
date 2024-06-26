<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/membership_1.css" type="text/css">
</head>
<script src="/resources/components/HospitalHeader_Logout.js?ver=1" defer></script>
<script src="/resources/components/HospitalFooter.js?ver=1" defer></script>

<body>
<%@ include file="/resources/components/header_logout.jsp" %>
   
    <main>
        <div class="member_title">
            <div>
                <h1>회원가입</h1>
            </div>
            <ul class="member_nav">
                <li class="nav_1">
                    <h3>STEP 01</h3>
                    <p>회원유형</p>
                </li>
                <li class="nav_2">
                    <h3>STEP 02</h3>
                    <p>약관동의/회원정보</p>
                </li>
                <li class="nav_3">
                    <h3>STEP 03</h3>
                    <p>가입완료</p>
                </li>
            </ul>
        </div>
        <div class="select_container">
            <div class="select_title">
                <h3>회원 유형을 선택해주세요.</h3>
                <p>유형에 따라 가입 방식과 서비스가 다를 수 있습니다.</p>
            </div>
            <div class="select_type">
                <h1>회원유형</h1>
                <div class="select_type_btn">
                    <a onclick="navigateToForm('under14')">
                        <img class="icon_hover" src="/resources/img/index_img/child_icon_hover.png" alt="">
                        <img class="icon_unhover" src="/resources/img/index_img/child_icon.png" alt="">
                        <div class="select_1">
                            <h4>만 14세 미만</h4>
                            <h3>어린이 회원</h3>
                        </div>
                    </a>
                    <a onclick="navigateToForm('over14')">
                        <img class="icon_hover" src="/resources/img/index_img/adult_icon_hover.png" alt="">
                        <img class="icon_unhover" src="/resources/img/index_img/adult_icon.png" alt="">
                        <div class="select_1">
                            <h4>만 14세 이상</h4>
                            <h3>일반 회원</h3>
                        </div>
                    </a>
                    <a onclick="navigateToForm('staff')">
                        <img class="icon_hover" src="/resources/img/index_img/doctor_icon_hover.png" alt="">
                        <img class="icon_unhover" src="/resources/img/index_img/doctor_icon.png" alt="">
                        <div class="select_1">
                            <h4>직원 전용</h4>
                            <h3>전공의, 레지던트, 간호사</h3>
                        </div>
                    </a>
                </div>
                <div class="text_container">
                    <p><strong>환자 본인의 정보로 회원가입 해야 합니다.</strong></p>
                    <p>홈페이지 진료회원은 진료예약관리 및 다양한 환자 서비스를 이용 할 수 있습니다.</p>
                    <p>어린이 회원(만 14세 미만)은 <strong>법정대리인(보호자)의 실명인증 후 가입이 가능합니다.</strong></p>
                </div>
            </div>
        </div>
    </main>
    <hospital-footer></hospital-footer>
</body>
<script rel="javascript" type="text/javascript" src="/resources/js/membership_1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</html>