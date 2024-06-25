<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="user" value="${sessionScope.login}"/>
<%  
    //발행일 출력에 필요함
    java.util.Date today = new java.util.Date();
    request.setAttribute("today", today);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- ↓↓↓↓↓ 얘네는 스크립트가 아니라 컴포넌트입니다. ↓↓↓↓↓-->
    <script src="components/HospitalHeader_Logout.js"></script>
    <script src="components/HospitalFooter.js"></script>
    <!-- ↑↑↑↑↑ 얘네는 스크립트가 아니라 컴포넌트입니다. ↑↑↑↑↑-->
    <!-- ↓↓css경로 확인해주세요↓↓ -->
     <!-- ↓↓맨 아래↓↓에 javascript 경로도 확인해주세요 -->
    <!-- <link rel="stylesheet" href="resources/css/certificate_print.css" type="text/css"> -->
    <style>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

@font-face {
    font-family: 'fonts';
    src: url('fonts/OpenSans-Regular.ttf')format('truetype');
    font-style: normal;
    unicode-range: U+0041-005A, U+0061-007A;
}

@font-face {
    font-family: 'fonts';
    src: url('fonts/NotoSansKR-Regular.ttf')format('truetype');
    font-style: normal;
    unicode-range: U+AC00-D7A3, U+0030-0039;
}

@font-face {
    font-family: 'fonts';
    src: url('fonts/NotoSansJP-Regular.ttf')format('truetype');
    unicode-range: U+3041-3096, U+309D, U+309E, U+30A1-30FA, U+30FC, U+4E00-9FEA;
}

body {
    font-family: 'fonts';
}

main {
    /* margin-top: 150px; */
    width: 99vw;
}

.main_image {
    width: 99vw;
}

.side_bar {
    display: flex;
    justify-content: left;
    align-items: center;
    height: 60px;
    border-bottom: 1px solid #e6e6e6;
}

.bar_width_size {
    margin-left: 20px;
    font-size: 1.1em;
}

.issue_guide {
    margin: 0 auto;
    padding-bottom: 40px;
    width: 1300px;
}

.issue_guide h1 {
    text-align: center;
    margin: 40px 0;
}

.issue_guide ul {
    display: flex;
    justify-content: center;
    text-align: center;
    list-style: none;
    gap: 50px;
}

.issue_guide dt {
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 225px;
    height: 125px;
    line-height: 1.3;
    font-weight: 400;
    text-align: center;
    border-radius: 20px;
    background: #fff;
    border: 1px solid #1f7bf6;
    box-shadow: 0 0 20px #1f7bf645;
}

.arrow {
    display: flex;
    align-items: center;
}

.arrow div {
    border-bottom: 15px solid transparent;
    border-top: 15px solid transparent;
    border-left: 25px solid #5aa1ff;
    border-right: 0px solid transparent;
    margin-bottom: 25px;
}

.print_aria {
    width: 210mm;
    min-height: 297mm;
    padding: 20mm;
    margin: 20mm auto;
    background: #fff;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.print_titel{
	margin: 10mm 0;
}

.content {
    padding: 0;
    border: 1px solid #888888;
    height: 257mm;
}

.print_container_1,
.print_container_2 {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    border-left: 1px solid #000;
    border-right: 1px solid #000;
}

.print_container_1 div,
.print_container_2 div {
    display: flex;
    justify-content: center;
    align-items: center;
}

.print_container_1 {
    border-top: 3px solid #000;
}

.print_container_1 div,
.print_container_2 div:not(.print_container_2 div:nth-child(11), .print_container_2 div:nth-child(12)) {
    border-bottom: 1px solid #000;
    height: 15mm;
}

.print_container_2 div:nth-child(11),
.print_container_2 div:nth-child(12) {
    border-bottom: 1px solid #000;
    height: 50mm;
}

.print_container_1 div:nth-child(6),
.print_container_2 div:nth-child(6),
.print_container_2 div:nth-child(8),
.print_container_2 div:nth-child(10),
.print_container_2 div:nth-child(12) {
    grid-column: 2/5;
}

.print_color {
    background-color: #d8d8d8;
}

.print_btn {
    width: 200px;
    padding: 15px 0;
    font-size: 1.1em;
    font-weight: bold;
    border: none;
    background-color: #5aa1ff;
    color: #fff;
    cursor: pointer;
}

.print_btn:hover {
    background-color: #1f7bf6;
}

.print_btn:active {
    background-color: #5aa1ff;
}

@media print {
  * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    html,
    body {
        height: 100%;
        width: 210mm;
        overflow: hidden;
    }
    
    .print_titel{
	margin: 34mm 0 5mm 0;
}

    hospital-header-logout,
    hospital-footer,
    .side_bar,
    .main_image,
    .issue_guide,
    .print_btn_aria,
    .print_btn {
        display: none;
        margin: 0;
        padding: 0;

    }

    .print_color {
        border-right: 1px solid #888888;
        border-left: 1px solid #888888;
    }

    .print_aria {
        padding: 1mm 20mm;
        margin: 0 auto;
        box-shadow: none;
    }
}
    </style>
