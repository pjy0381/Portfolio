package com.company.manager;

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

import com.company.bin.ImgList;
import com.company.bin.ProductList;
import com.company.common.JDBCCon;

@WebServlet("/ModProduct")
public class ModProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from tbl_product where p_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			
			ProductList p  = null;
			if (rs.next()) {
				p = new ProductList();
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
				p.setP_info(rs.getString("p_info"));
			}
			
			rs.close();
			stmt.close();
			
			sql = "select * from tbl_img where p_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			
			ArrayList<ImgList> iList = new ArrayList<ImgList>();
			while(rs.next()) {
				ImgList img = new ImgList();
				img.setP_id(rs.getInt("p_id"));
				img.setUrl(rs.getString("url"));
				img.setId(rs.getInt("id"));
				iList.add(img);
			}
			
			request.setAttribute("iList", iList);
			request.setAttribute("p", p);
			RequestDispatcher view = request.getRequestDispatcher("updateProduct.jsp");
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
