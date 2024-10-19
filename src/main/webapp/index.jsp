<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PMS</title>
    <link rel="stylesheet" href="./css/index.css">
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
    margin: 10px;
    background-color: #3A8737;
    color: #E4F8EA;
}

h1{
    text-align: center;
    margin: 10px;
}

.button-group {
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
    width: 70%;
}


.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 90%; 
    max-width: 600px; 
    box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
    background-color:#697565;
    border-radius: 6px;
    margin: 10px;
    padding: 10px;
    background-color: #151B23;
}

img{
    width: 60px;
    height: 60px;
}
    </style>
</head>
<body>
<% 
   
String role = (String) session.getAttribute("role");

if(role==null){
%>

    <img src="logo circle.png" alt="">
    <h1>Parcel Management System</h1>
    <div class="container">
        <div class="button-group">
            <button onclick="window.location.href='login.jsp'">Customer/Officer Login</button>
            <button onclick="window.location.href='register.jsp'">Customer Registration</button>
            
        </div>
    </div>
    <%}
    else{
if(role.equalsIgnoreCase("officer")){ response.sendRedirect("officerDashboard.jsp");
}
else{
response.sendRedirect("customerDashboard.jsp");}
    }%>
   
</body>
</html>
