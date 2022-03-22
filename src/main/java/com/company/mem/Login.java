package com.company.mem;

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
import javax.servlet.http.HttpSession;

import com.company.common.JDBCCon;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id =  request.getParameter("id");
		String password =  request.getParameter("password");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from shopMem where id = ? and password = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			
			rs=stmt.executeQuery();
			
			if(rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("name", rs.getString("name"));
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				session.setAttribute("phone", rs.getString("phone"));
				session.setAttribute("nad", rs.getString("nad"));
				session.setAttribute("address",rs.getString("address"));
				session.setAttribute("dad",rs.getString("dad"));
				response.setContentType("text/html; charset=euc-kr"); 
				PrintWriter out = response.getWriter(); 
				   
				String str="";
				str = "<script language='javascript'>";
				str += "alert('로그인 성공');";  
				str +="location.href='index.jsp'";
				str += "</script>";
				out.print(str);
			}else {
				response.setContentType("text/html; charset=utf-8"); 
				PrintWriter out = response.getWriter(); 
				   
				String str="";
				str = "<script language='javascript'>";
				str += "alert('로그인 실패');";  
				str +="location.href='index.jsp?webApp=login'";
				str += "</script>";
				out.print(str);
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
