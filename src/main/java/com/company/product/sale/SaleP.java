package com.company.product.sale;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.bin.ProductList;
import com.company.common.JDBCCon;

@WebServlet("/SaleP")
public class SaleP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String categori = request.getParameter("categori");
		int page = 1;
		if(request.getParameter("page") !=null) {page = Integer.parseInt(request.getParameter("page"));}
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql =  "select * from (select rownum as rnum,B.* from (select * from tbl_product where event = ? order by p_id desc) B) where rnum between ? and ?";
			if(categori != null) {
				sql = "select * from (select rownum as rnum,B.* from (select * from tbl_product where event = ? and p_categori = ? order by p_id desc) B) where rnum between ? and ?" ;
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "yes");
				stmt.setString(2, categori);
				stmt.setInt(3, page * 12 - 11);
				stmt.setInt(4, page * 12);
			}else {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "yes");
				stmt.setInt(2, page * 12 - 11);
				stmt.setInt(3, page * 12);
			}

			rs = stmt.executeQuery();

			ArrayList<ProductList> pList = new ArrayList<ProductList>();
			while (rs.next()) {
				ProductList p = new ProductList();
				p.setP_id(rs.getInt("p_id"));
				p.setP_name(rs.getString("p_name"));
				p.setP_price(rs.getInt("p_price"));
				p.setP_categori(rs.getString("p_categori"));
				p.setP_desc(rs.getString("p_desc"));
				p.setP_url(rs.getString("p_url"));
				p.setP_color(rs.getString("p_color"));
				p.setP_gender(rs.getString("p_gender"));
				p.setEvent(rs.getString("event"));
				p.setSale(rs.getInt("sale"));
				pList.add(p);
			}
			
			 // 전체 게시글 수 담는 변수
			stmt.close();
			rs.close();
			
			if(categori != null) {
			sql = "select count(p_id) from tbl_product where event = ? and p_categori = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "yes");
			stmt.setString(2, categori);
			rs = stmt.executeQuery();
			}else {
				sql = "select count(p_id) from tbl_product where event = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "yes");
				rs = stmt.executeQuery();
			}
			int totalCount = 0; // 전체 게시글 수 담는 변수
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
			
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("pList", pList);
			request.setAttribute("categori", categori);
			RequestDispatcher view = request.getRequestDispatcher("salePage.jsp");
			view.forward(request, response);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(rs, stmt, conn);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
