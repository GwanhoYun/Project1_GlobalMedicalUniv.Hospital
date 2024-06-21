<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/membership_2.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <a href="#">예약/제증명</a>
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
                <div class="search_user_info">
                    <a href="#">아이디찾기</a>
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
                <h3>회원가입을 하시려면 아래 서비스 이용약관에 동의해주세요.</h3>
                <p>홈페이지 회원 개인정보 수집에 대해 거부할 수 있는 권리가 있습니다. 개인정보 수집에 대해 거부할 경우, 온라인 회원 서비스를 받을 수 없습니다.<br>
                    오프라인 서비스는 내원 시 서비스를 받으실 수 있습니다.
                </p>
            </div>
            <div class="clause">
                <div class="clause1">
                    <input type="checkbox" class="all_check"><span>이용약관, 개인정보 수집 이용 <strong>모두 동의합니다.</strong></span>
                    <h2>이용약관*</h2>
                    <div class="clause_container">
                        <div>
                            <h1>제1장 총칙</h1>
                            <h2>제1조 목적</h2>
                            <p>
                                이 약관은 글로벌메디컬대학병원(이하 "병원"이라 한다)에서 운영하는 인터넷 홈페이지의 서비스(이하 "서비스"라 한다)를<br>
                                이용함에 있어 사이트와 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.
                            </p>
                            <h2>제2조 용어정의</h2>
                            <p>
                                이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                                (1)"사이트"라 함은 병원이 컴퓨터 등 정보통신 설비를 이용하여 제공할 수 있도록 설정한 가상의 공간을 말합니다.<br>
                                (2)"서비스"라 함은 병원의 홈페이지 및 병원이 운영하는 인터넷사이트 등에서 제공하는 인터넷상의 모든 서비스를
                                말합니다.<br>
                                (3)"회원(이용자)"이라 함은 본 약관에 동의하고, 인터넷 홈페이지에 로그인하여 본 약관에 따라 병원이 제공하는
                                서비스를 받는 자를 말합니다.<br>
                                (4)"운영자"라 함은 서비스의 전반적인 관리와 원활한 운영을 위하여 병원에서 선정한 사람을 말합니다.<br>
                                (5)"ID"라 함은 회원이 서비스에 제공받기 위하여 본 사이트로 접속할 수 있는 Login 명을 의미하며 한글, 영문과 숫자의
                                조합으로 6자에서 15자 사이로 하고 한글은 3글자에서 8글자 사이로 합니다.<br>
                                (6)"비밀번호"라 함은 회원의 비밀보호 및 회원 본인임을 확인하고 서비스에 제공되는 각종 정보의 보안을 위해 회원
                                자신이 설정하며 회사가 승인하는 영문소문자, 대문자, 숫자의 혼합 등으로 9자에서 16자 사이로 표기한 암호문자를 말합니다.<br>
                                (7)"개인정보"라 함은 당해 정보에 포함되어 있는 성명, 연락처, 주민등록번호 등의 사항에 의하여 특정 개인을 식별할 수 있는 정보를 말합니다.
                            </p>
                        </div>
                    </div>
                    <div class="clause1_check">
                        <input class="check" type="checkbox"><span>이용약관에 동의합니다.</span>
                    </div>

                    <div class="clause2">
                        <h2>개인정보 수집 이용 목적*</h2>
                        <div class="clause_container">
                            <div>
                                <h1>이용목적</h1>
                                <p>홈페이지 회원관리, 진료예약 및 증명서 발급 등 각종 서비스</p>
                                <h1>수집항목</h1>
                                <p>
                                    <strong>-필수항목:</strong><br>
                                    성명, 성별, 국적, 생년월일, 자택주소, ID/비밀번호, e-mail, 휴대전화번호, CI, DI<br>
                                    (<strong>만14세 미만 아동의 경우</strong> 법정대리인 정보(성명, 생년월일, 휴대전화번호, CI, DI, 환자와의 관계),환아
                                    주민등록번호)<br>
                                    (<strong>진료회원의 경우</strong> 주민등록번호 또는 진찰권번호(환자번호))<br>
                                    (<strong>직원의 경우</strong> 사번, 주민등록번호)
                                </p>
                            </div>
                        </div>
                        <div class="clause2_check">
                            <input class="check" type="checkbox"><span>개인정보 수집에 동의합니다.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="membership_container">
                <div style="display: none;">
                    <input type="radio" name="age" value="under14" checked disabled><label>14세 미만</label>
                    <input type="radio" name="age" value="over14" disabled><label>14세 이상</label>
                    <input type="radio" name="age" value="staff" disabled><label>직원</label>
                </div>
                <h1>회원정보 입력</h1>
                <p style="color: red; text-align: center;">*표시는 필수사항 입니다.</p>
                <form class="membership_form" action="/membership" method="post">
                    <table>
                        <tr class="user_id">
                            <td>
                                <div>
                                    <span>아이디*</span>
                                    <span class="warning_message_hidden_id"></span>
                                </div>
                                <div class="id_container">
                                    <input type="text" maxlength='15' id='getId' name="id" class="id_input" placeholder="영어, 숫자조합 6~15자" required>
                                    <button class="search_duplicate" type="button" onclick="idCheck()" disabled>중복확인</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="user_pw">
                            <td>
                                <div>
                                    <span>비밀번호*</span>
                                    <span class="warning_message_hidden_pw"></span>
                                </div>
                                <input type="password" maxlength='16' name="password" placeholder="사용 가능한 아이디 입력 시 입력가능" required readonly>
                            </td>
                        </tr>
                        <tr class="user_repw">
                            <td>
                                <div>
                                    <span>비밀번호 확인*</span>
                                    <span class="warning_message_hidden_repw"></span>
                                </div>
                                <input type="password" maxlength='16' placeholder="사용 가능한 비밀번호 입력 시 입력가능" required readonly>
                            </td>
                        </tr>
                        <tr class="medical_office">
                            <td>
                                <div>
                                    <span>부서*</span>
                                </div>
                                <select >
                                    <option value="-" selected>-</option>
                                    <option value="외과">외과</option>
                                    <option value="내과">내과</option>
                                    <option value="신경과">신경과</option>
                                    <option value="이비인후과">이비인후과</option>
                                    <option value="안과">안과</option>
                                    <option value="성형외과">성형외과</option>
                                    <option value="마취통증의학과">마취통증의학과</option>
                                    <option value="응급실">응급실</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="office_num">
                            <td>
                                <div>
                                    <div>
                                        <span>직원번호*</span>
                                        <span class="warning_message_hidden_officeNum"></span>
                                    </div>
                                </div>
                                <input type="password" maxlength='3' name="employee_Dept" placeholder="직원번호를 입력하세요">
                            </td>
                        </tr>
                        <tr class="user_name">
                            <td>
                                <div>
                                    <span>이름*</span>
                                    <span class="warning_message_hidden_name"></span>
                                </div>
                                <input type="text" maxlength='6' name="name" required>
                            </td>
                        </tr>
                        <tr class="user_resident_registration_num">
                            <td>
                                <div>
                                    <span>주민번호*</span>
                                    <span class="warning_message_hidden_regNum"></span>
                                </div>
                                <input class="resident_registration_num_form1" name="age" type="text" maxlength='6'
                                    placeholder="생년월일 6자리" required>
                                <label>-</label>
                                <input class="resident_registration_num_form2" name="rrn" type="password" maxlength='7'
                                    placeholder="뒷자리 7자리" required>
                            </td>
                        </tr>
                        <tr class="gender">
                            <td class="select_gender">
                                <div>
                                    <span>성별</span>
                                    <span class="warning_message_hidden_gender"></span>
                                </div>
                                <div>
                                    <input type="radio" name="gender" value="men" required>
                                    <label>남</label>
                                </div>
                                <div>
                                    <input type="radio" name="gender" value="women" required>
                                    <label>여</label>
                                </div>
                            </td>
                        </tr>
                        <tr class="guardian_name">
                            <td>
                                <div>
                                    <span>보호자 이름*</span>
                                    <span class="warning_message_hidden_guadianName"></span>
                                </div>
                                <input type="text" name="guardian_name" maxlength='6'>
                            </td>
                        </tr>
                        <tr class="guardian_resident_registration_num">
                            <td>
                                <div>
                                    <span>보호자 주민번호*</span>
                                    <span class="warning_message_hidden_guadianRegNum"></span>
                                </div>
                                <input class="resident_registration_num_form1" name="guardian_age" type="text" maxlength='6'
                                    placeholder="생년월일 6자리">
                                <label>-</label>
                                <input class="resident_registration_num_form2" type="password" maxlength='7'
                                    placeholder="뒷자리 7자리">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>주소</p>
                                <input type="text" name="addr">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" class="submitBtn">회원가입</button>
                                
                            </td>
                        </tr>
                    </table>

                </form>
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

<script type="text/javascript" src="resources/js/membership_2.js"></script>



</html>