<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-signin-client_id"
	content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<!-- 구글 로그인 클라이언트 ID -->
<title>Global Medical University Hospital</title>
<link rel="stylesheet" href="resources/css/index.css" type="text/css">
<!-- CSS 링크 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 카카오 로그인 SDK -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<!-- 네이버 아이디로 로그인 SDK -->
<style> 
.welcome-text {
	color: white;
}
</style>  
</head>
<body>
	<%@ include file="/resources/components/header_login.jsp" %>
	<div>
		<ul class="slider-container">
			<li class="slide1"><img src="/resources/img/index_img/slide_1.png" alt="">
			</li>
			<li class="slide2"><img src="/resources/img/index_img/slide_2.png" alt="">
			</li>
			<li class="slide3"><img src="/resources/img/index_img/slide_3.png" alt="">
			</li>
			<li class="slide4"><img src="/resources/img/index_img/slide_4.png" alt="">
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
						<button onclick="location.href = 'certificate.html' ">제증명
							유의사항</button>
						<button onclick="location.href = '/CertificatePrint' ">증명서
							발급신청</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div class="quick_menu_container">
		<a href="#"> <img class="icon"
			src="/resources/img/index_img/icon_hover_1.png" alt="quick_menu_button_unhover">
			<img class="icon_hover" src="/resources/img/index_img/icon_1.png"
			alt="quick_menu_button_hover">
		</a> <a href="#"> <img class="icon"
			src="/resources/img/index_img/icon_hover_2.png" alt="quick_menu_button_unhover">
			<img class="icon_hover" src="/resources/img/index_img/icon_2.png"
			alt="quick_menu_button_hover">
		</a> <a href="#"> <img class="icon"
			src="/resources/img/index_img/icon_hover_3.png" alt="quick_menu_button_unhover">
			<img class="icon_hover" src="/resources/img/index_img/icon_3.png"ㄴ
			alt="quick_menu_button_hover">
		</a> <a href="/CertificatePrint"> <img class="icon"
			src="/resources/img/index_img/icon_hover_4.png" alt="quick_menu_button_unhover">
			<img class="icon_hover" src="/resources/img/index_img/icon_4.png"
			alt="quick_menu_button_hover">
		</a> <a href="#"> <img class="icon"
			src="/resources/img/index_img/icon_hover_5.png" alt="quick_menu_button_unhover">
			<img class="icon_hover" src="/resources/img/index_img/icon_5.png"
			alt="quick_menu_button_hover">
		</a>
	</div>
	<div class="ad_container">
		<a href=""> <img src="/resources/img/index_img/AD.png" alt="ad_image">
		</a>
	</div>
	<div class="notices_container">
		<a> <img src="/resources/img/index_img/notice.png" alt="">
		</a>
		<div class="notice">
			<div class="notice_button">
				<a>공지사항</a> <a>건강소식</a>
			</div>
			<ul class="notice_title">
				<li><a href="#">[ 중요 ] 의료 공백이 없도록 최선을 다하는 글로벌 메디컬 대학 병원이
						되겠습니다.</a></li>
				<li><a href="#">[ 중요 ] 2024년 5월 20일부터 신분증 지참 의무화</a></li>
				<li><a href="#">[ 공고 ] 2024년 하계 대학생 자원봉사자 모집</a></li>
				<li><a href="#">[ 공고 ] 2024년 하반기 제약사 신규 약물 사용 신청 접수 안내 및
						주의사항</a></li>
			</ul>
		</div>
	</div>
	<footer>
		<div class="footer_container">
			<div class="footer_links">
				<a href="#">이용약관</a> <a href="#">환자권리장전</a> <a href="#">개인정보처리정책</a>
				<a href="#">비급여진료비용안내</a>
			</div>
			<div class="hospital_info">
				<p>주소 : 서울특별시 고백로 123-4(행복동) 글로벌메디컬대학병원 한국지사 | 대표전화 : 1600-0000</p>
				<p>*이 홈페이지는 실제 병원 페이지가 아니며 글로벌 메디컬 대학 병원은 실제 존재하는 병원이 아닙니다.</p>
				<p>COPYRIGHT 2024 GLOBAL MEDICAL UNIVERSITY HOSPITAL ALL RIGHT
					RESERVED</p>
			</div>
		</div>
	</footer>
</body>
<script rel="javascript" type="text/javascript"
	src="resources/js/index.js"></script>
</html>
</body>
</html>