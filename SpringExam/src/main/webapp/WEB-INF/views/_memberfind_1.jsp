<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 찾기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function idFind_Result() {
            const name = $("#name").val();
            const email = $("#email").val();
            $.ajax({
                type: "post",
                url: "/findId",
                data: {
                    name: name,
                    email: email
                },
                success: function(response) {
                    alert(response);
                },
                error: function() {
                    alert("오류가 발생했습니다.");
                }
            });
        }
    </script>
</head>
<body>
<%@ include file="/resources/components/header_logout.jsp" %>
    <h2>아이디 찾기</h2>
    이름: <input type="text" name="name" id="name"><br>
    이메일: <input type="text" name="email" id="email"><button>이메일 인증</button><br>
    
    <button type="button" onclick="idFind_Result()">아이디 확인</button>
</body>
</html>