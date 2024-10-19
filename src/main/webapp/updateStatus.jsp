<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.BookingData" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Delivery Status</title>
    <link rel="stylesheet" href="us14_delup.css">
</head>
<body>
    <nav class="navbar">
        <div class="left-buttons">
            <a href="../us5_homeuiof/us5_homeuiof.html"><button class="nav-button">Home</button></a>
            <a href="../us7_bookingof/us7_bookingof.html"><button class="nav-button">Booking Service</button></a>
            <a href="../us11_trackingof/us11_trackingof.html"><button class="nav-button">Tracking</button></a>
            <a href="../us14_delup/us14_delup.html"><button class="nav-button">Delivery Status</button></a>
            <a href="../us12_pickup/us12_pickup.html"><button class="nav-button">Pickup Scheduling</button></a>
            <a href="../us17_histof/us17_histof.html"><button class="nav-button">Previous Booking</button></a>
        </div>
        <span class="nav-span" id="user">Welcome, Name</span>
        <div class="right-buttons">
            <button onclick="logout()" class="nav-button">Logout</button>
        </div>
    </nav>

    <div class="container">
        <h1>Update Delivery Status</h1>

        <!-- Form to search for Booking ID -->
        <form method="POST" action="UpdateStatusServlet">
            <label for="bookingID">Booking ID:</label>
            <input type="text" id="bookingID" name="bookingID" placeholder="Enter Booking ID"  required>
            <button type="submit">Search</button>
        </form>

        <br>

        <!-- Display the booking details and status update form if booking found -->
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            BookingData bookingDetails = (BookingData) request.getAttribute("bookingDetails");

            if (errorMessage != null) {
        %>
            <div class="message" style="color: red;"><%= errorMessage %></div>
        <%
            } else if (bookingDetails != null) {
        %>
            <div class="message"><strong>Booking Status:</strong> <%= bookingDetails.getStatus() %></div>

            <!-- Update status form -->
            <form method="POST" action="UpdateStatusServlet">
                <label for="status">Update Status:</label>
                <select id="status" name="status">
                    <option value="Picked up">Picked up</option>
                    <option value="In Transit">In Transit</option>
                    <option value="Delivered">Delivered</option>
                    <option value="Returned">Returned</option>
                </select>
                <input type="hidden" name="bookingID" value="<%= request.getParameter("bookingID") %>">
                <button type="submit">Update</button>
            </form>
        <%
            }
        %>
    </div>
</body>
</html>