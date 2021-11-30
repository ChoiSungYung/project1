package com.company.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditGalleryCtrl")
public class EditGalleryCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String g_id = request.getParameter("g_id");
		String g_name = request.getParameter("g_name");
		String g_img = request.getParameter("g_img");
		String g_content = request.getParameter("g_content");
		
		//연결자/상태코드/DB 접속 정보/sql 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩/연결/상태정보로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "update gallery set g_name=?, g_img=?, g_content=? where g_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, g_name);
			stmt.setString(2, g_img);
			stmt.setString(3, g_content);
			stmt.setString(4, g_id);
			int cnt = stmt.executeUpdate();
			if(cnt == 0) { 
				response.sendRedirect("EditGalleryFormCtrl");
			} else {
				response.sendRedirect("GetGalleryListCtrl");
			}
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}