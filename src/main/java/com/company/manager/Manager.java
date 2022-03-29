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

import com.company.bin.CounselList;
import com.company.bin.MemberBin;
import com.company.bin.OrderList;
import com.company.bin.ProductList;
import com.company.common.JDBCCon;

@WebServlet("/Manager")
public class Manager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "select * from tbl_order order by o_id desc";
			stmt = conn.prepareStatement(sql);
			
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
			
			rs.close();
			stmt.close();
			
			sql = "select * from shopMem order by reg";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			ArrayList<MemberBin> mList = new ArrayList<MemberBin>();
			while(rs.next()) {
				MemberBin mem = new MemberBin();
				mem.setId(rs.getString("id"));
				mem.setPassword(rs.getString("password"));
				mem.setName(rs.getString("name"));
				mem.setPhone(rs.getString("phone"));
				mem.setAddress(rs.getString("address"));
				mem.setReg(rs.getDate("reg"));
				mem.setnAd(rs.getString("nAd"));
				mem.setdAd(rs.getString("dAd"));
				mem.setGrade(rs.getString("grade"));
				mList.add(mem);
			}
			
			rs.close();
			stmt.close();
			
			sql = "select * from tbl_product order by p_id desc";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			ArrayList<ProductList> pList = new ArrayList<ProductList>();
			while (rs.next()) {
				ProductList p = new ProductList();
				p.setP_id(rs.getInt("p_id"));
				p.setP_name(rs.getString("p_name"));
				p.setP_price(rs.getInt("p_price"));
				p.setP_categori(rs.getString("p_categori"));
				p.setP_desc(rs.getString("p_desc"));
				p.setP_url(rs.getString("p_url"));
				p.setP_color(rs.getString("p_color"));
				p.setP_gender(rs.getString("p_gender"));
				p.setEvent(rs.getString("event"));
				p.setSale(rs.getInt("sale"));
				p.setP_info(rs.getString("p_info"));
				pList.add(p);
			}
			rs.close();
			stmt.close();
			
			sql = "select * from tbl_counsel order by reg";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			ArrayList<CounselList> cList = new ArrayList<CounselList>();
			while(rs.next()) {
				CounselList counsel = new CounselList();
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
				cList.add(counsel);
			}
			
			request.setAttribute("oList", oList);
			request.setAttribute("mList", mList);
			request.setAttribute("pList", pList);
			request.setAttribute("cList", cList);
			RequestDispatcher view = request.getRequestDispatcher("managerPage.jsp");
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
