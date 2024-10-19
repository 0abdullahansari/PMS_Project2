package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import model.User;
import dao.UserProfile;
import dao.Booking;
import java.io.IOException;
import model.BookingData;
@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   System.out.println("here going to track");
		HttpSession session = request.getSession(false);
		if(session != null){
			
		
		    int userId = (int) session.getAttribute("userId") ;
		    System.out.println("User Id: "+ userId);
		    BookingData b = (BookingData) session.getAttribute("bookingDetails");
		    Booking bks = new Booking();
 boolean didRegister = bks.createBooking((int)session.getAttribute("userId"), b.getRecName(), b.getRecAddress(),b.getRecPin() ,b.getRecMobile() , b.getParWeightgm(), b.getParContentDescription(), b.getParDeliveryType(), b.getParPackingPreference(), b.getParPickupTime(), b.getParDropoffTime(),b.getCost());

            
            System.out.println(didRegister);
		
		    
		    
		   

            request.getRequestDispatcher("invoice.jsp").forward(request, response);
		    
		}
		else{
			System.out.println("No Session Found");
			response.sendRedirect("login.jsp");
		}
	}
 
}