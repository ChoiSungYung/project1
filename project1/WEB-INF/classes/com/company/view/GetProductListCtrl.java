package com.company.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.ProductVO;

@WebServlet("/GetProductListCtrl")
public class GetProductListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");		//드라이버 로딩
			con = DriverManager.getConnection(url, db_id, db_pw); //연결
			sql = "select * from m_product order by pronum desc";		//notice 테이블 검색구문 //sql = "select * from notice2 order by par_idx";
			stmt = con.prepareStatement(sql); 	//상태(200)연결자에 sql명령 저장
			rs = stmt.executeQuery();//실제 SQL명령을 실행하여 결과를 반환
			ArrayList<ProductVO> productList = new ArrayList<ProductVO>();	//검색결과를 저장한 리스트 객체를 생성
			while(rs.next()) {		
				//한 튜플(레코드)씩 컬럼을 분류하여 개별변수에 저장
				String pronum = rs.getString("pronum"); 
				String proname = rs.getString("proname");
				int proprice = rs.getInt("proprice"); 
				int procnt = rs.getInt("procnt"); 
				String proimg = rs.getString("proimg"); 
				
				 //개별 변수에 저장된 분류된 데이터를 VO 객체에 전달한 후 리스트 객체에 저장
				ProductVO pro = new ProductVO();
				pro.setPronum(pronum);
				pro.setProname(proname);
				pro.setProprice(proprice);
				pro.setProcnt(procnt);
				pro.setProimg(proimg);
				productList.add(pro);
			}
			request.setAttribute("productList", productList);//보내질 List 데이터를 지정
			RequestDispatcher view = request.getRequestDispatcher("getProductList.jsp"); //보내질 곳을 지정
			view.forward(request, response);			// 지정한 곳으로 데이터 보냄
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}