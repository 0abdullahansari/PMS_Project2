<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PMS Login</title>
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
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: #0E1117;

}

button{
    border-radius: 6px;
    width: 100%;
    font-size: 1.6rem; 
    padding: 10px;
    margin-top: 30px;
    margin-bottom: 20px;
    background-color: #3A8737;
    color: #E4F8EA;
}

button:hover{
    cursor: pointer;
}

h1{
    text-align: center;
    margin: 10px;
}

img{
    width: 60px;
    height: 60px;
}


form{
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 90%; 
    max-width: 600px; 
    box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
    border-radius: 6px;
    margin: 10px;
    padding: 20px 15px;
    background-color: #151B23;
}

div{
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
    	
    
    </style>
</head>
<body>
<% 
   
String role = (String) session.getAttribute("role");

if(role==null){
%>
    <img src="../index/logo circle.png" alt="">
    <h1>Parcel Management System</h1>
    <form id="loginFormCustomer" action="login" method="post">
        <h1>Customer Login</h1>
        <div class="uid">
            <label for="customerId" >Email</label>
            <input type="text" id="customerId" name="email" placeholder="Enter User ID" minlength="5" maxlength="20"  required>
        </div>
        <div class="pwd">
            <label for="customerPassword" >Password</label>
            <input type="password" id="customerPassword" name="password" placeholder="Enter Password" maxlength="30" required>
        </div>
        <button type="submit" >Login as Customer</button>
    </form>
   <%}
    else{
if(role.equalsIgnoreCase("officer")){ response.sendRedirect("officerDashboard.jsp");
}
else{
response.sendRedirect("customerDashboard.jsp");}
    }%>
</body>
</html>