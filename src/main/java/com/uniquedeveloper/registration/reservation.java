package com.uniquedeveloper.registration;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;
import javax.activation.*;
/**
 * Servlet implementation class reservation
 */
@WebServlet("/reservation")
public class reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String GuestID = request.getParameter("idguest");
		String email = request.getParameter("Email");
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		String RoomType = request.getParameter("typeRoom");
		String BedNumbers = request.getParameter("numberAdulte");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String  RoomID = null;
		String  name = null;
		String Lname=null;
		double rate = 0;
		String ro=null;
		String ReservationID=null;
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate dateCheckin = LocalDate.parse(checkin, formatter);
        LocalDate dateCheckout = LocalDate.parse(checkout, formatter);
        long daysBetween = ChronoUnit.DAYS.between(dateCheckin, dateCheckout);
        double ratetotal=0;
        String av = "Available" ;    
try {       
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hotel?useSSL=false","root","1213");
			PreparedStatement pre = con.prepareStatement("select * from guests where GuestID = ? ");
			pre.setString(1,GuestID);
			ResultSet rsss = pre.executeQuery();
			if (rsss.next()) {
				
				
				name=rsss.getString("FirstName");
				Lname=rsss.getString("LastName");
				
				
				
				System.out.println("okkkkkkkk");
				
				
				
				
				} else {
					System.out.println("not okkkkkkkk");
					
				}
			
			
			
			PreparedStatement pst = con.prepareStatement("select * from rooms where RoomType = ? and BedNumbers = ? and Availability = ?");
			pst.setString(1,RoomType);
			pst.setString(2,BedNumbers);
			pst.setString(3,av );
			ResultSet rs = pst.executeQuery();
			
			            while (rs.next()) {
			            RoomID= rs.getString("RoomID");
			            rate = rs.getDouble("Rate");
			            ro = rs.getString("RoomNumber");
			            ratetotal=daysBetween*rate;
			           
			            
			            break;
			            
			            }
			            System.out.println(RoomID);
			        	
			if( RoomID != null) {
				
			
				PreparedStatement pst2 = con.prepareStatement("insert into reservations(GuestID,RoomID,CheckInDate,CheckOutDate) values(?,?,?,?)");
			
				pst2.setString(1,GuestID);
				pst2.setString(2, RoomID);
				pst2.setDate(3, java.sql.Date.valueOf(dateCheckin));
				pst2.setDate(4,java.sql.Date.valueOf(dateCheckout));
				int rowCount = pst2.executeUpdate();
										
				if(rowCount > 0) {
					   
					
					
					
					
					
					 PreparedStatement updateAvailability = con.prepareStatement("UPDATE rooms SET Availability = 'Booked' WHERE RoomID = ?");
					    updateAvailability.setString(1, RoomID);
					    int updateCount = updateAvailability.executeUpdate();

					    if (updateCount > 0) {
					       
					    } else {
					        
					        request.setAttribute("status", "Failed");
					    }
					
					
					
					
					
					
					PreparedStatement pst3 = con.prepareStatement("select * from reservations where GuestID = ? and  RoomID = ?");
					pst3.setString(1,GuestID);
					pst3.setString(2, RoomID);
					System.out.println("guest"+GuestID);
					System.out.println("room"+RoomID);
				
					ResultSet rs1 = pst3.executeQuery();
					if (rs1.next()) {
						
						ReservationID = rs1.getString("ReservationID");
						System.out.println("checkDate"+ReservationID);
						PreparedStatement pst4 = con.prepareStatement("insert into payments(ReservationID,Amount,PaymentDate) values(?,?,?)");
						pst4.setString(1,ReservationID);
						pst4.setDouble(2,ratetotal);
						pst4.setDate(3, java.sql.Date.valueOf(currentDate));
						int rowCount1 = pst4.executeUpdate();
						dispatcher = request.getRequestDispatcher("reservation.jsp");
						if(rowCount1 > 0) {
						
							request.setAttribute("status" , "success");
							sendEmail(name,Lname,email,ro);
							
							
							
						}else {
							request.setAttribute("status", "Failed");
							
							}
						
						
					}
					
					
					
					
					
					
					}
				} else {
					dispatcher = request.getRequestDispatcher("reservation.jsp");
					request.setAttribute("status", "failed");
				}  
			dispatcher.forward(request, response);
			            
			        
			    
			
			
			
		}catch( Exception e){
			e.printStackTrace();
		}

	}
	
	
	
	
	private void sendEmail( String firstname,String lastname,String email,String roomn ) {
       
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        // Créer une session de messagerie avec ou sans authentification
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("elhasalayoub@gmail.com","dxmmbuplarllwpqk"); // Remplacez par votre adresse e-mail et mot de passe
            }
        });

        try {
            // Créer un message
            Message message = new MimeMessage(session);
            
            message.setFrom(new InternetAddress("elhasalayoub@gmail.com")); // Remplacez par votre adresse e-mail
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("Confirmation de réservation");
            message.setText("Hi Mr/Mm"+firstname+"\t"+lastname+",\n\nVotre réservation a été confirmée avec succès\n\n Your RoomNumber is"+roomn+  "\n\nyou can see more details about your reservation in your account.");
            // Envoyer le message
            Transport.send(message);

            System.out.println("E-mail envoyé avec succès.");

        } catch (MessagingException e) {
            e.printStackTrace();
            // Gérer les erreurs d'envoi d'e-mail
        }
    }

	
	
	
	
	

}



