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

@WebServlet("/InputAnswer")
public class InputAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String c_id = request.getParameter("c_id");
		String content = request.getParameter("content");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCCon.getConnection();
			
			String sql = "insert into tbl_answer (content,c_id,id) values(?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setString(2, c_id);
			stmt.setString(3, id);
			
			stmt.executeUpdate();
			
			stmt.close();
			
			sql = "update tbl_counsel set c_state = '답변 완료' where c_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c_id);
			
			stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
