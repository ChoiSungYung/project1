package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutCtrl
 */
@WebServlet("/LogoutCtrl")
public class LogoutCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
			HttpSession session = request.getSession(true);// true : 세션이 없을경우 생성, false : 세션이 없을경우 생성안함
		
			String uid = (String) session.getAttribute("id");
			String upw = (String) session.getAttribute("pw");
			String uname = (String) session.getAttribute("name");
		   
		   //세션의 id값이 저장되어 있지 않으면 if문 실행하지 않고, 세션의 id값이 있으면 nvalidate() 또는 removeAttribute()로
		   //세션 값을 비워 로그아웃 처리
		   if(uid!=null) {
		   session.invalidate();
		   //로그아웃 처리 후 index.jsp로 이동
		   response.setContentType("text/html;charset=UTF-8");	
		   PrintWriter out = response.getWriter();
		   out.println("<script>alert('로그아웃했습니다.'); location.href='index.jsp';</script>");
		   }
	}
}
