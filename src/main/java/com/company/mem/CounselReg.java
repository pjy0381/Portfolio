package com.company.mem;

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

@WebServlet("/CounselReg")
public class CounselReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "C:\\JavaWorks2\\ShoppingMall\\src\\main\\webapp\\img\\counsel"; // 저장할 경로

	    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
	    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)

	try {
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

        Enumeration<?> files = multi.getFileNames();
        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
        
        request.setCharacterEncoding("utf-8");
		String c_categori = multi.getParameter("c_categori");
		String id = multi.getParameter("id");
		String phone = multi.getParameter("phone");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String c_url = "/img/counsel/"+file;
		int o_id = Integer.parseInt(multi.getParameter("o_id"));
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			
			
			
			conn = JDBCCon.getConnection();
			String sql = "insert into tbl_counsel(c_id,c_categori,o_id,id,phone,title,content,c_url) values((select nvl(max(c_id),0)+1 from tbl_counsel),?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c_categori);
			stmt.setInt(2, o_id);
			stmt.setString(3, id);
			stmt.setString(4, phone);
			stmt.setString(5, title);
			stmt.setString(6, content);
			stmt.setString(7, c_url);
			
			stmt.executeUpdate();
			
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			
			String str1="";
			str1 = "<script language='javascript'>";
			str1 += "alert('등록 완료되었습니다.');";  
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

	} catch (Exception e) {
		e.printStackTrace();
	}
	

	}

}
