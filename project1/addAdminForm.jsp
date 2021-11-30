<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/ban.css">
    <link rel="stylesheet" href="./css/form.css">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<style>
	.tit { padding: 30px 30px; text-align:center; }
	table { display:table; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; }
	.tb { width:auto; margin:20px auto; }
	.tb th, .tb td { width:auto; line-height:36px; border-bottom:1px solid #333; }
	.tb th { border-top:2px solid #333; background:#ffd35e; }
	.tb tbody tr:nth-child(2n) td { background:#fff6de; }
	.btn_wrap { width:400px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:deeppink; }
	</style>
</head>
<body>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
 <section class="content">
	<h2 class="tit">관리자 등록</h2>

	<form action="AddAdminCtrl" class="frm" method="post" name="pform" onsubmit="return pCheck(this)">
		<table class="tb">
			<tr>
				<th class="item_name">
					<label for="p_num">아이디</label>
				</th>
				<td class="item_val">
					<input type="text" name="ad_userid" id="ad_userid" class="in_data" placeholder="아이디입력" required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_name">비밀번호</label>
				</th>
				<td class="item_val">
					<input type="text" name="ad_passwd" id="ad_passwd" class="in_data" placeholder="비밀번호 입력" required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_price">이름</label>
				</th>
				<td class="item_val">
					<input type="text" name="ad_name" id="ad_name" class="in_data" placeholder="이름 입력"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_cnt">출생년도</label>
				</th>
				<td class="item_val">
					<input type="number" name="ad_birthyear" id="ad_birthyear" class="in_data" placeholder="출생년도 입력" required />
				</td>
			</tr>
		</table>
		    <hr />
		<div class="btn_wrap">	
			<button type="submit" class="in_btn" onclick="">등록</button>
			<button type="reset" class="in_btn" onclick="">취소</button>
		</div>	
	</form>
	<!-- 푸터 -->
	</section>
	<%@ include file="admin_footer.jsp" %>
	</div>
</body>
</html>