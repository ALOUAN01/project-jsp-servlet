package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lastname = request.getParameter("LastName");
		String firstname = request.getParameter("FirstName");
		String phonenumber = request.getParameter("PhoneNumber");
		String email = request.getParameter("email");
		String password = request.getParameter("Password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection con = null;  
		
try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hotel?useSSL=false","root","1213");
			System.out.println("hiiiiii");
			PreparedStatement pst = con.prepareStatement("insert into guests(FirstName,LastName,email,password,PhoneNumber) values(?,?,?,?,?)");
			pst.setString(1,firstname);
			pst.setString(2,lastname);
			pst.setString(3,email);
			pst.setString(4,password);
			pst.setString(5,phonenumber);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("login1.jsp");
			if (rowCount > 0) {
				request.setAttribute("status" , "success");
				
				
										
			} else {
				request.setAttribute("status", "Failed");
				
			}
			dispatcher.forward(request, response);
			
		}catch( Exception e){
			e.printStackTrace();
		}finally{
			
			try {
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}

}
