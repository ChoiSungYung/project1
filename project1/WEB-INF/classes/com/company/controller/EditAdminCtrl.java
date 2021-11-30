package com.company.controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditAdminCtrl")
public class EditAdminCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String  uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String uname = request.getParameter("uname");
		int ubirth = Integer.parseInt(request.getParameter("ubirth"));
		
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
			sql = "update admin_member set passwd=?, birthyear=?, name=? where userid=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, upw);
			stmt.setInt(2, ubirth);
			stmt.setString(3, uname);
			stmt.setString(4, uid);
			int cnt = stmt.executeUpdate();
			if(cnt == 0) { 
				response.sendRedirect("EditAdminFormCtrl");
			} else {
				response.sendRedirect("GetAdminListCtrl");
			}
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}