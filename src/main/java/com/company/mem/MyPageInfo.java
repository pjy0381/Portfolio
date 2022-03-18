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
import javax.servlet.http.HttpSession;

import com.company.bin.MemberBin;
import com.company.bin.OrderList;
import com.company.bin.WishList;
import com.company.common.JDBCCon;

@WebServlet("/MyPageInfo")
public class MyPageInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("index.jsp?webApp=login");
		} else {

			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {
				conn = JDBCCon.getConnection();
				String sql = "select * from shopMem where id=? ";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);

				rs = stmt.executeQuery();
				
				MemberBin mem = null;
				
				if (rs.next()) {
					mem = new MemberBin();
					mem.setId(rs.getString("id"));
					mem.setPassword(rs.getString("password"));
					mem.setName(rs.getString("name"));
					mem.setPhone(rs.getString("phone"));
					mem.setAddress(rs.getString("address"));
					mem.setnAd(rs.getString("nAd"));
					mem.setdAd(rs.getString("dAd"));
				}
				rs.close();
				stmt.close();
				
				sql = "select * from tbl_order where id = ? order by o_id desc";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, mem.getId());
				
				rs = stmt.executeQuery();
				
				ArrayList<OrderList> oList = new ArrayList<OrderList>();
				while(rs.next()) {
					OrderList order = new OrderList();
					order.setO_id(rs.getInt("o_id"));
					order.setId(rs.getString("id"));
					order.setO_name(rs.getString("o_name"));
					order.setName(rs.getString("name"));
					order.setPhone(rs.getString("phone"));
					order.setnAd(rs.getString("nad"));
					order.setAddress(rs.getString("address"));
					order.setdAd(rs.getString("dad"));
					order.setPay(rs.getString("pay"));
					order.setPrice(rs.getInt("price"));
					order.setState(rs.getString("state"));
					order.setReview(rs.getString("review"));
					order.setPdate(rs.getDate("pdate"));
					order.setP_id(rs.getInt("p_id"));
					oList.add(order);
				}
				
				sql = "select * from tbl_pick where id = ? and pick = 'yes'";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				
				rs = stmt.executeQuery();
				
				ArrayList<WishList> wList = new ArrayList<WishList>();
				while(rs.next()) {
					WishList wish = new WishList();
					wish.setId(rs.getString("id"));
					wish.setIp(rs.getString("ip"));
					wish.setP_id(rs.getInt("p_id"));
					wish.setPick(rs.getString("pick"));
					wish.setP_name(rs.getString("p_name"));
					wList.add(wish);
				}
				
				request.setAttribute("mem", mem);
				request.setAttribute("oList", oList);
				request.setAttribute("wList", wList);
				RequestDispatcher view = request.getRequestDispatcher("index.jsp?webApp=myPage");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
