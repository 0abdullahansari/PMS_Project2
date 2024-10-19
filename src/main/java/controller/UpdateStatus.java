package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Booking;
import model.BookingData;
@WebServlet("/UpdateStatusServlet")
public class UpdateStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingIDStr = request.getParameter("bookingID");
        String status = request.getParameter("status");

        if (status == null) {
            // Handle search for booking details
            if (bookingIDStr == null || bookingIDStr.isEmpty()) {
                request.setAttribute("errorMessage", "Please enter a valid Booking ID.");
                request.getRequestDispatcher("updateStatus.jsp").forward(request, response);
                return;
            }

            int bookingID = Integer.parseInt(bookingIDStr);
            Booking bookingDAO = new Booking();

            // Fetch booking details from the database
            BookingData bookingDetails = bookingDAO.getBookingDetails(bookingID);
            if (bookingDetails == null) {
                request.setAttribute("errorMessage", "Booking ID not found.");
            } else {
                request.setAttribute("bookingDetails", bookingDetails);
            }

            request.getRequestDispatcher("updateStatus.jsp").forward(request, response);
        } else {
            // Handle updating the status
            int bookingID = Integer.parseInt(bookingIDStr);
            Booking bookingDAO = new Booking();

            boolean isUpdated = bookingDAO.updateBookingStatus(bookingID, status);
            if (isUpdated) {
                request.setAttribute("message", "Status updated successfully.");
            } else {
                request.setAttribute("errorMessage", "Error updating status.");
            }

            request.getRequestDispatcher("updateStatus.jsp").forward(request, response);
        }
    }
}
