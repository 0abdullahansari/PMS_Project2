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
@WebServlet("/officerTracking")
public class OfficerTracking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   System.out.println("here going to track");
		HttpSession session = request.getSession(false);
		if(session != null){
			
		System.out.println("here going to track");
		   // String email = request.getParameter("email");
		    int userId = (int) session.getAttribute("userId") ;
		    System.out.println("User Id: "+ userId);
		    int bid =  Integer.parseInt(request.getParameter("bookingId"));
		    System.out.println("Booking Id: "+ bid);
		    
		
		   
		    if (bid == 0) {
                request.setAttribute("errorMessage", "Please enter a valid Booking ID.");
                request.getRequestDispatcher("officerTracking.jsp").forward(request, response);
                return;
            }
		
		    
		    System.out.println("Here dont know");
		     Booking b = new Booking();
		    BookingData bks = b.getBookingDetails(bid) ;
		    if (bks == null) {
                request.setAttribute("errorMessage", "Booking ID not found.");
            } else {
                request.setAttribute("bookingDetails", bks);
            }

            request.getRequestDispatcher("officerTracking.jsp").forward(request, response);
		    
		}
		else{
			System.out.println("No Session Found");
			response.sendRedirect("login.jsp");
		}
	}
 
}