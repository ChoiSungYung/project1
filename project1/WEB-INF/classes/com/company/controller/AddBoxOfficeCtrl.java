package com.company.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddBoxOfficeCtrl")
public class AddBoxOfficeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss");

		//보내온 데이터 받을 변수
		String  MOVIE_NUM = request.getParameter("MOVIE_NUM");
		String  MOVIE_POSTER = request.getParameter("MOVIE_POSTER");
		String  MOVIE_DIRECTOR = request.getParameter("MOVIE_DIRECTOR");
		String  MOVIE_SYNOP = request.getParameter("MOVIE_SYNOP");
		String  MOVIE_ACTOR = request.getParameter("MOVIE_ACTOR");
		String  OPENING_DATE = request.getParameter(dateFormat.format("OPENING_DATE"));
		Integer AUDIENCES = Integer.parseInt(request.getParameter("AUDIENCES"));
		
		//컨넥터/상태코드/DB 연결 변수/기타 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버 로딩/연결/상태코드 연결/SQL문 실행
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "insert into movie values (?, ?, ?, ?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, MOVIE_NUM);
			stmt.setString(2, MOVIE_POSTER );
			stmt.setString(3, MOVIE_DIRECTOR);
			stmt.setString(4, MOVIE_SYNOP);
			stmt.setString(5, MOVIE_ACTOR);
			stmt.setString(6, OPENING_DATE);
			stmt.setInt(7, AUDIENCES);

			int cnt = stmt.executeUpdate();
			if(cnt!=0) {
				response.sendRedirect("GetBoxOfficeListCtrl");
			} else {
				response.sendRedirect("addBoxOfficeForm.jsp");
			}
			//구성요소 닫기
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}