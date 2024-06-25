<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="admin" value="${sessionScope.loginS}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/viewChart.css" type="text/css">
</head>

<body>
    <header>
        <div class="header_container">
            <div class="header_Logo">
                <a href="index.html">
                    <img src="img/Logo_white 1.png" alt="Hospital_Logos_image">
                </a>
            </div>
            <div class="login_info">
                <div class="user_name">
                    <span>${login.name}</span><!--접속자 담당 과 넣어주세용-->

                </div>
                <div>
                    <button type="button">로그아웃</button>
                </div>
            </div>
        </div>
    </header>
    <main>
            <div class="width">
                <h1>차트뷰어</h1>
                <div class="chart_container">
                    <div>
                        <p>이름</p>
                    </div>
                    <div>
                        <input type="text" value="${Medidetail.name}" readonly>
                    </div>
                    <div>
                        <p>성별</p>
                    </div>
                    <div style="display: flex; justify-content: center; align-items: center;">
                        <input type="text" name="gender" value="${Medidetail.gender}" readonly>
                    </div>
                    <div>
                        <p>생년월일</p>
                    </div>
                    <div>
                        <p><fmt:formatDate value='${Medidetail.date_of_birth}' pattern='yyyy-MM-dd'/></p>
                    </div>
                    <div>
                        <p>병명</p>
                    </div>
                    <div>
                        <input type="text"  value="${Medidetail.diagnosis}" readonly>
                    </div>
                    <div>
                        <p>내원일</p>
                    </div>
                    <div>
                         <p><fmt:formatDate value='${Medidetail.admission_date}' pattern='yyyy-MM-dd'/></p>
                    </div>
                    <div>
                        <p>퇴원일</p>
                    </div>
                    <div>
                         <p><fmt:formatDate value='${Medidetail.discharge_date}' pattern='yyyy-MM-dd'/></p>
                    </div>
                    <div>
                        <p>상태 및 소견</p>
                    </div>
                    <div class="write_contain">
                        <textarea rows="30" readonly>${Medidetail.condition_and_opinion}</textarea>
                    </div>
                </div>
                <div class="submit_btn" >
                   <form action="/viewforMODI" method="get" >                                       
                     <input type="hidden" name="chart_number" value="${Medidetail.chart_number}">
                     <input type="submit" value="수정">
                   </form>
                   
                   <form id="deleteForm" action="/Medidelete" method="get" >                                       
                     <input type="hidden" name="chart_number" value="${Medidetail.chart_number}">
                     <input type="button" value="삭제" onclick="confirmDelete()">
                   </form>
                   
                </div>
            </div>
       
    </main>
    <nav class="dropdown_side">
        <div>
            <p>menu</p>
        </div>
        <ul>
            <li><a href="/adminPage">차트리스트</a></li>
            <li><a href="/MediboardInsert">차트작성</a></li>
            <li><a href="#">예약현황</a></li>
            <li><a href="#">스케줄</a></li>
            <li><a href="#">스케줄수정</a></li>
            <li><a href="#">외래</a></li>
            <li><a href="#">메신저</a></li>
            <li><a href="#">협진요청</a></li>
            <li><a href="#">승인요청</a></li>
        </ul>
    </nav>
</body>

<script>
    function confirmDelete() {
        if (confirm("삭제하시겠습니까?")) {
            document.getElementById("deleteForm").submit();
        }
    }
</script>

</html>