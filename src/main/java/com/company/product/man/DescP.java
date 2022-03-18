package com.company.product.man;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.bin.ProductList;
import com.company.common.JDBCCon;

@WebServlet("/DescP")
public class DescP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String color = request.getParameter("color");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql =  "select * from tbl_product where p_gender in (?,?)";
			if(color != null) {
				sql = "select * from tbl_product where p_gender in (?,?) and p_color = ?" ;
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "public");
				stmt.setString(2,"man");
				stmt.setString(3, color);
			}else {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "public");
				stmt.setString(2,"man");
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
				pList.add(p);
			}

			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.print(pList);
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
