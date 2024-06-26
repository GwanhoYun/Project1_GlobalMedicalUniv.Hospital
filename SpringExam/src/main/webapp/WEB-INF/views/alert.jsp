<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
</head>
<body>
<script th:inline="javascript">
			/*<![CDATA[*/
			const msg = [[${msg}]]
	    	alert(msg);	// 알림표시
			window.location.replace( [[${url}]] );	// 이동하는 페이지
	    	
	    </script>
</body>
</html>