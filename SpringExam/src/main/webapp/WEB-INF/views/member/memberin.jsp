<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
</head>
<body>

<h1>회원가입</h1>

<form action="/member" method="post">
아이디 <input type="text" name="id"><br>
비밀번호 <input type="text" name="password"><br>
비밀번호 <input type="text" name="passwordCheck"><br>
이름 <input type="text" name="name"><br>
주소 <input type="text" name="addr"><br>
이메일 <input type="text" name="email"><br>
휴대폰번호 <input type="text" name="phone"><br>
주민번호(6글자) <input type="text" name="age"><br>

<input type="submit" value="가입하기"><br>

</form>


</body>
</html>
