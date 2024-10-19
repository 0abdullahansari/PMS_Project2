package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import model.BookingData;
import dao.Booking;

import javax.servlet.*;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	if(session != null){
    		
    		
    		
    		
    		// Retrieve form data using request.getParameter
            String senderName = request.getParameter("senderName");
            System.out.println(senderName);
            String senderAddress = request.getParameter("senderAddress");
            System.out.println(senderAddress);
            String senderContact = request.getParameter("senderContact");
            System.out.println(senderContact);
            String recName = request.getParameter("receiverName");
            System.out.println(recName);
            String recAddress = request.getParameter("receiverAddress");
            System.out.println(recAddress);
            String recPinCode = request.getParameter("receiverPinCode");
            System.out.println(recPinCode);
            String recContact = request.getParameter("receiverContact");
            System.out.println(recContact);
            String volume = request.getParameter("volume");
            System.out.println(volume);
            String weight = request.getParameter("weight");
            System.out.println(weight);
            String contentsDescription = request.getParameter("contentsDescription");
            System.out.println(contentsDescription);
            
            String deliverySpeed = request.getParameter("deliverySpeed");
            System.out.println(deliverySpeed);
            String packagingPreferences = request.getParameter("packagingPreferences");
            System.out.println(packagingPreferences);
            String pickupTime = request.getParameter("pickupTime");
            System.out.println(pickupTime);
            String dropTime = request.getParameter("dropTime");
            System.out.println(dropTime);
            
            String paymentMethod = request.getParameter("paymentMethod");
            String insuranceOptions = request.getParameter("insuranceOptions");
            String trackingServices = request.getParameter("trackingServices");

//             Perform basic validation or processing
            if (recName.isEmpty() || recAddress.isEmpty() || recPinCode.isEmpty()) {
                response.getWriter().println("Please fill in all required receiver fields.");
                return;
            }
            System.out.println(pickupTime);
            //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a");
            LocalDateTime pickup = LocalDateTime.parse(pickupTime);
            LocalDateTime droptime = LocalDateTime.parse(dropTime);
            
            
            Double cost = PricingCalculator.calculateCost(deliverySpeed, packagingPreferences, insuranceOptions, trackingServices);
            // Additional business logic here
            
            BookingData b = new BookingData((int)session.getAttribute("userId"), recName, recAddress, recPinCode, recContact, Integer.parseInt(weight), contentsDescription, deliverySpeed, packagingPreferences, Timestamp.valueOf(pickup), Timestamp.valueOf(droptime),cost);
            
            System.out.println(cost);
            session.setAttribute("bookingDetails", b);
            request.setAttribute("cost",cost);
           
            // For example, save the data to a database, call another service, etc.
            
            
     request.getRequestDispatcher("pay.jsp").forward(request, response);

            // Respond to client
    		
    	} else{
    		response.sendRedirect("login.jsp");
    	}
    	
        
        
    }
}

class PricingCalculator {

    private static final Map<String, Double> pricing = new HashMap<>();

    static {
        pricing.put("none", 0.0);
        pricing.put("standard", 10.0);
        pricing.put("express", 20.0);
        pricing.put("standard", 0.0);
        pricing.put("custom", 5.0);
        pricing.put("ecoFriendly", 3.0);
        pricing.put("fragileItem", 10.0);
        pricing.put("basicInsurance", 15.0);
        pricing.put("fullInsurance", 30.0);
        pricing.put("basicTracking", 5.0);
        pricing.put("premiumTracking", 10.0);
    }

    public static Double calculateCost(String deliverySpeed, String packagingPreferences, String insuranceOptions, String trackingServices) {
        Double cost = 0.0;
        cost += pricing.getOrDefault(deliverySpeed, 0.0);
        cost += pricing.getOrDefault(packagingPreferences, 0.0);
        cost += pricing.getOrDefault(insuranceOptions, 0.0);
        cost += pricing.getOrDefault(trackingServices, 0.0);
        
        return cost;
    }

    
}