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

import com.company.bin.AnswerList;
import com.company.bin.CounselList;
import com.company.common.JDBCCon;
@WebServlet("/ShowCounsel")
public class ShowCounsel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String c_id = request.getParameter("c_id");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from tbl_counsel where c_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c_id);
			
			rs = stmt.executeQuery();
			
			CounselList counsel = null;
			if(rs.next()) {
				counsel = new CounselList();
				counsel.setC_id(rs.getInt("c_id"));
				counsel.setC_categori(rs.getString("c_categori"));
				counsel.setO_id(rs.getInt("o_id"));
				counsel.setId(rs.getString("id"));
				counsel.setPhone(rs.getString("phone"));
				counsel.setTitle(rs.getString("title"));
				counsel.setContent(rs.getString("content"));
				counsel.setC_url(rs.getString("c_url"));
				counsel.setC_state(rs.getString("c_state"));
				counsel.setReg(rs.getDate("reg"));
			}
			
			rs.close();
			stmt.close();
			
			sql = "select * from tbl_answer where c_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c_id);
			
			rs = stmt.executeQuery();
			
			ArrayList<AnswerList> aList = new ArrayList<AnswerList>();
			while(rs.next()) {
				AnswerList a = new AnswerList();
				a.setContent(rs.getString("content"));
				a.setC_id(rs.getInt("c_id"));
				a.setId(rs.getString("id"));
				a.setReg(rs.getDate("reg"));
				aList.add(a);
			}
			
			request.setAttribute("counsel", counsel);
			request.setAttribute("aList", aList);
			RequestDispatcher view = request.getRequestDispatcher("counselRes.jsp");
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
