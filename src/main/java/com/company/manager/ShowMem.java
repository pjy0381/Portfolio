package com.company.manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.bin.MemberBin;
import com.company.common.JDBCCon;

@WebServlet("/ShowMem")
public class ShowMem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from shopMem where id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			
			MemberBin member = null;
			if(rs.next()) {
				member = new MemberBin();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setReg(rs.getDate("reg"));
				member.setnAd(rs.getString("nAd"));
				member.setdAd(rs.getString("dAd"));
			}
			
			request.setAttribute("member", member);
			RequestDispatcher view = request.getRequestDispatcher("modMem.jsp");
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
