package com.company.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.common.JDBCCon;

@WebServlet("/MonthSales")
public class MonthSales extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String month = request.getParameter("month");
		String nextMonth = request.getParameter("nextMonth");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = JDBCCon.getConnection();
			String sql = "select sum(price) from tbl_order where pdate>= TO_DATE(?,'YYYY/MM') and pdate<=TO_DATE(?,'YYYY/MM')";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, month);
			stmt.setString(2, nextMonth);
			
			rs = stmt.executeQuery();
			if (rs.next()) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();

				out.print(rs.getLong(1));
			} 
				
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(rs, stmt, conn);
		}
	}

}
