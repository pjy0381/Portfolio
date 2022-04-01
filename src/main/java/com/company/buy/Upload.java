package com.company.buy;

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

@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			String path = "C:\\JavaWorks2\\ShoppingMall\\src\\main\\webapp\\img\\reviews"; // 저장할 경로

		    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
		    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)

		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

	        Enumeration<?> files = multi.getFileNames();
	        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

	        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
	        
	    	String r_url = "img/reviews/"+file;
	        
	        
	        request.setCharacterEncoding("utf-8");
			String p_id = multi.getParameter("p_id");
			String writer = multi.getParameter("writer");
			String r_content = multi.getParameter("r_content");
			
			
			double r_grade = Double.parseDouble(multi.getParameter("r_grade"));
			int o_id = Integer.parseInt(multi.getParameter("o_id"));
			
			
			Connection conn = null;
			PreparedStatement stmt = null;
			
			try {
				
				
				
				conn = JDBCCon.getConnection();
				String sql = "insert into tbl_reivews(r_id,p_id,writer,r_content,r_url,r_grade) values((select nvl(max(r_id),0)+1 from tbl_reivews),?,?,?,?,?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, p_id);
				stmt.setString(2, writer);
				stmt.setString(3, r_content);
				stmt.setString(4, r_url);
				stmt.setDouble(5, r_grade);
				
				stmt.executeUpdate();
				
				stmt.close();
				
				sql = "update tbl_order set review = 'yes' where  o_id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, o_id);
				stmt.executeUpdate();
				
				response.setContentType("text/html; charset=utf-8"); 
				PrintWriter out = response.getWriter(); 
				   
				String str1="";
				str1 = "<script language='javascript'>";
				str1 += "alert('리뷰 작성 완료');";  
				str1 +="window.close()";
				str1 += "</script>";
				out.print(str1);
				
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCCon.close(stmt, conn);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
