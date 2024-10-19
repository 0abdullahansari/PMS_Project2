<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - OnTime Parcel</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: monospace;
            box-sizing: border-box;
        }

        body {
            color: #EEF4FA;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #0E1117;

        }

        h1 {
            text-align: center;
            margin: 10px;
            font-size: 4rem;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 90%;
            max-width: 1000px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 6px;
            margin: 20px;
            padding: 20px 15px;
            background-color: #151B23;
        }

        div {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        label {
            font-size: 1.6rem;
            padding: 10px 0px;
            width: 100%;
        }

        select,
        textarea,
        input {
            border-radius: 6px;
            width: 100%;
            font-size: 1.6rem;
            color: #EAF0F5;
            padding: 10px;
            background-color: #0E1117;
            border: none;
            outline: none;
        }

        button {
            border-radius: 6px;
            width: 100%;
            font-size: 1.6rem;
            padding: 10px;
            margin-top: 20px;
            margin-bottom: 15px;
            background-color: #3A8737;
            color: #E4F8EA;
        }

        button:hover {
            cursor: pointer;
        }

        .form-select {
            margin-bottom: 15px;
        }

        textarea {
            resize: none;
        }

        span {
            display: block;
        }

        .heading {
            font-size: 3rem;
            margin-bottom: 4px;
            margin-top: 10px;
            padding-top: 5px;
        }

        .checkbox-container {
            display: flex;
            flex-direction: row;
            font-size: 1.2rem;
            padding: 18px 5px;
            width: 100%;
        }

        div{
            margin-bottom: 7px;
        }

        label{
            margin-bottom: 7px;
        }

        .error{
            color: red;
            align-items: flex-start;
        }
    </style>
</head>

<body>

    <h1>Customer Registration</h1>


    <form action="register" method="post">

        <h2 class="heading">Personal Information</h2>

        <div>

            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" maxlength="50" placeholder="Enter your name"
                value="<%= request.getParameter(" customerName") !=null ? request.getParameter("customerName") : "" %>"
            required>
        </div>
        <div id="customerNameError" class="error">
            <%= request.getAttribute("customerNameError") !=null ? request.getAttribute("customerNameError") : "" %>
        </div>

        <div id="emailError" class="error">
            <%= request.getAttribute("emailError") !=null ? request.getAttribute("emailError") : "" %>
        </div>


        <div>

            <label for="countryCode">Mobile Number:</label>
            <div class="phone-container">

                <div>

                    <select class="form-select" id="countryCode" name="countryCode" required>

                        <option value="">Select Country Code</option>
                        <option value="+1" <%="+1" .equals(request.getParameter("countryCode")) ? "selected" : "" %>
                            >+1 (USA)</option>
                        <option value="+91" <%="+91" .equals(request.getParameter("countryCode")) ? "selected" : "" %>
                            >+91
                            (India)</option>
                        <option value="+44" <%="+44" .equals(request.getParameter("countryCode")) ? "selected" : "" %>
                            >+44
                            (UK)</option>
                    </select>
                    <input type="text" id="mobileNumber" name="mobileNumber" maxlength="10"
                        placeholder="Enter your 10-digit mobile number" value="<%= request.getParameter(" mobileNumber")
                        !=null ? request.getParameter("mobileNumber") : "" %>" required>
                </div>




            </div>
            <div id="mobileError" class="error">
                <%= request.getAttribute("mobileNumberError") !=null ? request.getAttribute("mobileNumberError") : "" %>
            </div>
        </div>


        <div>
            <label for="address">Address:</label>
            <input type="textarea" id="address" name="address" placeholder="Enter your address with ZIP code"
                value="<%= request.getParameter(" address") !=null ? request.getParameter("address") : "" %>"
            required>
            <div id="addressError" class="error">
                <%= request.getAttribute("addressError") !=null ? request.getAttribute("addressError") : "" %>
            </div>
        </div>



        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" minlength="6" maxlength="30"
                placeholder="6-30 characters" required>
            <div id="passwordError" class="error">
                <%= request.getAttribute("passwordError") !=null ? request.getAttribute("passwordError") : "" %>
            </div>
        </div>

        <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" minlength="6" maxlength="30"
                placeholder="Confirm your password" required>
            <div id="confirmPasswordError" class="error">
                <%= request.getAttribute("confirmPasswordError") !=null ? request.getAttribute("confirmPasswordError")
                    : "" %>
            </div>
        </div>


        <div class="checkbox-container">
            <span>
                <label for="notificationEmail">E-mail Notifications</label>
                <label for="notificationEmail">SMS Notifications</label>
            </span>
            <span>
                <input type="checkbox" id="notificationEmail" name="notificationEmail">
                <input type="checkbox" id="notificationSMS" name="notificationSMS">
            </span>
        </div>

        <button class="btn" type="submit">Register</button>
        <button class="btn" type="reset">Reset</button>
    </form>




</body>

</html>