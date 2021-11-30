<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.company.model.GalleryVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	GalleryVO gal = (GalleryVO) request.getAttribute("gal");
	String g_img = gal.getG_img();
	if(g_img==null || g_img.equals("")) { 
		g_img = "./img/noImg.png";		
	}
%>
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
    <link rel="stylesheet" href="./css/view.css">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
<section class="content">
<h2 class="fr_tit">갤러리 수정</h2>        	
<form action="EditGalleryCtrl" method="post" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="g_id">갤러리번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="g_id" name="g_id" class="in_data" value="<%=gal.getG_id()%>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="g_name" >사진제목</label>
				</th>
				<td class="col_data">
					<input type="text" id="g_name" name="g_name" class="in_data" value="<%=gal.getG_name()%>"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="g_img">사진 이미지</label>
				</th>
				<td class="col_data">
					<img src="<%=g_img %>" alt="<%=g_img %>"   id="proData"/>
					<input type="button" onclick="imgCheck()" value="이미지 추가"/>
					<input type="hidden" name="g_img" id="g_img" value="./img/noname.png" />
					<input type="hidden" name="imgck" id="imgck" value="" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="g_content">설명</label>
				</th>
				<td class="col_data">
					<input type="text" id="g_content" name="g_content" class="in_data" value="<%=gal.getG_content()%>"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="resdate" >등록날짜</label>
				</th>
				<td class="col_data">
					<input type="text" id="resdate" name="resdate" class="in_data" value="<%=gal.getResdate()%>"  required />
				</td>
			</tr>
		</tbody>
	</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">수정</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
</form>
<script>
	function imgCheck() {
		window.open("galleryUploadForm.jsp", "galleryuploadcheck", "width=300, height=300");
		return false;
	}
	function pCheck(f) {
		if(f.imgck.value=="yes"){
			alert("이미지가 변경되었습니다.");
		} else {
			alert("이미지가 변경되지 않았습니다.");
		}
	}
	</script>	
</section>
<%@ include file="admin_footer.jsp" %>
</div>	
</body>
</html>