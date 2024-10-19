<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
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
    display: flex; 
    flex-direction: column;
    align-items: center;
    /* justify-content: center;  */
    background-color: #0E1117;
    
}


.container{

    display: flex;
    flex-direction: column;
    align-items: center;
    width: 90%; 
    max-width: 600px; 
    box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
    border-radius: 6px;
    margin-top: 100px;
    padding: 20px 15px;
    background-color: #151B23;
}

.nav-button,.nav-span { /* Customize the color to fit your design */
    
    border-radius: 8px;
    font-size: 1.4rem;
    background-color: #020408;
    color: #E9EDF2;
    padding: 7px;

}

input {
    border-radius: 6px;
    width: 100%;
    font-size: 1.6rem; 
    color: #EAF0F5;
    padding: 10px;
    background-color: #0E1117;
    border: none;  /* Removes the default border */
    outline: none; 
    /* margin: 10px 10px 10px 0px; */
    /* margin: 5px; */
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
    position: sticky;
    top: 0px;
    display: flex;
    justify-content: space-between; /* This aligns children (left-buttons, span, right-buttons) on each side */
    /* align-items: center; */
    background-color: #020408;
    padding: 5px;
}

.bill{
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.container-button{
    border-radius: 6px;
    width: 100%;
    font-size: 1.6rem; 
    padding: 10px;
    margin-top: 30px;
    margin-bottom: 20px;
    background-color: #3A8737;
    color: #E4F8EA;
}

.container-button:hover{
    cursor: pointer;
}

.container input, 
.container textarea, 
.container select {
    width: 100%; /* This ensures that all form controls expand to the full width of their parent element */
    margin: 5px 0; /* Consistent margin for all inputs */
    padding: 8px; /* Consistent padding for all inputs */
}

.container label {
    display: block; /* Makes the label take the full width and gives it block behavior */
    margin: 5px 0;
}

    </style>
</head>
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
    <%
    Double cost= (Double)request.getAttribute("cost"); %>
    <div class="container">

        
        <h1 class="header">Payment Details</h1>
        <div>

            <label>Bill Amount:</label>
            <input type="text" id="billAmount" value="${cost}" class="form-control" readonly>
            
            <label>Mode of Payment : Debit/Credit</label>
            <button class="container-button" onclick="goToPayment()">Pay Now</button>
            <button class="container-button" onclick="backToHome()">Back to Home</button>
        
        </div>
        

        <!-- Hidden Payment Form -->
        <form action="payment" method="post" id="paymentForm" style="display:none;">
            <h4 class="header">Credit Card Payment</h4>
            <div>
                <label>Card No:</label>
                <input type="number" id="cardNumber" pattern="\d{16}" placeholder="Enter 16-digit card number" required>
            </div>
            <div>
                <label>Card Holder Name:</label>
                <input type="text" id="cardHolderName"  required>
            </div>
            <div>
                <label>Expiry Date (MM/YY):</label>
                <input type="text" id="expiryDate" pattern="\d{2}/\d{2}" placeholder="MM/YY" class="form-control" required>
            </div>
            <div>
                <label>CVV:</label>
                <input type="text" id="cvv" pattern="\d{3}" placeholder="CVV"  required>
            </div>
            <button class="container-button" type="submit">Make Payment</button>
    </form>
        </div>
    <script>

function goToPayment() {
    document.getElementById('paymentForm').style.display='block';
}

function backToHome() {
    window.location.href = 'customerDashboard.jsp';
}


// function makePayment() {
//     window.location.href = '../us9_invoice/us9_invoice.html'
// }

document.getElementById('user').innerText = 'Welcome, '+localStorage.getItem('customerName')

function logout() {
    window.location.href = '../index/index.html'
}

function makePayment() {
    const cardNumber = document.getElementById('cardNumber').value.trim();
    const cardHolderName = document.getElementById('cardHolderName').value.trim();
    const expiryDate = document.getElementById('expiryDate').value.trim();
    const cvv = document.getElementById('cvv').value.trim();

    // Validate card number
    if (!cardNumber.match(/^\d{16}$/)) {
        alert('Please enter a valid 16-digit card number.');
        return;
    }

    // Validate card holder's name
    if (cardHolderName === '') {
        alert('Card holder name is required.');
        return;
    }

    // Validate expiry date
    if (!expiryDate.match(/^\d{2}\/\d{2}$/)) {
        alert('Expiry date must be in MM/YY format.');
        return;
    }

    // Validate CVV
    if (!cvv.match(/^\d{3}$/)) {
        alert('Please enter a valid 3-digit CVV.');
        return;
    }
}

    </script>
</body>
</html>
