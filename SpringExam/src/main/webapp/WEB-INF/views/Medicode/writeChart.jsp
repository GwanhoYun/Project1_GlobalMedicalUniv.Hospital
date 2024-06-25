<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="admin" value="${sessionScope.login}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/writeChart.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <header>
        <div class="header_container">
            <div class="header_Logo">
                <a href="index.html">
                    <img src="img/Logo_white 1.png" alt="Hospital_Logo_image">
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
    
	<form id="mediForm" action="/Mediwrite" method="post">
		<div class="width">
		    <h1>차트작성</h1>
			<div class="chart_container">
				<div>
					<p>이름</p>
				</div>
				<div style="display : flex;">
					<input type="text" id="name" name="name" placeholder="환자명입력">
					<button type="button" id="searchButton">찾기</button>
				</div>
				<div>
					<p>성별</p>
				</div>
				<div style="display: flex; justify-content: center; align-items: center;">
					<input type="radio" name="gender" value="남성" style="width: auto;"><span>남</span>
					<input type="radio" name="gender" value="여성" style="width: auto;"><span>여</span>
				</div>
				<div>
					<p>생년월일</p>
				</div>
				<div>
					<input type="date" name="date_of_birth" id="date_of_birth">
				</div>
				<div>
					<p>병명</p>
				</div>
				<div>
					<input type="text" name="diagnosis" >
				</div>
				<div>
					<p>내원일</p>
				</div>
				<div>
					<input type="date" name="admission_date">
				</div>
				<div>
					<p>퇴원일</p>
				</div>
				<div>
					<input type="date" name="discharge_date">
				</div>
				<div>
					<p>상태 및 소견</p>
				</div>
				<div class="write_contain">
					<textarea rows="30" name="condition_and_opinion"></textarea>
				</div>
				
				<c:if test="${not empty admin}">
					<c:choose>
						<c:when test="${fn:contains(login.employee_Dept, '30-')}">
							<input type="hidden" name="department_doctor"
								value="${login.name}/내과">
						</c:when>
						<c:when test="${fn:contains(login.employee_Dept, '40-')}">
							<input type="hidden" name="department_doctor"
								value="${login.name}/외과">
						</c:when>
						<c:when test="${fn:contains(login.employee_Dept, '50-')}">
							<input type="hidden" name="department_doctor"
								value="${login.name}/정형외과">
						</c:when>
					</c:choose>
				</c:if>
			</div>
			<div class="submit_btn">
				<input type="submit" value="저장">
			</div>
		</div>
	</form>
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
    
    // Date 속성을 받을시 'yyyy-mm-dd' 형식의 문자열로 변환 
    function formatDate(date) {
        var year = date.getFullYear();
        var month = ('0' + (date.getMonth() + 1)).slice(-2);
        var day = ('0' + date.getDate()).slice(-2);
        return year + '-' + month + '-' + day;
    }
    
    //환자의 이름이 차트 테이블에 기록이 있을경우 성별과 생년월일을 자동입력 해주는 함수 
    $(document).ready(function() {
        $('#searchButton').click(function() {
            var name = $('#name').val();
            $.ajax({
                url: '/searchPatient',
                type: 'GET',
                data: { name: name },
                dataType: 'json', // 서버에서 JSON 데이터로 반환하기 떄문에 타입을 변환
                success: function(patients) { 
                    console.log(patients); // 데이터를 로그에 출력하여 확인
                  
                    var patient = patients[0]; // patients 배열의 첫 번째 객체를 가져옴 (해당환자의 생년월일과 성별은 동일하기 때문에 아무거나 가져옴)          
                    
                    // 생년월일 설정
                    if (patient.date_of_birth) {
                        var dateOfBirth = new Date(patient.date_of_birth); // 데이터베이스에서 가져온 날짜를 로컬 시간으로 변환
                        var formattedDate = formatDate(dateOfBirth); // 포맷팅 함수를 사용하여 표시 형식에 맞춤
                        $('#date_of_birth').val(formattedDate);
                    }

                    // 성별 설정
                    if (patient.gender === '남성') {
                        $('input[name="gender"][value="남성"]').prop('checked', true);
                    } else if (patient.gender === '여성') {
                        $('input[name="gender"][value="여성"]').prop('checked', true);
                    }
                },
                error: function() {
                    alert('오류가 발생했습니다.');
                }
            });
        }); 
    });
    
    
    //생년월일을 기준으로 나이 계산 함수
	function handleSubmit(event) {
		event.preventDefault(); // 폼 기본 동작 방지(없으면 제출버튼을 눌렀을 때 이 스크립트가 무시됨)

		// 생년월일 입력란 값 가져오기
		let dobInput = document.getElementById('date_of_birth');
		let dobValue = dobInput.value;

		// 현재 날짜 가져오기
		let today = new Date();

		// 생년월일 날짜 객체 생성
		let dob = new Date(dobValue);

		// 나이 계산
		let age = today.getFullYear() - dob.getFullYear();

		// 생일이 지났는지 확인(지나지 않았다면 if문 실행)
		let monthDiff = today.getMonth() - dob.getMonth();
		if (monthDiff < 0
				|| (monthDiff === 0 && today.getDate() < dob.getDate())) {
			age--;
		}

		// input 요소 생성
		let ageInput = document.createElement('input');
		ageInput.type = 'hidden';
		ageInput.name = 'age';
		ageInput.value = age;

		// 폼에 hidden 필드 추가
		let form = document.getElementById('mediForm'); 
		form.appendChild(ageInput);

		// 폼 제출
		form.submit();
	}
   
	// 폼 제출 이벤트 리스너 등록
	let form = document.getElementById('mediForm'); 
	form.addEventListener('submit', handleSubmit);
	
</script>

</html>