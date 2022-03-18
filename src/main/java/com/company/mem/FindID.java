package com.company.mem;

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
import com.company.bin.MemberBin;
import com.company.common.JDBCCon;

@WebServlet("/FindID")
public class FindID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from shopMem where name = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);

			rs = stmt.executeQuery();

			ArrayList<MemberBin> memList = new ArrayList<MemberBin>();
			while (rs.next()) {
				MemberBin mem = new MemberBin();
				mem.setId(rs.getString("id"));
				mem.setName(rs.getString("name"));
				memList.add(mem);
			}

			request.setAttribute("memList", memList);
			request.setAttribute("name", name);
			RequestDispatcher view = request.getRequestDispatcher("findID.jsp");
			view.forward(request, response);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(rs, stmt, conn);
		}
	
	}

}
