<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* " %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="com.company.model.ProductVO"  %>
<%
	//GetNoticeListCtrl에서 보내온 데이터를 받기
	ArrayList<ProductVO> productList = (ArrayList<ProductVO>) request.getAttribute("productList");
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
	<style>
	.tit { padding: 30px 30px; text-align:center; }
	table { display:table; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; }
	.tb { width:960px; margin:10px auto; }
	.tb th, .tb td { width:200px; line-height:20px; border-bottom:1px solid #333; }
	.tb td img{text-align:center;overflow:hidden; width:300px; height:auto;}
	.item3 a{font-weight:800; color:purple;}
	.item3 a:hover{color:orange;}
	</style>
</head>
<body>
<div class="wrap">
<%@ include file="header.jsp" %>
<section class="content">
	<h2 class="tit">상영 중인 영화 목록</h2>
<%
	int cnt=0;
	for(int i=0;i<productList.size();i++) {		//한 튜플씩 불러다 출력하기
		cnt=i+1;
		ProductVO pro = productList.get(i);
		String proimg = pro.getProimg();
		if(proimg==null || proimg.equals("")) { 
			proimg = "./img/noImg.png";		
		}
%>	
	<table class="tb">	
	<tbody>
			<tr>
				<td class="item1" rowspan="5">
					<a href="ViewProductCtrl?pronum=<%=pro.getPronum() %>"><img src="<%=pro.getProimg() %>" alt="<%=pro.getProname() %>" /></a>
				</td>
			</tr>
			<tr><td class="item2">영화등록번호 <%=pro.getPronum() %></td></tr>
			<tr><td class="item3"><a href="ViewProductCtrl?pronum=<%=pro.getPronum() %>"><%=pro.getProname() %></a></td></tr>
			<tr><td class="item4">일일관객수 <%=pro.getProprice() %>명</td></tr>
			<tr><td class="item5">예매율 <%=pro.getProcnt() %>%</td></tr>
	</tbody>
	</table>
	<br>
<%
	}
%>			

</section>
<%@ include file="footer.jsp" %>
</div>
<script>
function frm_submit(f){		//f:form 태그에서 보내온 데이터
	var sel = 'input[name="ck"]:checked';		//sel = document.getElementsByClass("ck_item");
	var item = document.querySelectorAll(sel);
	var cnt = item.length;
	if(cnt==0){	//선택체크한 체크박스가 없으면
		alert("삭제할 요소를 선택하지 않았습니다.");	//메시지만 띄우고 끝남
		return false;
	} else {		//선택체크된 체크박스가 있으면 
		var qt = confirm("정말로 삭제하시겠습니까?");		//지우기 전에 정말로 삭제할 것인지 물어서 [확인] 선택시  true 반환
		if(qt) {		//qt가 true(확인 대화상자에서 [확인]을 누른 경우)이면 폼 데이터 전송
			f.submit();	
		} else {		//qt가 false(확인 대화상자에서 [취소]를 누른 경우)이면 아무 일도 일어나지 않음
			return false;
		}
	}
}
</script>
</body>
</html>