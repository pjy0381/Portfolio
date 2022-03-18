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
import javax.servlet.http.HttpSession;

import com.company.common.JDBCCon;

@WebServlet("/Modify")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String newInfo = request.getParameter("newInfo");
		String mod = request.getParameter("mod");
		String nAd = request.getParameter("nAd");
		String dAd = request.getParameter("dAd");
		String address = request.getParameter("address");
		
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCCon.getConnection();
			
			String sql = "update shopMem set "+mod+" = ? where id = ? ";
			if(newInfo==null&&mod==null) {
				sql = "update shopMem set nAd = ?,dAd = ?, address = ? where id = ? ";
				stmt  =conn.prepareStatement(sql);
				stmt.setString(1, nAd);
				stmt.setString(2, dAd);
				stmt.setString(3, address);
				stmt.setString(4, id);
				
			}else {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, newInfo);
			stmt.setString(2, id);
			}
			int rs = stmt.executeUpdate();
			
			if(rs!=0) {
			HttpSession session = request.getSession();
			if(newInfo!=null&&mod!=null) {session.setAttribute(mod, newInfo);}
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			String str="";
			str = "변경 되었습니다.";  
			out.print(str);
			}else {
				response.setContentType("text/html; charset=utf-8"); 
				PrintWriter out = response.getWriter();
				String str="";
				str = "오류 발생";  
				out.print(str);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(stmt, conn);
		}
	}

}
