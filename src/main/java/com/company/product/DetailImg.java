package com.company.product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/DetailImg")
public class DetailImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "C:\\JavaWorks2\\ShoppingMall\\src\\main\\webapp\\img\\detail"; // 저장할 경로

		int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
		String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)

		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

			Enumeration<?> files = multi.getFileNames();
			String str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장

			file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
			System.out.println(file);

			request.setCharacterEncoding("utf-8");
			int p_id = Integer.parseInt(multi.getParameter("p_id"));
			
			String url = "/img/detail/";
			url+=file;
			
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {
				conn = JDBCCon.getConnection();
				String sql = "select nvl(max(p_id),0)+1 from tbl_product";
				if(p_id == 0) {
					stmt  = conn.prepareStatement(sql);
				
				
					rs = stmt.executeQuery();
					if(rs.next()) {
						p_id = rs.getInt(1);
	
					}
					stmt.close();
					rs.close();
				}

				
				sql = "insert into tbl_img(url,p_id,id) values(?,?,(select nvl(max(id),0)+1 from tbl_img))";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, url);
				stmt.setInt(2, p_id);
				stmt.executeUpdate();

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCCon.close(stmt, conn);
			}

		} catch (Exception e) {

		}
	}

}
