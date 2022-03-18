package com.company.mem;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.company.common.JDBCCon;

@WebServlet("/FindPW")
public class FindPW extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from shopMem where name = ? and id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, id);

			rs = stmt.executeQuery();

			if (rs.next()) {
				request.setAttribute("name", name);
				request.setAttribute("id", id);
				RequestDispatcher view = request.getRequestDispatcher("newPW.jsp");
				view.forward(request, response);
			}else {
				
				response.setContentType("text/html; charset=utf-8"); 
				PrintWriter out = response.getWriter();
				String str="";
				str = "<script language='javascript'>";
				str += "alert('정보가 일치하지 않습니다.');";  
				str +="location.href='findPW.jsp'";
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
