package com.company.address;

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

import com.company.bin.AddressList;
import com.company.common.JDBCCon;

@WebServlet("/SearchAd")
public class SearchAd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dong = request.getParameter("dong");
		if (dong.equals("")) {
			response.sendRedirect("address.jsp");
		} else {

			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {
				conn = JDBCCon.getConnection();
				String sql = "select * from zipcode where dong like ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + dong + "%");

				rs = stmt.executeQuery();

				ArrayList<AddressList> adList = new ArrayList<AddressList>();
				while (rs.next()) {
					AddressList ad = new AddressList();
					ad.setId(rs.getInt("id"));
					ad.setZipcode(rs.getString("zipcode"));
					ad.setSido(rs.getString("sido"));
					ad.setGugun(rs.getString("gugun"));
					ad.setDong(rs.getString("dong"));
					ad.setRi(rs.getString("ri"));
					if(rs.getString("ri")==null) {
						ad.setRi("");
					}
					ad.setBunji(rs.getString("bunji"));
					adList.add(ad);
				}

				request.setAttribute("adList", adList);
				RequestDispatcher view = request.getRequestDispatcher("address.jsp");
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
