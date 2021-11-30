<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <header class="hd">
    	<nav class="tnb">    	
			 <ul>			 
<%
	String sid = (String) session.getAttribute("id");
	String sname = (String) session.getAttribute("name");
	if(sid!=null) sid = sid.trim().toLowerCase();
	if(sname!=null) {
		//관리자로 로그인 정보가 있으면 "admin님"으로 출력
		out.println("<li><a>"+sname+"님 환영합니다!</a></li>");

	} 
%>
				<%
					if(sid!=null && sid.equals("admin")) {
				%>
				<li><a href="admin.jsp">관리자 페이지</a></li>
				<li><a href="LogoutCtrl">로그아웃</a></li>
				<%
					} else if(sid!=null) {
				%>
				<li><a href="mypage.jsp">마이페이지</a></li>
				<li><a href="LogoutCtrl">로그아웃</a></li>
				<%		
					} else if(sid==null){
				%>
				<li><a href="agreement.jsp">회원가입</a></li>
				<li><a href="login.jsp">로그인</a></li>
				<%
					}
				%>
			 </ul>
		</nav>
	    <a class="logo" href="index.jsp"><img style="z-index:9999; position:absolute; top:40px; left:100px; display:inline-block; width:200px" src="./img/logo.png"></a>
        <nav class="gnb">
            <ul class="menu">
                <li><a href="ProductListCtrl" class="dp1">영화검색</a>
                             <ul class="sub">
                                <li><a href="ProductListCtrl">일간 박스오피스 조회</a></li>
                            </ul>
                </li>
                <li><a href="GalleryListCtrl" class="dp1">갤러리</a>
                             <ul class="sub">
                                <li><a href="GalleryListCtrl">영화속 명장면</a></li>
                            </ul>
                </li>
               	<li><a href="NoticeListCtrl" class="dp1">고객센터</a>
                             <ul class="sub">
                                <li><a href="NoticeListCtrl">공지사항</a></li>
                            </ul>
                </li>
               	<li><a href="companyinfo_map.jsp">회사소개</a>
                             <ul class="sub">
                                <li><a href="companyinfo_map.jsp">오시는 길</a></li>
                                <li><a href="companyinfo_history.jsp">회사연혁</a></li>
                                <li><a href="companyinfo_greeting.jsp">인사말</a></li>
                                <li><a href="companyinfo_organization.jsp">회사조직</a></li>         
                            </ul>
                </li>
                
            <!--
                <li><a href="" class="dp1">예매하기</a>
                             <ul class="sub">
                                <li><a href="">빠른 예매하기</a></li>
                                <li><a href="">개봉영화 목록</a></li>
                            </ul>
                </li>
                <li><a href="" class="dp1">영화검색</a>
                             <ul class="sub">
                                <li><a href="ProductListCtrl">일간 박스오피스 조회</a></li>
                                <li><a href="">영화 큐레이션</a></li>
                                <li><a href="">영화배우 통합검색</a></li>
                            </ul>
                </li>
                <li><a href="" class="dp1">예매가이드</a>
                            <ul class="sub">
                                <li><a href="">예매 방법 안내</a></li>
                                <li><a href="">쿠폰구매 및 이용 안내</a></li>
                            </ul>
                </li>
                <li><a href="" class="dp1">쿠폰등록&조회</a>
                             <ul class="sub">
                                <li><a href="">쿠폰 등록 & 조회</a></li>
                                <li><a href="">예매·취소내역 조회</a></li>
                            </ul>
                </li>
               	<li><a href="" class="dp1">고객센터</a>
                             <ul class="sub">
                                <li><a href="NoticeListCtrl">공지사항</a></li>
                                <li><a href="">자주 묻는 질문</a></li>
                                <li><a href="">1:1 문의</a></li>
                                <li><a href="">나의 문의 내역</a></li>
                            </ul>
                </li>
               -->
            </ul>
        </nav>   
    </header>