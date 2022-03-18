package com.company.buy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.bin.BasketList;

@WebServlet("/DropBasket")
public class DropBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<BasketList> basketList = (ArrayList<BasketList>)session.getAttribute("basketList");
		if(request.getParameter("num")==null) {
			basketList = null;
			session.setAttribute("basketList", basketList);
		}else {
		int num = Integer.parseInt(request.getParameter("num"));
		basketList.remove(num);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
