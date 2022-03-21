package com.company.buy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.bin.BasketList;
import com.company.common.JDBCCon;

@WebServlet("/NewOrder")
public class NewOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String nAd = request.getParameter("nAd");
		String address = request.getParameter("address");
		String dAd = request.getParameter("dAd");
		String payment = request.getParameter("payment");
		String price = request.getParameter("price");
		String o_name = request.getParameter("o_name");
		int p_id = Integer.parseInt(request.getParameter("p_id")) ;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "insert into tbl_order (o_id,id,o_name,name,phone,address,nAd,dAd,pay,price,p_id) values((select nvl(max(o_id),0)+1 from tbl_order),?,?,?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, o_name);
			stmt.setString(3, name);
			stmt.setString(4, phone);
			stmt.setString(5, address);
			stmt.setString(6, nAd);
			stmt.setString(7, dAd);
			stmt.setString(8, payment);
			stmt.setString(9, price);
			stmt.setInt(10, p_id);
			
			stmt.executeUpdate();
			
			HttpSession session = request.getSession();
			ArrayList<BasketList> basketList = null;
			session.setAttribute("basketList", basketList);
			
			
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			
			String str="";
			str = "<script language='javascript'>";
			str += "alert('주문이 완료되었습니다.');";  
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
