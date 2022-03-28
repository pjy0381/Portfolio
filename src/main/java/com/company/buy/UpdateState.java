package com.company.buy;

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

@WebServlet("/UpdateState")
public class UpdateState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = request.getParameter("message");
		int o_id = Integer.parseInt(request.getParameter("o_id"));

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = JDBCCon.getConnection();
			String sql = "update tbl_order set state = ? where o_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, message);
			stmt.setInt(2, o_id);
			stmt.executeQuery();
				

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(stmt, conn);
		}
	
	}

}
