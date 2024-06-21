<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/membership_3.css" type="text/css">
    <script src="/resources/components/HospitalHeader_Logout.js?ver=1" defer></script>
    <script src="/resources/components/HospitalFooter.js?ver=1" defer></script>
</head>
<body>
    <hospital-header-logout></hospital-header-logout>
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
       <div class="member_contain">
            <div>
                <div>
                    <img src="/resources/img/index_img/check.png">
                </div>
                <div >
                    <h2>회원가입이 완료되었습니다.</h2>
                    <p>로그인하시면 다양한 서비스를 이용하실 수 있습니다.</p>
                </div>
                <div>
                    <a class="home_btn" href="index.html">메인페이지</a>
                </div>
            </div>
       </div>
    </main> 
    <hospital-footer></hospital-footer>
</body>
<script rel="javascript" type="text/javascript" src="/resources/js/membership_2.js"></script>

</html>