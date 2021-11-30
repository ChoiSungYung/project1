<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>북스크린 | 영화 예매, 정보 검색, 다운로드까지 한 곳에서</title>
    
    <!-- 문서 메타포 설정 -->
    <meta name="title" content="북스크린">
    <meta name="keywords" content="영화 예매 | 영화관람  | 영화예매권  | 영화 검색">
    <meta name="description" content="영화 예매, 정보 검색, 다운로드까지 한 곳에서">
    <meta name="author" content="북스크린">
    
    <!-- 트위터만을 위한 오픈 그래프 설정 -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="트위터 페이지에 표시할 사이트 주소">
    <meta name="twitter:creator" content="북스크린">
    <meta name="twitter:url" content="https://bookscreen.co.kr">
    <meta name="twitter:title" content="북스크린">
    <meta name="twitter:description" content="북스크린">
    <meta name="twitter:image" content="./img/apple-touch-icon.png">
    
    <!-- 소셜 네트워크 서비스에서의 공통 오픈 그래프 설정 -->
    <meta property="og:url" content="https://bookscreen.co.kr">
    <meta property="og:image" content="./img/apple-touch-icon.png">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="북스크린">
    <meta property="og:locale" content="kr_KR">
    <meta property="og:title" content="북스크린">
    <meta property="og:description" content="영화 예매, 정보 검색, 다운로드까지 한 곳에서">
    <meta property="og:country-name" content="bookscreen">
    
    <!-- 파비콘 설정 -->
    <link rel="shortcut icon" href="./ico/favicon.ico">
    <link rel="apple-touch-icon" href="./ico/favicon.ico" sizes="48x48">
    <!--여기부터 -->
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> 
    <script> 
    //좌표 값을 바꿔서 입력 37.66002126408024, 126.77100244884178
    function initialize() {
    var myLatlng = new google.maps.LatLng(37.66002126408024, 126.77100244884178);
    var mapOptions = {
        zoom: 17,           //지도 확대 배율
        center: myLatlng
    }

    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: '더조은컴퓨터학원'	  //레이블을 바꿔서 입력
    });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <!-- 여기까지를 head태그 닫기 전에 복사해서 붙여넣기 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/ban.css">
    <link rel="stylesheet" href="./css/companyinfo.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Nanum+Gothic&display=swap" rel="stylesheet">
    
    
 <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body onload="initialize()"><!-- body 태그에 onload이벤트 등록 -->
  <%@ include file = "header.jsp" %>
    <div class="wrap">
        <div class="content">
            <div class="breadcrumb">
                <h2 class="tit">회사조직</h2>
                <div class="bread">
                    <a href="">회사소개</a><span>&gt;</span> 
                    <select name="loc" id="loc">
                        <option value="companyinfo_map.jsp">오시는 길</option>
                        <option value="companyinfo_history.jsp">회사연혁</option>
                        <option value="companyinfo_greeting.jsp">인사말</option>
                        <option value="" selected>회사조직</option>
                    </select>
                    <!--<div class="loc_area">
                        <input list="locurl" name="loc" id="loc">
                        <datalist id="locurl">
                            <option value="">오시는길</option>
                            <option value="1">회사연혁</option>
                            <option value="2">인사말</option>
                            <option value="3">회사조직</option>
                        </datalist>
                    </div>-->
                </div>
                <script>
                 document.getElementById("loc").addEventListener("change", function(){
                   if(this.value != ""){
                        location.href=this.value;
                    }
                });    
                </script>
            </div>
            <section class="con">
                <aside class="sidebar">
                    <nav class="lnb">
                        <ul>
                            <li><a href="companyinfo_map.jsp" >오시는 길</a></li>
                            <li><a href="companyinfo_history.jsp">회사연혁</a></li>
                            <li><a href="companyinfo_greeting.jsp">인사말</a></li>
                            <li><a href="companyinfo_organization.jsp" class="cur">회사조직</a></li>      
                        </ul>
                    </nav>
                </aside>
                <div class="con_data">
					<table class="tb">
							<thead>
								<tr>
									<th class="item1">부서명 </th>
									<th class="item2">이름</th>
									<th class="item3">전화번호</th>
									<th class="item4">이메일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="item1">영업팀</td>
									<td class="item2">최준영</td>
									<td class="item3">010-2342-1324</td>
									<td class="item4">bookscreen1@gmail.com</td>
								</tr>			
								<tr>
									<td class="item1">구매팀</td>
									<td class="item2">최성영</td>
									<td class="item3">010-3456-1324</td>
									<td class="item4">bookscreen2@gmail.com</td>
								</tr>	
								<tr>
									<td class="item1">전산팀</td>
									<td class="item2">최전산</td>
									<td class="item3">010-3126-4124</td>
									<td class="item4">bookscreen3@gmail.com</td>
								</tr>
							</tbody>
					</table>
                </div>    
            </section>    
        </div>
    </div>
    <%@ include file = "footer.jsp" %>
</body>
</html>