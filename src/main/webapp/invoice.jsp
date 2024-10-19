<%@page import="model.BookingData,dao.Booking" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

body {
    color: #EEF4FA;
    background-color: #0E1117;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h1{
	margin-bottom: 5px;
}

.container {
    width: 90%;
    max-width: 600px;
    margin-top: 20px;
    padding: 20px;
    background-color: #151B23;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    display:flex;
    align-items: center;
    flex-direction: column;
}

.invoice-section {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 10px;
    margin-bottom: 20px;
}

label {
    color: #AAB4BE;
    text-align: right;
}

span {
    text-align: left;
}

button {
    padding: 10px 20px;
    background-color: #3A8737;
    color: #E4F8EA;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #297e2f;
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
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #020408;
}



</style>
<title>Insert title here</title>
</head>
<body>
<% 	
		int userid = (int) session.getAttribute("userId");

 		if(userid!=0) {
 			Booking bk = new Booking();

 	        BookingData b = bk.getLatestUserBookingHistory(userid);
	%>
	<nav class="navbar">
        <div class="left-buttons">
            <a href="../us4_homeui/us4_homeui.html"><button class="nav-button">Home</button></a>
            <a href="../us6_booking/us6_booking.html"><button class="nav-button">Booking Service</button></a>
            <a href="../us10_tracking/us10_tracking.html"><button class="nav-button">Tracking</button></a>
            <a href="../us16_hist/us16_hist.html"><button class="nav-button">Previous Booking</button></a>
            <a href="../us15_supp/us15_supp.html"><button class="nav-button">Contact Support</button></a>
        </div>
        <span class="nav-span" id="user">Welcome, <%= request.getAttribute("userName") %></span>
        <div class="right-buttons">
            <button onclick="logout()" class="nav-button">Logout</button>
        </div>
    </nav>
    
	<main class="container">
        <h1>Invoice Details</h1>
        <div class="invoice-section">
            <label>Receiver Name:</label>
            <span><%= b.getRecName() %></span>

            <label>Receiver Address:</label>
            <span><%= b.getRecAddress() %></span>

            <label>Receiver Pin:</label>
            <span><%= b.getRecPin() %></span>

            <label>Receiver Mobile:</label>
            <span><%= b.getRecMobile() %></span>

            <label>Parcel Weight (g):</label>
            <span><%= b.getParWeightgm() %></span>

            <label>Parcel Contents Description:</label>
            <span><%= b.getParContentDescription() %></span>

            <label>Parcel Delivery Type:</label>
            <span><%= b.getParDeliveryType() %></span>

            <label>Parcel Packing Preference:</label>
            <span><%= b.getParPackingPreference() %></span>

            <label>Parcel Pickup Time:</label>
            <span><%= b.getParPickupTime() %></span>

            <label>Parcel Dropoff Time:</label>
            <span><%= b.getParDropoffTime() %></span>

            <label>Parcel Service Cost:</label>
            <span><%= b.getCost() %></span>

            <label>Parcel Payment Time:</label>
            <span><%= b.getParPaymentTime() %></span>
        </div>
        <button onclick="window.print()">Print Invoice</button>
    </main>
    <% } 
    	else{
    		response.sendRedirect("login.jsp");
    	}%>
    <script src="us9_invoice.js"></script>
</body>
</html>


