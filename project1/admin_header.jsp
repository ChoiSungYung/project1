<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("id");
	String sname = (String) session.getAttribute("name");
	if(sid!=null) sid = sid.trim().toLowerCase();
%>
    <header class="hd">
	    <a class="logo" href="index.jsp"><img style="z-index:9999; position:absolute; top:40px; left:100px; display:inline-block; width:200px" src="./img/logo.png"></a>
    	<nav class="tnb">
    		<ul>
				<%
					if(sid!=null && sid.equals("admin")) {
				%>
				<li><a href="index.jsp">사용자 페이지로 돌아가기</a></li>
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
				<li><a href="sitemap.jsp">사이트맵</a></li>
				<li><a href="companyinfo.jsp">회사소개</a></li>			
			</ul>
		</nav>		
        <nav class="gnb">
            <ul class="menu">
                <li><a href="GetMemberListCtrl" class="dp1">회원관리</a>
                             <ul class="sub">
                                <li><a href="addMemberForm.jsp">회원 등록</a></li>
                                <li><a href="GetMemberListCtrl">회원 수정</a></li>
                            </ul>
                </li>
                <li><a href="GetNoticeListCtrl" class="dp1">공지사항 관리</a>
                             <ul class="sub">
                                <li><a href="addNoticeForm.jsp">공지사항 등록</a></li>
                                <li><a href="GetNoticeListCtrl">공지사항 수정</a></li>
                            </ul>
                </li>
                <li><a href="GetProductListCtrl" class="dp1">상영 영화 관리</a>
                            <ul class="sub">
                                <li><a href="addProductForm.jsp">영화 등록</a></li>
                                <li><a href="GetProductListCtrl">영화 수정</a></li>
                            </ul>
                </li>
                <!--  
                <li><a href="GetBoardListCtrl" class="dp1">게시판 관리</a>
                             <ul class="sub">
                                <li><a href="addBoardForm.jsp">게시판 등록</a></li>
                                <li><a href="GetBoardListCtrl">게시판 수정</a></li>
                                <li><a href="GetBoardListCtrl">게시판 삭제</a></li>
                            </ul>
                </li>
                -->
                <li><a href="GetGalleryListCtrl" class="dp1">갤러리 관리</a>
                             <ul class="sub">
                                <li><a href="addGalleryForm.jsp">갤러리 사진 등록</a></li>
                                <li><a href="GetGalleryListCtrl">갤러리 사진 수정</a></li>
                            </ul>
                </li>
                <li><a href="GetAdminListCtrl" class="dp1">관리자 정보</a>
                </li>
            </ul>
        </nav>   
    </header>