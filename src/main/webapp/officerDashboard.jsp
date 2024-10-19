<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PMS Home</title>
    <style>
    
    	
    
    </style>
</head>
<body>
<% String name = (String) session.getAttribute("cName");
   String role = (String) session.getAttribute("role");
   
   if(name!=null && role!=null && role.equalsIgnoreCase("officer")){
%>
    <nav class="navbar">
        <div class="left-buttons">
            <a href="us4_homeui.html"><button class="nav-button">Home</button></a>
            <a href="../us6_booking/us6_booking.html"><button class="nav-button">Booking Service</button></a>
            <a href="officerTracking.jsp"><button class="nav-button">Tracking</button></a>
           <form action="allBookings" method="get"><a href="viewAllBooking.jsp"><button type="submit" class="nav-button">View all Booking</button></a></form>
            <a href=""><button class="nav-button">Contact Support</button></a>
        </div>
        <span class="nav-span" id="user">Welcome, <%= name %></span>
        <div class="right-buttons">
            <button onclick="logout()" class="nav-button">Logout</button>
        </div>
    </nav>
   <div class="container">
        <div class="text-right">
            <h3 id="welcomeMessage"></h3>
        </div>
        <div class="text-center">
            <h1>Welcome to Your Dashboard</h1>
            <img src="center.png" alt="Parcel Management">
            <div>
                <button class="btn btn-primary" onclick="window.location.href='D:/Users/2727348/Desktop/final-ui/booking/booking.html'">Book a Parcel</button>
                <button class="btn btn-secondary" onclick="window.location.href='D:/Users/2727348/Desktop/final-ui/booking-history/booking-history.html'">View Booking History</button>
                <button class="btn btn-success" onclick="window.location.href='officerTracking.jsp'">Track a Parcel</button>
                <button class="btn btn-info" onclick="window.location.href='updateStatus.jsp'">Contact Support</button>
            </div>
        </div>
    </div>
    <%}
    else{response.sendRedirect("login.jsp");
    }%>
    
   
</body>
</html>