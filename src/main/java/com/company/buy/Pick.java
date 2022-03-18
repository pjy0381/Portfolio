package com.company.buy;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
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

@WebServlet("/Pick")
public class Pick extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ipAddress = request.getRemoteAddr();
		if (ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
			InetAddress inetAddress = InetAddress.getLocalHost();
			ipAddress = inetAddress.getHostAddress();
		}
		String id = request.getParameter("id");
		String p_name = request.getParameter("p_name");
		int p_id = Integer.parseInt(request.getParameter("p_id"));

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from tbl_pick where id = ? and p_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setInt(2, p_id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				if(rs.getString("pick").equals("yes")) {
					stmt.close();
					sql = "update tbl_pick set pick = 'no' where id = ? and p_id = ?";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, id);
					stmt.setInt(2, p_id);
					
					stmt.executeUpdate();
					
					response.setContentType("text/html; charset=euc-kr"); 
					PrintWriter out = response.getWriter(); 
					String str="삭제";
					out.print(str);
				}else {
					stmt.close();
					sql = "update tbl_pick set pick = 'yes' where id = ? and p_id = ?";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, id);
					stmt.setInt(2, p_id);
					
					stmt.executeUpdate();
				}
			} else {

				stmt.close();
				sql = "insert into tbl_pick values(?,?,?,?,?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.setString(2, ipAddress);
				stmt.setString(3, "yes");
				stmt.setInt(4, p_id);
				stmt.setString(5, p_name);

				stmt.executeUpdate();
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(rs, stmt, conn);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
