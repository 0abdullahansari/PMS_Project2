<%@page import="model.BookingData" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Your Parcel</title>
    <link rel="stylesheet" href="us10_tracking.css">
    <style>
		*{
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
		
		.container {
		    width: 90%;
		    max-width: 600px;
		    margin-top: 50px;
		    padding: 20px;
		    background-color: #151B23;
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		    text-align: center;
		}
		
		input[type="text"] {
		    width: calc(100% - 20px);
		    padding: 10px;
		    margin: 10px 0;
		    border-radius: 6px;
		    border: 1px solid #333;
		    background-color: #020408;
		    color: #E9EDF2;
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
		
		.tracking-result {
		    margin-top: 20px;
		    padding: 10px;
		    background-color: #020408;
		    color: #E9EDF2;
		    border-radius: 6px;
		    width: 100%;
		    box-sizing: border-box;
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
		    width: 100%;
		    display: flex;
		    justify-content: space-between; /* This aligns children (left-buttons, span, right-buttons) on each side */
		    align-items: center;
		    background-color: #020408;
		    padding: 5px;
		}
    </style>
</head>
<body>
	<% 	
		String name = (String) session.getAttribute("cName");
 		if(name!=null) {
	%>
		    <nav class="navbar">
		        <div class="left-buttons">
		            <a href="#"><button class="nav-button">Home</button></a>
		            <a href="#"><button class="nav-button">Booking Service</button></a>
		            <a href="#"><button class="nav-button">Tracking</button></a>
		            <a href="#"><button class="nav-button">Previous Booking</button></a>
		            <a href="#"><button class="nav-button">Contact Support</button></a>
		        </div>
		        <span class="nav-span" id="user">Welcome, <%= name  %>></span>
		        <div class="right-buttons">
		            <button onclick="logout()" class="nav-button">Logout</button>
		        </div>
		    </nav>
		    <div class="container">
		        <h1>Track Your Parcel</h1>
		        <form id="trackingForm" method="post" action="userTracking">
		            <label for="bookingID">Booking ID:</label>
		            <input type="text" id="bookingId" name="bookingId" placeholder="Enter your Booking ID"  value="<%= request.getParameter("bookingId") != null ? request.getParameter("bookingId") :"" %>"required>
		            <div id="bookinglError" class="error">
        				<%= request.getAttribute("bookingError") != null ? request.getAttribute("bookingError") : "" %>
    				</div>
		            <button type="submit" >Search</button>
		        </form>
		        
		        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            BookingData bookingDetails = (BookingData) request.getAttribute("bookingDetails");

            if (errorMessage != null) {
        %>
            <div class="message" style="color: red;"><%= errorMessage %></div>
        <%
            } else if (bookingDetails != null) {
        %>
		        <div id="trackingResult" class="tracking-result">
		            <!-- Tracking info will be displayed here -->
		       
			        <h1>Tracking Detailss</h1>
			        <div class="invoice-section">
			        	<label>Booking ID :</label>
			            <span><%= bookingDetails.getBookingId() %></span>
			            
			        	<label>Sender Name: <%= name  %> </label>
			            
			            <label>Receiver Name:</label>
			            <span><%= bookingDetails.getRecName() %></span>
			
			            <label>Receiver Address:</label>
			            <span><%= bookingDetails.getRecAddress() %></span>
	
			
			            <label>Booking Time:</label>
			            <span><%= bookingDetails.getParPaymentTime() %></span>
			            
			             <label>Booking Status:</label>
			            <span><%= bookingDetails.getStatus() %></span>
			
			     	</div>

		        </div>
		        <%
            }
        %>
		    </div>
    	<% } 
    	else{
    		response.sendRedirect("login.jsp");
    	}%>
</body>
</html>
