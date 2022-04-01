package com.company.manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.common.JDBCCon;

@WebServlet("/UpdateEvent")
public class UpdateEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String event = request.getParameter("event");
		System.out.println(request.getParameter("sale"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCCon.getConnection();
			
			String sql = "update tbl_product set sale = ?, event = ? where p_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, sale);
			stmt.setString(2, event);
			stmt.setInt(3, p_id);
			
			stmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(stmt, conn);
		}
	
	}

}
