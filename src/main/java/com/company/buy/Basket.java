package com.company.buy;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import com.company.bin.BasketList;
import com.company.common.JDBCCon;

@WebServlet("/Basket")
public class Basket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int p_id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<BasketList> basketList = (ArrayList<BasketList>)session.getAttribute("basketList");
		if(basketList == null) {basketList = new ArrayList<BasketList>();}
		int quantity = 1;
		if(request.getParameter("quantity")!=null) {quantity=Integer.parseInt(request.getParameter("quantity"));}
		String size = "L";
		if(request.getParameter("size")!=null) {size = request.getParameter("size");}
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			
			String sql = "select * from tbl_product where p_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, p_id);
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				BasketList bas = new BasketList();
				bas.setUrl(rs.getString("p_url"));
				bas.setP_id(p_id);
				bas.setName(rs.getString("p_name"));
				if(rs.getString("event").equals("yes")) {
					int price = rs.getInt("p_price")*(100-rs.getInt("sale"))/100;
					bas.setPrice(price);
				}else {
				bas.setPrice(rs.getInt("p_price"));}
				bas.setQuantity(quantity);
				bas.setSize(size);
				basketList.add(bas);
			}
			session.setAttribute("basketList", basketList);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(rs, stmt, conn);
		}
	}

}
