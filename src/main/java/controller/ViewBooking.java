package controller;

import model.BookingData;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import dao.Booking;

@WebServlet("/viewBookings")
public class ViewBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch userID from session
        HttpSession session = request.getSession(false);
        if(session != null){
        int userId = (int) session.getAttribute("userId");

        Booking b = new Booking();
        // Fetch booking history from the method
        ArrayList<BookingData> bookingHistory = b.getUserBookingHistory(userId);
      
        System.out.println("Here at viewbooking");
        // Set the booking history in request scope
        if (bookingHistory == null) {
        	System.out.println("Here in viewbooking"+bookingHistory.isEmpty());
            request.setAttribute("errorMessage", "Booking ID not found.");
        }else{
        request.setAttribute("bookingHistory", bookingHistory);
        }

        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewBooking.jsp");
        dispatcher.forward(request, response);
        }
    	else{
    		System.out.println("No Session Found");
    		response.sendRedirect("login.jsp");
    	}
    }

//    private ArrayList<BookingData> getUserBookingHistory(int userID) {
//        // Replace this with your actual method implementation to fetch data from the database
//        ArrayList<BookingData> bookingHistory = new ArrayList<>();
//        // Mock data for testing purpose
//        bookingHistory.add(new BookingData(1, userID, "John Doe", "123 Street", "123456", "9999999999", 1, "Laptop", "Express", "Eco", null, null, 500.0, null, "Delivered"));
//        return bookingHistory;
    
    }

