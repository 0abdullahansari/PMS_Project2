<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Service</title>
    <style type="text/css">
    
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
    align-items: center;
    justify-content: center; */
    background-color: #0E1117;
    
}

.container{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

h1{
    text-align: center;
    margin: 10px;
    font-size: 4rem;
}

form{
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 90%; 
    max-width: 1000px; 
    box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
    border-radius: 6px;
    margin: 20px;
    padding: 20px 15px;
    background-color: #151B23;
}

.form-div{
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
}

label{
    font-size: 1.6rem;
    padding: 10px 0px;
    width: 100%;
    /* display: block;
    text-align: left; */
}

select,textarea,input {
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

.form-button{
    border-radius: 6px;
    width: 100%;
    font-size: 1.6rem; 
    padding: 10px;
    margin-top: 20px;
    margin-bottom: 15px;
    background-color: #3A8737;
    color: #E4F8EA;
}

.form-button:hover{
    cursor: pointer;
}

textarea {
    resize: none;
}
/* ------------------------------ */
.form-select {
    margin-bottom: 15px;
}


.heading {
    font-size: 3rem;
    margin-bottom: 4px;
    margin-top: 10px; 
    padding-top: 5px;
    /* font-weight: 900; */
    /* font-style: oblique; */
}

/* ----------------------------------- */

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
//response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
//response.setHeader("Pragma","no-cache");
//response.setDateHeader("Expires",0);

String name = (String) session.getAttribute("cName");
   
String address = (String) session.getAttribute("address");
String mobile = (String) session.getAttribute("mobile");
System.out.println(name);
//System.out.println(role);
if(name!=null){
%>
    <div class="container">
        <h1>Booking Service</h1>
        <form action="booking"  method="post">
            <div class="form-div">
                <h2 class="heading">Sender Information</h2>
                <label for="senderName">Name:</label>
                <input type="text" id="senderName" value="${name}" name="senderName" readonly><br>
                <label for="senderAddress">Address:</label>
                <input type="text" id="senderAddress" value="${address}" readonly><br>
                <label for="senderContact">Contact Details:</label>
                <input type="text" id="senderContact" value="${mobile}" readonly><br>
            </div>
    
            <div class="form-div">
                <h2 class="heading">Receiver Information</h2>
                <label for="receiverName">Name:</label>
                <input type="text" id="receiverName" name="receiverName" required><br>
<!--                  <div id="nameError" class="error">
        			<%= request.getAttribute("customerNameError") != null ? request.getAttribute("customerNameError") : "" %>
    			</div> -->
                <label for="receiverAddress">Address:</label>
                <input type="text" id="receiverAddress" name="receiverAddress" required><br>
                <label for="receiverPinCode">Pin Code:</label>
                <input type="text" id="receiverPinCode" name="receiverPinCode" required><br>
                <label for="receiverContact">Contact Details:</label>
                <input type="text" id="receiverContact" name="receiverContact" required><br>
            </div>
    
            <div class="form-div">
                <h2 class="heading">Parcel Details</h2>
                <label for="parcelSize">Volume(Litres):</label>
                <input type="Number" id="volume" name="volume" required><br>
                 <label for="parcelSize">Weight(gm):</label>
                <input type="Number" id="weight" name="weight" required><br>
                <label for="contentsDescription">Contents Description:</label>
                <textarea id="contentsDescription" name="contentsDescription" required></textarea><br>
            </div>
    
            <div class="form-div">
                <h2 class="heading">Shipping Options</h2>
                <label for="deliverySpeed">Choose Delivery Speed:</label>
                <select id="deliverySpeed" name="deliverySpeed" oninput="calculateCost()">
                    <option value="standard">Standard</option>
                    <option value="express">Express</option>
                </select><br>
                <label for="packagingPreferences">Select Packaging Preferences:</label>
                <select id="packagingPreferences" name="packagingPreferences" oninput="calculateCost()">
                    <option value="standard">Standard Packaging</option>
                    <option value="custom">Custom Packaging</option>
                    <option value="ecoFriendly">Eco-friendly Packaging</option>
                    <option value="fragileItem">Fragile Item Handling</option>
                </select>
            </div>
    
            <div class="form-div">
                <h2 class="heading">Date and Time</h2>
                <label for="pickupTime">Preferred Pickup Time:</label>
                <input type="datetime-local" id="pickupTime" name="pickupTime" required>

                <label for="dropTime">Preferred Drop-off Time:</label>
                <input type="datetime-local" id="dropTime" name="dropTime" required>
            </div>
    
            <div class="form-div">
            
            
            
                <h2 class="heading">Payment</h2>
			<!-- 	<label for="costDisplay">Cost:</label>
				<input type="Number" id="costDisplay"  readonly> -->
                
                <label for="paymentMethod">Select Payment Method:</label>
                <select id="paymentMethod" name="paymentMethod">
                    <option value="creditCard">Credit Card</option>
                    <option value="paypal">PayPal</option>
                    <option value="bankTransfer">Bank Transfer</option>
                </select>
            </div>
    
            <!-- <div class="form-div">
                <h2 class="heading">Additional Services</h2>
                <label for="insuranceOptions">Insurance Options:</label>
                <input type="checkbox" id="insuranceOptions" name="insurance"> Include Insurance<br>
                <label for="trackingServices">Tracking Services:</label>
                <input type="checkbox" id="trackingServices" name="tracking"> Include Tracking
            </div> -->
            <h2 class="heading">Additional Services</h2>
            <div class="form-div">
                <label for="insuranceOptions" class="form-label">Insurance Options</label>
                <select class="form-select" id="insuranceOptions" name="insuranceOptions" oninput="calculateCost()">
                    <option value="none">None</option>
                    <option value="basicInsurance">Basic Insurance</option>
                    <option value="fullInsurance">Full Coverage</option>
                </select>
            </div>
            <div class="form-div">
                <label for="trackingServices" class="form-label">Tracking Services</label>
                <select class="form-select" id="trackingServices" name="trackingServices" oninput="calculateCost()">
                    <option value="none">None</option>
                    <option value="basicTracking">Basic Tracking</option>
                    <option value="premiumTracking">Premium Tracking</option>
                </select>
            </div>
    
            <button class="form-button" type="submit">Submit Booking</button>
            <button class="form-button" type="reset">Reset Form</button>
        </form>

    </div>
    <%}
    else{response.sendRedirect("login.jsp");
    }%>
    <script>
    
    
    console.log("running")



    function logout() {
        window.location.href = '../index/index.html'
    }




    document.addEventListener('DOMContentLoaded', function () {
        const bookingForm = document.getElementById('bookingForm');
        const costDisplay = document.getElementById('costDisplay');
        
        const pricing = {
            none:0,
            standardShipping: 10,
            expressShipping: 20,
            standardPacking: 0,
            customPacking: 5,
            ecoFriendlyPacking: 3,
            fragileHandling: 10,
            basicInsurance: 15,
            fullInsurance: 30,
            basicTracking: 5,
            premiumTracking: 10
        };

        bookingForm.addEventListener('submit', function () {
            event.preventDefault();
            
            const receiverName = document.getElementById('receiverName').value.trim();
            const receiverAddress = document.getElementById('receiverAddress').value.trim();
            const receiverPinCode = document.getElementById('receiverPinCode').value.trim();
            const receiverContact = Number(document.getElementById('receiverContact').value.trim());
//            const parcelSize = document.getElementById('parcelSize').value.trim();
            const contentsDescription = document.getElementById('contentsDescription').value.trim();
    		const bookingForm = document.getElementById('bookingForm');
    		const pickupTime = document.getElementById('pickupTime');
    		const dropTime = document.getElementById('dropTime');
    		const weight = document.getElementById('weight').value;
            const volume = document.getElementById('volume').value;


            if (!receiverName || !receiverAddress || !receiverPinCode || !contentsDescription || !pickupTime || !dropTime) {
                alert('Please fill in all required fields.');
                return;
            }


            if (!/^\d{6}$/.test(receiverPinCode)) {
                alert('Pin Code must be exactly 6 digits.');
                return;
            }
    		
    		const now = new Date();
            const pickupDate = new Date(pickupTime.value);
            const dropDate = new Date(dropTime.value);
            
            <!-- 
         // Check if pickup or dropoff times are earlier than the current time
            if (pickupDate < now || dropDate < now) {
                alert('Pickup and drop-off times cannot be earlier than the current time.');
                event.preventDefault(); // Prevent form submission
                return;
            }

            // Check if pickup time is after the dropoff time
            if (pickupDate >= dropDate) {
                alert('Pickup time must be before the drop-off time.');
                event.preventDefault(); // Prevent form submission
                return;
            }

            // Check if the difference between pickup and dropoff is at least 24 hours
            const diffTime = Math.abs(dropDate - pickupDate);
            const diffHours = diffTime / (1000 * 60 * 60);

            if (diffHours < 24) {
                alert('There must be at least 24 hours between pickup and drop-off times.');
                event.preventDefault(); // Prevent form submission
                return;
    		}	
            
            if(weight > 60000) {
                alert('Weight out of range. Cant provide service')
                return;
            }
            
            if(volume > 60) {
                alert('Volume out of range. Cant Provide service.')
                return;
            }
            
            -->

            

            let totalCost = calculateCost()
            costDisplay.textContent = `Cost Based on Choices: $${totalCost.toFixed(2)}`;


            window.location.href = '../us8_pay/us8_pay.html'
        });

        function calculateCost() {
            let cost = 0;
            const deliverySpeed = document.getElementById('deliverySpeed').value;
            const packagingPreferences = document.getElementById('packagingPreferences').value;
            const insuranceOptions = document.getElementById('insuranceOptions').value;
            const trackingServices = document.getElementById('trackingServices').value;
            cost = pricing[deliverySpeed]+pricing[packagingPreferences]+pricing[insuranceOptions]+pricing[trackingServices]+weight/3+volume/4;

            return cost;
        }

		var newCost;
        
        document.getElementById('deliverySpeed').addEventListener('change', updateCostDisplay);
        document.getElementById('packagingPreferences').addEventListener('change', updateCostDisplay);
        document.getElementById('insuranceOptions').addEventListener('change', updateCostDisplay);
        document.getElementById('trackingServices').addEventListener('change', updateCostDisplay);

        function updateCostDisplay() {
        	console.log(calculateCost());
            const costDisplay = document.getElementById('costDisplay').value = calculateCost();
        	
        }
    });

    </script>
</body>
</html>
