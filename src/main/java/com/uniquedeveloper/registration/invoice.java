package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class invoice
 */
@WebServlet("/invoice")
public class invoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public invoice() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idg = request.getParameter("idg");
		String ReservationID = null; 
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		System.out.println(idg);
		session.setAttribute("idg",idg);		             
        
try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hotel","root","1213");
			PreparedStatement pst = con.prepareStatement("select * from guests where GuestID = ? ");
			pst.setString(1,idg);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("firstname",rs.getString("FirstName"));
				session.setAttribute("lastname",rs.getString("LastName"));
				session.setAttribute("idg",rs.getString("GuestID"));
				session.setAttribute("phonenumber",rs.getString("PhoneNumber"));
				System.out.println(rs.getString("FirstName"));
				}				
			    PreparedStatement pst1 = con.prepareStatement("select * from reservations where GuestID = ?");
				pst1.setString(1,idg);		
				ResultSet rs1 = pst1.executeQuery();
				if (rs1.next()) {
					
					ReservationID = rs1.getString("ReservationID");
					
					System.out.println("idreservation"+ReservationID);
				}				
					PreparedStatement pst2 = con.prepareStatement("select * from payments where ReservationID =?");
					pst2.setString(1,ReservationID);
					ResultSet rs2 = pst2.executeQuery();
					if(rs2.next()) {						
					session.setAttribute("amount", rs2.getString("Amount"));
					session.setAttribute("idpayment", rs2.getString("PaymentID"));
					session.setAttribute("paymentDate", rs2.getString("PaymentDate"));
					System.out.println(rs2.getString("Amount"));
					System.out.println("idpayment"+rs2.getString("PaymentID"));																													
					}																																								
			dispatcher = request.getRequestDispatcher("invoice.jsp");
			dispatcher.forward(request, response);																																		
						
		}catch( Exception e){
			e.printStackTrace();
			
		}						
	}
}