</head>
<body>
    <hospital-header-logout></hospital-header-logout>
    <main>
        <div class="main_image">
            <img src="resources/img/Group 35.png" alt="main_image">
        </div>
        <div class="side_bar">
            <div class="bar_width_size">
                <a>HOME &gt;</a>
                <a>예약/제증명 &gt;</a>
                <a>제증명서발급 &gt;</a>
                <a>제증명서발급안내</a>
            </div>
        </div> 
        <div class="issue_guide">
            <h1>제증명서 발급 절차(온라인)</h1>
            <ul>
                <li>
                    <di>
                        <dt>
                            <p>신청서 작성,<br>
                                구비서류 업로드</p>
                        </dt>
                    </di>
                    <div>Step 1</div>
                </li>
                <li class="arrow">
                    <div></div>
                </li>
                <li>
                    <di>
                        <dt>
                            <p>담당자 승인</p>
                            <p style="font-size: 0.9em;">(최대 3일 소요)</p>
                        </dt>
                    </di>
                    <div>Step 2</div>
                </li>
                <li class="arrow">
                    <div></div>
                </li>
                <li>
                    <di>
                        <dt>
                            <p>발급 수수료 납부</p>
                        </dt>
                    </di>
                    <div>Step 3</div>
                </li>
                <li class="arrow">
                    <div></div>
                </li>
                <li>
                    <di>
                        <dt>
                            <p>발급 완료</p>
                        </dt>
                    </di>
                    <div>Step 4</div>
                </li>
            </ul>
        </div>
        <div class="print_aria">
            <h2 class= "print_titel">진단서</h2>
            <div class="content">
                <div class="print_container_1">
                    <div class="print_color">
                        <h4>발행번호</h4>
                    </div>
                    <div>
                        <!-- 차트 번호 -->
                        <p>${UserData.chart_number}</p>
                    </div>
                    <div class="print_color">
                        <h4>주치의</h4>
                    </div>
                    <div>
                        <!-- 주치의 성명 -->
                        <span>${UserData.department_doctor}</span>

                    </div>
                    <div class="print_color">
                        <h4>병원주소</h4>
                    </div>
                    <div>
                        <p>서울특별시 고백로 123-4(행복동) 글로벌메디컬대학</p>
                    </div>
                </div>
                <div class="print_container_2" >
                    <!-- 1 -->
                    <div class="print_color">
                        <h4>환자 성명</h4>
                    </div>
                    <!-- 2 -->
                    <div>
                        <!-- 환자 이름 -->
                        <p>${UserData.name}</p>
                    </div>
                    <!-- 3 -->
                    <div class="print_color">
                        <h4>성별</h4>
                    </div>
                    <!-- 4 -->
                    <div>
                        <!-- 환자 성별 -->
                        <p>${UserData.gender}</p>
                    </div>
                    <!-- 5 -->
                    <div class="print_color">
                        <h4>생년월일</h4>
                    </div>
                    <!-- 6 -->
                    <div>
                        <!-- 주민번호 앞자리 -->
                        <span><fmt:formatDate value="${UserData.date_of_birth}" pattern="yyyy-MM-dd" /></span>

                    </div>
                    <!-- 7 -->
                    <div class="print_color">
                        <h4>주소</h4>
                    </div>
                    <!-- 8 -->
                    <div>
                        <!-- 환자 주소 작성 -->
                        <p>${login.addr}</p>
                    </div>
                    <!-- 9 -->
                    <div class="print_color">
                        <h4>병명</h4>
                    </div>
                    <!-- 10 -->
                    <div>
                        <!-- 병명 작성 -->
                        <p>${UserData.diagnosis}</p>
                    </div>
                    <!-- 11 -->
                    <div class="print_color">
                        <h4>향후<br>
                            치료<br>
                            의견
                        </h4>
                    </div>
                    <!-- 12 -->
                    <div>
                        <!-- 향후 치료의견 작성 -->
                        <p>${UserData.condition_and_opinion}</p>
                    </div>
                    <!-- 13 -->
                    <div class="print_color">
                        <h4>발행일</h4>
                    </div>
                    <!-- 14 -->
                    <div>
                        <!-- 발행일자 작성 -->
                        <p><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></p>
                    </div>
                    <!-- 15 -->
                    <div class="print_color">
                        <h4>진단일</h4>
                    </div>
                    <!-- 16 -->
                    <div>
                        <!-- 진단일자 작성 -->
                        <p><fmt:formatDate value="${UserData.admission_date}" pattern="yyyy-MM-dd" /></p>
                    </div>
                </div>
                <div class="print_container_3">
                    <div style="margin: 10mm 0 30mm 0;">
                        <h3>위와 같이 진단함.</h3>
                    </div>
                    <div>
                        <!-- 발행일 -->
                        <span></span>
                    </div>
                    <div style="margin: 10mm 0">
                        <!-- 주치의 성명만 출력하기 위함-->
                        <c:set var="departmentDoctor" value="${UserData.department_doctor}" />
                        <c:set var="doctorName" value="${fn:split(departmentDoctor, '/')[0]}" />
                        <span>주치의 :</span>
                        <!-- 주치의 성명 -->
                        <span>${doctorName}</span>
                        <span>(인/서명)</span>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <img src="resources/img/Logo.png" style="width: 100px;"><p>글로벌메디컬대학병원</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="print_btn_aria" style="margin: 70px 0; display: flex; justify-content: center;">
            <button class="print_btn" onclick="printPage()">출력</button>
        </div>
    </main>
    <hospital-footer></hospital-footer>
</body>
<script rel="javascript" type="text/javascript" src="resources/js/certificate_print.js"></script>
</html>