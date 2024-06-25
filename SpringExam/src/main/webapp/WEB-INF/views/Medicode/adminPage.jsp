<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/adminPage.css" type="text/css">
</head>

<body>
    <header>
        <div class="header_container">
            <div class="header_Logo">
                <a href="index.html">
                    <img src="resources/img/Logo_white 1.png" alt="Hospital_Logo_image">
                </a>
            </div>
            <div class="login_info">
                <div class="user_name">
                  
                    <span>${sessionScope.login.name}</span><!--접속자 담당 과 넣어주세용-->
                  
                </div>
                <div>
                    <a href="/logout">로그아웃</a>
                </div>
            </div>
        </div>
    </header>
    <main>
        <div class="main_container">
            <div class="chart_list">
                <h1>차트 리스트</h1>
                <div class="search_menu">
                    <div>
                        <form action="/Medisearch" method="get">
                        
                            <select class="patients_search_option" name="searchType" id="searchType" >
                                <option value="" disabled>검색항목선택</option>
                                <option value="chart_number" name="chart_number">차트번호</option>
                                <option value="name" name="name">환자이름</option>
                            </select>
                            
                            <input type="text" class="search_box" name="keyword" placeholder="검색할 정보 입력">
                            
                            
                            <input class="submit_btn" type="submit" value="검색">
                        </form>
                    </div>
                </div>
            </div>
            <div class="chart_container">
                <table>
                
                    <tr>
                        <th style="width: 100px;">차트 번호</th>
                        <th style="width: 120px;">환자 이름</th>
                        <th style="width: 50px;">성별</th>
                        <th style="width: 110px;">생년월일</th>
                        <th style="width: 100px;">나이</th>
                        <th style="width: 460px;">병명</th>
                        <th style="width: 150px;">내원일</th>
                        <th style="width: 150px;">퇴원일</th>
                        <th style="width: 180px;">의사/진료과</th>
                    </tr>
                    
                  <c:if test="${empty searchresult}">
				  <c:forEach var="MediChart" items="${Medilist}">
                    <tr>
                        <td><p><a href="/viewChart?chart_number=${MediChart.chart_number}">${MediChart.chart_number}</a></p></td><!--차트 번호-->
                        <td><p>${MediChart.name}</p></td><!--환자 이름-->
                        <td><p>${MediChart.gender}</p></td><!--성별-->
                        <td><p><fmt:formatDate value="${MediChart.date_of_birth}" pattern="yyyy-MM-dd" /></p></td><!--생일-->
                        <td><p>${MediChart.age}</p></td><!--나이-->
                        <td><p>${MediChart.diagnosis}</p></td><!--병명-->
                        <td><p><fmt:formatDate value="${MediChart.admission_date}" pattern="yyyy-MM-dd" /></p></td><!--내원일-->
                        <td><p><fmt:formatDate value="${MediChart.discharge_date}" pattern="yyyy-MM-dd" /></p></td><!--퇴원일-->
                        <td><p>${MediChart.department_doctor}</p></td><!--진료과-->
                       
                    </tr>
                 </c:forEach>
				 </c:if>
				 
				 
			    <c:if test="${not empty searchresult}">
				<c:forEach var="MediChart" items="${searchresult}">
                    <tr>
                        <td><p><a href="/viewChart?chart_number=${MediChart.chart_number}">${MediChart.chart_number}</a></p></td><!--차트 번호-->
                        <td><p>${MediChart.name}</p></td><!--환자 이름-->
                        <td><p>${MediChart.gender}</p></td><!--성별-->
                        <td><p><fmt:formatDate value="${MediChart.date_of_birth}" pattern="yyyy-MM-dd" /></p></td><!--생일-->
                        <td><p>${MediChart.age}</p></td><!--나이-->
                        <td><p>${MediChart.diagnosis}</p></td><!--병명-->
                        <td><p><fmt:formatDate value="${MediChart.admission_date}" pattern="yyyy-MM-dd" /></p></td><!--내원일-->
                        <td><p><fmt:formatDate value="${MediChart.discharge_date}" pattern="yyyy-MM-dd" /></p></td><!--퇴원일-->
                        <td><p>${MediChart.department_doctor}</p></td><!--진료과-->
                       
                    </tr>
                 </c:forEach>
				 </c:if>
				 
                </table>
            </div>
        </div>
        
        <div class="chart_pageNum">
		<ul class="pagination_list">
		    <!-- 페이지번호가 2 이상일때만 보임 -->
			<c:if test="${pageNo > 1}">
				<li class="pagination_item"><a href="?pageNo=1"	class="pagination_link">&lt;&lt;</a></li>
				<li class="pagination_item"><a href="?pageNo=${pageNo - 1}" class="pagination_link">&lt;</a></li>
			</c:if>
			<!-- 컨트롤러에서 받아온 pageCount(필요한 페이지의 숫자)가 pageNo를 결정한다  -->
			<c:forEach begin="1" end="${pageCount}" var="i">
				<c:choose>
					<c:when test="${pageNo == i}">
						<li class="pagination_item"><span class="pagination_THISpagelink">${i}</span></li>
					</c:when>
					<c:otherwise>
						<li class="pagination_item"><a href="?pageNo=${i}" class="pagination_link">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			 <!-- 페이지번호가 마지막페이지 번호 미만일때만 보임 -->
			<c:if test="${pageNo < pageCount}">
				<li class="pagination_item"><a href="?pageNo=${pageNo + 1}"	class="pagination_link">&gt;</a></li>
				<li class="pagination_item"><a href="?pageNo=${pageCount}"	class="pagination_link">&gt;&gt;</a></li>
			</c:if>
		</ul>
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
		let searchButton = document.querySelector(".searchbtt");

		searchButton.addEventListener("click", function(event) {

			let searchInput = document.querySelector(".searchkeyword");

			let warningLabel = document.querySelector(".Labelkeyword_warning");

			if (searchInput.value.trim() === "") {

				warningLabel.style.display = "block";
				event.preventDefault(); // 폼 제출을 방지합니다.
			} else {

				warningLabel.style.display = "none";
			}
		});
	</script>
</html>