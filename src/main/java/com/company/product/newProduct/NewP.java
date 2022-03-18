package com.company.product.newProduct;

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

@WebServlet("/NewP")
public class NewP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String categori = request.getParameter("categori");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql =  "select * from (select * from TBL_PRODUCT order by p_id desc) where ROWNUM <=12 order by p_id desc";
			if(categori != null) {
				sql = "select * from (select * from TBL_PRODUCT where p_categori = ? order by p_id desc) where ROWNUM <=12 order by p_id desc" ;
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, categori);
			}else {
				stmt = conn.prepareStatement(sql);
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

			request.setAttribute("pList", pList);
			request.setAttribute("categori", categori);
			RequestDispatcher view = request.getRequestDispatcher("newProductPage.jsp");
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
