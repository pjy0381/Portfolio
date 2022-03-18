package com.company.mem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.common.JDBCCon;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String nAd = request.getParameter("nAd");
		String address = request.getParameter("address");
		String dAd = request.getParameter("dAd");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "insert into shopMem (id,password,name,phone,address,nAd,dAd) values(?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			stmt.setString(3, name);
			stmt.setString(4, phone);
			stmt.setString(5, address);
			stmt.setString(6, nAd);
			stmt.setString(7, dAd);
			
			stmt.executeUpdate();
			
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			
			String str="";
			str = "<script language='javascript'>";
			str += "alert('회원가입이 완료되었습니다.');";  
			str +="location.href='index.jsp'";
			str += "</script>";
			out.print(str);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
