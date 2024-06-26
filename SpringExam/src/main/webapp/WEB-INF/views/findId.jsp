<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership</title>
    <link rel="stylesheet" href="/resources/css/findID.css?=ver1" type="text/css">
     
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/components/HospitalHeader_Logout.js?ver=1" defer></script>
<script src="/resources/components/HospitalFooter.js?ver=1" defer></script>


<body>
    <%@ include file="/resources/components/header_logout.jsp" %>
    <main>
        <div class="member_title">
            <div>
                <h1>아이디 / 비밀번호 찾기</h1>
            </div>
            <ul class="member_nav">
                <li class="nav_1">
                    <a href="#">
                        <h3>아이디 찾기</h3>
                        <p>아이디가 기억나지 않으신가요?</p>
                    </a>
                </li>
                <li class="nav_2">
                    <a href="#">
                        <h3>비밀번호 찾기</h3>
                        <p>비밀번호가 기억나지 않으신가요?</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="select_container">
            <div class="select_title">
                <h3>회원 가입에 사용한 정보를 입력해주세요.</h3>
                <p>※회원정보가 변경되어 본인확인이 불가능할 경우 <b>1600-xxxx</b>으로 연락주십시오.</p>
            </div>
            <div class="findID">
                <h2>아이디 찾기</h2>
                <div class="findID_form">
                   <!--  <form action="" class="findID_submit_form">  -->
                        <div class="user_name">
                            <div>
                                <span>이름</span>
                                <span class="warning_message_hidden_name"></span>
                            </div>
                            <input class="korean-only-input" type="text" maxlength='6' id="name" name="name" required>
                        </div>
                        <div class="email">
                            <div>
                                <span>이메일</span>
                                <span class="warning_message_hidden_email"></span>
                            </div>
                            <div class="email_form">
                                <input type="text" id="email" name="email" class="email_width" maxlength='30'>
                                
                            </div>
                        </div>
                </div>
                <div class="findID_btn_container">
                    <input class="email_certification" type="submit" value="인증번호 발송">
                    <button class="findID_btn" type="button" onclick="idFind_Result()">아이디 찾기</button>
                </div>
                <!-- </form>-->
            </div>
        </div>
    </main>
    <hospital-footer></hospital-footer>
</body>
<script rel="javascript" type="text/javascript" src="resources/js/findID.js?=ver1"></script>
<script>
        function idFind_Result() {
            const name = $("#name").val();
            const email = $("#email").val();
            
            console.log(name)
            console.log(email)
            
            $.getJSON("/findid/"+name+"/"+email+".json",function(data){
            	 alert(data.id)
             }).fail(function() {
            	 alert("아이디가 없습니다.")
             });
        }
    </script>


</html>