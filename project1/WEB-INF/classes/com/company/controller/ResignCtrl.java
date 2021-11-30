package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ResignCtrl")
public class ResignCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(true);// true : 세션이 없을경우 생성, false : 세션이 없을경우 생성안함
		String sid = (String) session.getAttribute("id");


		
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
			sql = "delete from membership where m_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, sid);

			int cnt = stmt.executeUpdate();
			response.setContentType("text/html;charset=UTF-8");	
			PrintWriter out = response.getWriter();

			if(cnt == 0) { 
				out.println("<script>alert('알 수 없는 오류로 회원 탈퇴가 완료되지 않았습니다.'); location.href='mypage.jsp';</script>");
			} else {
				if(sid!=null) {
					   session.invalidate();
				}
				out.println("<script>alert('회원 탈퇴가 완료되었습니다.'); location.href='index.jsp';</script>");
			}


			stmt.close();
			con.close();
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}