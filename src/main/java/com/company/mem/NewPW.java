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

@WebServlet("/NewPW")
public class NewPW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id =  request.getParameter("id");
		String name =  request.getParameter("name");
		String password =  request.getParameter("password");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "update shopMem set password = ? where id = ? and name = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, password);
			stmt.setString(2, id);
			stmt.setString(3, name);
			
			int rs = stmt.executeUpdate();
			
			if(rs!=0) {
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			String str="";
			str = "<script language='javascript'>";
			str += "alert('비밀번호가 변경 되었습니다.');";  
			str +="window.close()";
			str += "</script>";
			out.print(str);
			}else {
				response.setContentType("text/html; charset=utf-8"); 
				PrintWriter out = response.getWriter();
				String str="";
				str = "<script language='javascript'>";
				str += "alert('오류 발생');";  
				str +="window.close()";
				str += "</script>";
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
