<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.company.model.MemberVO" %>
<%
	MemberVO mem = (MemberVO) request.getAttribute("mem");
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
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
	.tit { padding: 30px 30px; text-align:center; }
	table { display:table; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; }
	.tb { width:600px; margin:20px auto; }
	.tb th, .tb td { width:300px; line-height:36px; border-bottom:1px solid #333; }
	.tb th { border-top:2px solid #333; background:#ffd35e; }
	.tb tbody tr:nth-child(2n) td { background:#fff6de; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:deeppink; }
	</style>
</head>
<body>
 <script>
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);                   
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('uzip').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("uaddr1").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("uaddr1").value = jibunAddr;
                    }
                }
            }).open();
        }
</script>	
<div class="wrap">
<%@ include file="admin_header.jsp" %>
<h2 class="fr_tit">회원정보 수정</h2>        
<form action="EditMemberCtrl" method="post" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="uid">아이디</label>
				</th>
				<td class="col_data">
					<input type="text" id="uid" name="uid" class="in_data" value="<%=mem.getM_id() %>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="upw" >비밀번호</label>
				</th>
				<td class="col_data">
					<input type="password" id="upw" name="upw" class="in_data" value="<%=mem.getM_pw() %>" readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uname">회원명</label>
				</th>
				<td class="col_data">
					<input type="text" id="uname" name="uname" class="in_data" value="<%=mem.getM_name() %>" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="ubirth">이메일</label>
				</th>
				<td class="col_data">
					<input type="text" id="uemail" name="uemail" class="in_data" value="<%=mem.getM_email() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uregdate">전화번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="utel" name="utel" class="in_data" value="<%=mem.getM_tel() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uzip" class="lb">우편번호</label>
				</th>
				<td>
					<input type="text" name="uzip" id="uzip" value="<%=mem.getM_zip() %>" readonly/>
					<input type="button" class="chk_button" value="주소찾기" onclick="findAddr()"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uaddr1">집주소</label>
				</th>
				<td>
					<input type="text" name="uaddr1" id="uaddr1"  value="<%=mem.getM_addr1() %>" class="in_data" readonly/>
					<input type="text" name="uaddr2" id="uaddr2"  value="<%=mem.getM_addr2() %>" class="in_data"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="ujob">직업</label>
				</th>
				<td>
				<select name="ujob" id="ujob" class="in_data">
					<%
						String m_job = mem.getM_job();
						if(m_job.equals("A1")){
							m_job="학생";
						} else if(m_job.equals("A2")){
							m_job="회사원";
						} else {
							m_job="기타";
						}
					%>
	   				 <option value="<%=mem.getM_job() %>">현재 직업: <%=m_job %></option>	   				 <option value="A1">학생</option>
	   				 <option value="A2">회사원</option>
	   				 <option value="A3">기타</option>
				</select>
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
 		document.getElementById("uyesno").addEventListener("click", function(){
 			if(this.value=="yes") {
 				this.value = "no";
 				return false;
 			} else {
 				this.value = "yes";
 			}
 		});
 </script>	
 <%@ include file="footer.jsp" %>
</div>
</body>
</html>