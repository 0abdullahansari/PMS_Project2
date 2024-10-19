<%@page import="model.BookingData,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking History</title>
    <link rel="stylesheet" href="us16_hist.css">
</head>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif; /* Monospace switched to Arial for better table readability */
}

body {
    color: #EEF4FA;
    background-color: #0E1117;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.navbar {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #020408;
}

button {
    padding: 10px 15px;
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

.container {
    width: 90%;
    max-width: 800px;
    margin-top: 20px;
    padding: 20px;
    background-color: #151B23;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    text-align: center;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #333;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #020408;
}

.pagination {
    margin-top: 20px;
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


</style>
<body>
    <nav class="navbar">
        <div class="left-buttons">
            <a href="../us4_homeui/us4_homeui.html"><button class="nav-button">Home</button></a>
            <a href="../us6_booking/us6_booking.html"><button class="nav-button">Booking Service</button></a>
            <a href="../us10_tracking/us10_tracking.html"><button class="nav-button">Tracking</button></a>
            <a href="../us16_hist/us16_hist.html"><button class="nav-button">Previous Booking</button></a>
            <a href="../us15_supp/us15_supp.html"><button class="nav-button">Contact Support</button></a>
        </div>
        <span class="nav-span" id="user">Welcome, Name</span>
        <div class="right-buttons">
            <button onclick="logout()" class="nav-button">Logout</button>
        </div>
    </nav>
    <div class="container">
      
    <h1>Booking History</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Recipient Name</th>
                <th>Recipient Address</th>
                <th>Recipient Pin</th>
                <th>Recipient Mobile</th>
                <th>Parcel Description</th>
                <th>Delivery Type</th>
                <th>Pickup Time</th>
                <th>Dropoff Time</th>
                <th>Cost</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%    String errorMessage = (String) request.getAttribute("errorMessage");
                ArrayList<BookingData> bookingHistory = (ArrayList<BookingData>) request.getAttribute("bookingHistory");
               if (bookingHistory != null) {
                    for (BookingData booking : bookingHistory) {
            %>
            <tr>
                <td><%= booking.getBookingId() %></td>
                <td><%= booking.getRecName() %></td>
                <td><%= booking.getRecAddress() %></td>
                <td><%= booking.getRecPin() %></td>
                <td><%= booking.getRecMobile() %></td>
                <td><%= booking.getParContentDescription() %></td>
                <td><%= booking.getParDeliveryType() %></td>
                <td><%= booking.getParPickupTime() %></td>
                <td><%= booking.getParDropoffTime() %></td>
                <td><%= booking.getCost() %></td>
                <td><%= booking.getStatus() %></td>
            </tr>
            <%
                    }
                  }
                else{%>
                
                	<tr>
                	<td colspan="11" class="message" style="color: red;"><%= errorMessage %></td></tr>
              
              <% } %>
        </tbody>
    </table>
    </div>
  
</body>
</html>
   <!--  <script>
    const bookings = [
        { customerId: 'C1001', bookingId: 'B001', date: '2024-10-01', receiverName: 'John Doe', address: '123 Street', amount: '$100', status: 'Delivered' },
        { customerId: 'C1002', bookingId: 'B002', date: '2024-10-02', receiverName: 'Jane Doe', address: '456 Avenue', amount: '$150', status: 'In Transit' },
        { customerId: 'C1003', bookingId: 'B003', date: '2024-10-03', receiverName: 'Alice Johnson', address: '789 Boulevard', amount: '$120', status: 'Picked up' },
        { customerId: 'C1004', bookingId: 'B004', date: '2024-10-04', receiverName: 'Bob Smith', address: '101 Street', amount: '$110', status: 'Returned' },
        { customerId: 'C1005', bookingId: 'B005', date: '2024-10-05', receiverName: 'Carol White', address: '202 Avenue', amount: '$135', status: 'Delivered' },
        { customerId: 'C1006', bookingId: 'B006', date: '2024-10-06', receiverName: 'Dave Brown', address: '303 Lane', amount: '$160', status: 'In Transit' },
        { customerId: 'C1007', bookingId: 'B007', date: '2024-10-07', receiverName: 'Eve Green', address: '404 Drive', amount: '$105', status: 'Delivered' },
        { customerId: 'C1008', bookingId: 'B008', date: '2024-10-08', receiverName: 'Frank Blue', address: '505 Road', amount: '$130', status: 'Picked up' },
        { customerId: 'C1009', bookingId: 'B009', date: '2024-10-09', receiverName: 'Grace Pink', address: '606 Street', amount: '$125', status: 'Returned' },
        { customerId: 'C1010', bookingId: 'B010', date: '2024-10-10', receiverName: 'Henry Purple', address: '707 Boulevard', amount: '$140', status: 'Delivered' }
    ];


    let currentPage = 0;
    const recordsPerPage = 5;

    function displayBookings() {
        const startIndex = currentPage * recordsPerPage;
        const endIndex = startIndex + recordsPerPage;
        const visibleBookings = bookings.slice(startIndex, endIndex);

        const tbody = document.getElementById('bookingDetails');
        tbody.innerHTML = ''; // Clear previous entries
        visibleBookings.forEach(booking => {
            const row = `<tr>
                            <td>${booking.customerId}</td>
                            <td>${booking.bookingId}</td>
                            <td>${booking.date}</td>
                            <td>${booking.receiverName}</td>
                            <td>${booking.address}</td>
                            <td>${booking.amount}</td>
                            <td>${booking.status}</td>
                        </tr>`;
            tbody.innerHTML += row;
        });
    }

    function previousPage() {
        if (currentPage > 0) {
            currentPage--;
            displayBookings();
        }
    }

    function nextPage() {
        if ((currentPage + 1) * recordsPerPage < bookings.length) {
            currentPage++;
            displayBookings();
        }
    }

    displayBookings(); // Initial call to display bookings

    document.getElementById('user').innerText = 'Welcome, '+localStorage.getItem('customerName')

    function logout() {
        window.location.href = '../index/index.html'
    }

    </script> -->
</body>
</html>