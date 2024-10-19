<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PMS Register</title>
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

        div {
            margin-bottom: 7px;
        }

        label {
            margin-bottom: 7px;
        }

        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .error{
            color: red;
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
            >
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

                    <select class="form-select" id="countryCode" name="countryCode" >

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
                    <input type="number" id="mobileNumber" name="mobileNumber" pattern="\d{10}"
                        title="Enter a 10-digit mobile number without any dashes or spaces."
                        placeholder="Enter your 10-digit mobile number" value="<%= request.getParameter(" mobileNumber")
                        !=null ? request.getParameter("mobileNumber") : "" %>" >
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
            >
            <div id="addressError" class="error">
                <%= request.getAttribute("addressError") !=null ? request.getAttribute("addressError") : "" %>
            </div>
        </div>


        <h2 class="heading">Address</h2>

        <div>
            <label for="streetAddress">Street Address</label>
            <input type="text" id="streetAddress" name="streetAddress" placeholder="Enter Street Address"
                value="<%= request.getParameter(" streetAddress") !=null ? request.getParameter("streetAddress") : ""
                %>" >
            <div id="addressError" class="error">
                <%= request.getAttribute("streetAddressError") !=null ? request.getAttribute("streetAddressError") : ""
                    %>
            </div>
        </div>

        <div>
            <label for="city">City</label>
            <input type="text" id="city" name="city" placeholder="Enter City" value="<%= request.getParameter("city")
                !=null ? request.getParameter("city") : "" %>" >
                <div id="cityError" class="error">
                    <%= request.getAttribute("cityError") !=null ? request.getAttribute("cityError") : ""
                        %>
                </div>
        </div>

        <div>
            <label for="stateProvince">State/Province</label>
            <input type="text" id="stateProvince"  name="stateProvince" placeholder="Enter State or Province" value="<%= request.getParameter("stateProvince")
            !=null ? request.getParameter("stateProvince") : "" %>" >
            <div id="cityError" class="error">
                <%= request.getAttribute("stateProvince") !=null ? request.getAttribute("stateProvince") : ""
                    %>
            </div>
        </div>

        <div>
            <label for="zipCode">Zip Code</label>
            <input type="number" id="zipCode" name="zipCode"  placeholder="Enter 6 digit Zip Code" pattern="\d{6}"
                title="Six digit ZIP code ." value="<%= request.getParameter("zipCode")
                !=null ? request.getParameter("zipCode") : "" %>" >
                <div id="cityError" class="error">
                    <%= request.getAttribute("zipCodeError") !=null ? request.getAttribute("zipCodeError") : ""
                        %>
                </div>
        </div>

        <div>
            <label for="country">Country</label>
            <select id="country" name="country" >
                <option value="">Select Country</option>
                <option value="USA" <%="USA" .equals(request.getParameter("country")) ? "selected" : "" %> >United States</option>
                <option value="INDIA" <%="INDIA" .equals(request.getParameter("country")) ? "selected" : "" %>>India</option>
                <option value="UK" <%="UK" .equals(request.getParameter("countryCode")) ? "selected" : "" %>>UK</option>
            </select>
        </div>



        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" minlength="6" maxlength="30"
                placeholder="6-30 characters" >
            <div id="passwordError" class="error">
                <%= request.getAttribute("passwordError") !=null ? request.getAttribute("passwordError") : "" %>
            </div>
        </div>

        <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" minlength="6" maxlength="30"
                placeholder="Confirm your password" >
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