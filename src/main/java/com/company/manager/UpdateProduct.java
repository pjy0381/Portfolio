package com.company.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.common.JDBCCon;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = "C:\\JavaWorks2\\ShoppingMall\\src\\main\\webapp\\img"; // 저장할 경로

		int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
		String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)

		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		String str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장

		file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		
		
		
		String url = "http://localhost:8081/ShoppingMall/img/";
		url+=file;
		
		
		
		request.setCharacterEncoding("utf-8");
		String p_id = multi.getParameter("p_id");
		String p_name = multi.getParameter("p_name");
		String p_price = multi.getParameter("p_price");
		String p_categori = multi.getParameter("p_categori");
		String p_gender = multi.getParameter("p_gender");
		String p_color = multi.getParameter("p_color");
		String p_info = multi.getParameter("p_info");
		
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		
		try {
			conn = JDBCCon.getConnection();
			String sql = "update tbl_product set p_name = ?, p_price = ?, p_categori = ?, p_gender = ?, p_color = ?, p_info = ? where  p_id = ?";
			if(file != null) {
				sql = "update tbl_product set p_name = ?, p_price = ?, p_categori = ?, p_gender = ?, p_color = ?, p_info = ?,p_url = ? where  p_id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, p_name);
				stmt.setString(2, p_price);
				stmt.setString(3, p_categori);
				stmt.setString(4, p_gender);
				stmt.setString(5, p_color);
				stmt.setString(6, p_info);
				stmt.setString(7, url);
				stmt.setString(8, p_id);
			
			}else {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, p_name);
				stmt.setString(2, p_price);
				stmt.setString(3, p_categori);
				stmt.setString(4, p_gender);
				stmt.setString(5, p_color);
				stmt.setString(6, p_info);
				stmt.setString(7, p_id);
			}
			stmt.executeUpdate();
			
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			
			String str1="";
			str1 = "<script language='javascript'>";
			str1 += "alert('수정이 완료되었습니다.');";  
			str1 +="opener.document.location.reload();";
			str1 +="window.close();";
			str1 += "</script>";
			out.print(str1);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCCon.close(stmt, conn);
		}
	}
	
}
