<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PMS Home</title>
    <style>
    	
    	* {
    margin: 0;
    padding: 0;
    font-family: monospace;
    box-sizing: border-box;
    /* border: 1px solid black; */
}

body{
    color: #EEF4FA;
    /* height: 100vh; */
    /* display: flex;
    flex-direction: column;
    align-items: center; */
    /* justify-content: center; */
    background-color: #0E1117;
}

.nav-button,.nav-span { /* Customize the color to fit your design */
    
    border-radius: 8px;
    font-size: 1.4rem;
    background-color: #020408;
    color: #E9EDF2;
    padding: 7px;

}

.nav-button{
    border: 1px solid ;
}

.nav-button:hover{
    cursor: pointer;
    background-color: #242937;
}

.navbar { 
    position: sticky;
    top: 0px;
    display: flex;
    justify-content: space-between; /* This aligns children (left-buttons, span, right-buttons) on each side */
    align-items: center;
    background-color: #020408;
    padding: 5px;
}

form{
display:inline;
}
  #welcomeMessage {
    font-size: 18px;
}

.container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
  
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
}
.container img{
    margin: auto 10px;
    max-width: 20%;
    
}
h1 {
    text-align: center;
    color: #ffffff;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    margin: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    font-size: 16px;
}

.btn-primary {
    background-color: #007bff;
    color: white;
}

.btn-secondary {
    background-color: #6c757d;
    color: white;
}

.btn-success {
    background-color: #28a745;
    color: white;
}

.btn-info {
    background-color: #17a2b8;
    color: white;
}

.btn-danger {
    background-color: #dc3545;
    color: white;
}

.btn:hover {
    opacity: 0.9;
}

.text-center {
    text-align: center;
}

.text-right {
    text-align: right;
}
    	
    	
    </style>
</head>
<body>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

String name = (String) session.getAttribute("cName");
   
String role = (String) session.getAttribute("crole");
System.out.println(name);
System.out.println(role);
if(name!=null && role != null && role.equalsIgnoreCase("customer")){
%>
    <nav class="navbar">
        <div class="left-buttons">
            <a href="us4_homeui.html"><button class="nav-button">Home</button></a>
            <a href="booking.jsp"><button class="nav-button">Booking Service</button></a>
            <a href="tracking.jsp"><button class="nav-button">Tracking</button></a>
            <form action="viewBookings" method="get"><a href="viewBooking.jsp"><button type="submit" class="nav-button">Previous Booking</button></a></form>
            <a href="../us15_supp/us15_supp.html"><button class="nav-button">Contact Support</button></a>
        </div>
        <span class="nav-span" id="user">Welcome, <%= name %></span>
        <div class="right-buttons">
        <form action="logout" method="get">
        <button type="submit" class="nav-button">Logout</button>
        </form>
            
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
                <button class="btn btn-success" onclick="window.location.href='D:/Users/2727348/Desktop/final-ui/tracking-status/tracking-status.html'">Track a Parcel</button>
                <button class="btn btn-info" onclick="window.location.href='D:/Users/2727348/Desktop/final-ui/support/support.html'">Contact Support</button>
            </div>
        </div>
    </div>
    <%}
    else{response.sendRedirect("login.jsp");
    }%>
    
   
</body>
</html>