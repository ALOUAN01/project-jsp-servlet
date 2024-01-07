package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;   //apartire de tomcat 10 on a besoin de jakarta

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logingpage
 */
@WebServlet("/login")
public class logingpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hotel","root","1213");
			PreparedStatement pst = con.prepareStatement("select * from guests where email = ? and password = ?");
			pst.setString(1,email);
			pst.setString(2,password);
			
			ResultSet rs = pst.executeQuery();
			
			if (rs.next()) {
			session.setAttribute("email", rs.getString("email"));
			session.setAttribute("firstname",rs.getString("FirstName"));
			session.setAttribute("lastname",rs.getString("LastName"));
			session.setAttribute("idg",rs.getString("GuestID"));
			session.setAttribute("phonenumber",rs.getString("PhoneNumber"));
			String id = rs.getString("GuestID");
			
			dispatcher = request.getRequestDispatcher("index.jsp");
			
			
			} else {
				dispatcher = request.getRequestDispatcher("login1.jsp");
				
			}
			
			dispatcher.forward(request, response);
			
		}catch( Exception e){
			e.printStackTrace();
			
		}
		
	}
	
	
	
	
	
	
	

}
