<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - OnTime Parcel</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
    /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #eef2f3;
            color: #444;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
        }

        header {
            background-color: #2c3e50;
            padding: 15px;
            color: white;
            text-align: center;
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 10;
        }

        header h1 {
            font-size: 2.2rem;
            font-weight: 600;
            letter-spacing: 1.5px;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            width: 100%;
            text-align: center;
            margin-top: 100px; 
            flex-grow: 1; 
        }

        h2 {
            margin-bottom: 20px;
            font-weight: 500;
        }

        fieldset {
            border: 1px solid #2c3e50;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #ecf0f1; 
        }

        legend {
            font-weight: 600;
            padding: 0 10px;
            font-size: 1.2rem; 
            color: #2c3e50;
        }

        .input-group {
            /* margin-bottom: 5px; */
            text-align: left; 
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            margin-bottom: 5px; 
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            margin-bottom: 5px; 
        }

        input::placeholder,
        select::placeholder {
            color: #888;
            font-style: italic;
            font-size: 0.8rem; 
        }

        .error {
            color: red;
            font-size: 0.9rem;
            min-height: 20px; 
            display: block; 
        }

        .phone-container {
            display: flex;
            justify-content: space-between; 
            align-items: center; 
            margin-bottom: 5px;
        }

        .phone-container select {
            flex: 1;
            margin-right: 10px; 
            max-width: 150px;
        }

        .phone-container input {
            flex: 2; 
        }

        .btn {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 10px 35px;
            font-size: 1.1em;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            font-weight: 500;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #3498db;
            transform: translateY(-2px);
        }

        footer {
            margin-top: 20px; 
            color: #777;
            font-size: 0.9em;
            text-align: center;
            margin-top: 10px; 
        }

        footer a {
            color: #2980b9;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }


       
        .acknowledgment {
            display: none; 
            background-color: #eafaf1;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            margin-top: 110px;
            color: black;
        }

        @media (max-width: 600px) {
            header h1 {
                font-size: 2rem;
            }
        }
    
        /* (Include your CSS styling here, same as in your original HTML code) */
    </style>
</head>
<body>
<% 
   
String role = (String) session.getAttribute("role");

if(role==null){
%>
    <header>
        <h1>OnTime Parcel Services</h1>
    </header>

    <div class="container" id="registrationContainer" 
    >
        <h2>Register</h2>
        
        <form action="register" method="post">
            <fieldset>
                <legend>Personal Information</legend>
               <div class="input-group">
    <label for="customerName">Customer Name:</label>
    <input type="text" id="customerName" name="customerName" maxlength="50" placeholder="Enter your name" value="<%= request.getParameter("customerName") != null ? request.getParameter("customerName") : "" %>" required>
    <div id="customerNameError" class="error">
        <%= request.getAttribute("customerNameError") != null ? request.getAttribute("customerNameError") : "" %>
    </div>
</div>

<div class="input-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" placeholder="Enter your email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
    <div id="emailError" class="error">
        <%= request.getAttribute("emailError") != null ? request.getAttribute("emailError") : "" %>
    </div>
</div>

<div class="input-group">
    <label for="countryCode">Mobile Number:</label>
    <div class="phone-container">
        <select id="countryCode" name="countryCode" required>
            <option value="">Select Country Code</option>
            <option value="+1" <%= "+1".equals(request.getParameter("countryCode")) ? "selected" : "" %>>+1 (USA)</option>
            <option value="+91" <%= "+91".equals(request.getParameter("countryCode")) ? "selected" : "" %>>+91 (India)</option>
            <option value="+44" <%= "+44".equals(request.getParameter("countryCode")) ? "selected" : "" %>>+44 (UK)</option>
        </select>
        <input type="text" id="mobileNumber" name="mobileNumber" maxlength="10" placeholder="Enter your 10-digit mobile number" value="<%= request.getParameter("mobileNumber") != null ? request.getParameter("mobileNumber") : "" %>" required>
    </div>
    <div id="mobileError" class="error">
        <%= request.getAttribute("mobileNumberError") != null ? request.getAttribute("mobileNumberError") : "" %>
    </div>
</div>

<div class="input-group">
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" placeholder="Enter your address with ZIP code" value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>" required>
    <div id="addressError" class="error">
        <%= request.getAttribute("addressError") != null ? request.getAttribute("addressError") : "" %>
    </div>
</div>

<!-- Username and Password Section -->

<!--  <div class="input-group">
    <label for="userId">User ID:</label>
    <input type="text" id="userId" name="userId" minlength="5" maxlength="20" placeholder="5-20 characters" value="<%= request.getParameter("userId") != null ? request.getParameter("userId") : "" %>" required>
    <div id="userIdError" class="error">
        <%= request.getAttribute("userIdError") != null ? request.getAttribute("userIdError") : "" %>
    </div>
</div>-->

<div class="input-group">
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" minlength="6" maxlength="30" placeholder="6-30 characters" required>
    <div id="passwordError" class="error">
        <%= request.getAttribute("passwordError") != null ? request.getAttribute("passwordError") : "" %>
    </div>
</div>

<div class="input-group">
    <label for="confirmPassword">Confirm Password:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" minlength="6" maxlength="30" placeholder="Confirm your password" required>
    <div id="confirmPasswordError" class="error">
        <%= request.getAttribute("confirmPasswordError") != null ? request.getAttribute("confirmPasswordError") : "" %>
    </div>
</div>

            </fieldset>

            <div class="input-group">
                <label>
                    <input type="checkbox" id="notificationEmail" name="notificationEmail"> Receive notification on email
                </label>
                <label>
                    <input type="checkbox" id="notificationSMS" name="notificationSMS"> Receive notification through SMS
                </label>
            </div>

            <button class="btn" type="submit">Register</button>
            <button class="btn" type="reset">Reset</button>
        </form>
    </div>

    <footer>
        &copy; 2024 Parcel Management System. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
    </footer>
<%}
    else{
if(role.equalsIgnoreCase("officer")){ response.sendRedirect("officerDashboard.jsp");
}
else{
response.sendRedirect("customerDashboard.jsp");}
    }%>
</body>
</html>
