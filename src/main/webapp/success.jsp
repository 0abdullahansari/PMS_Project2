                                                                                                                                                                <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
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

div{
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
    font-size: 1.6rem;
}

h1{
    color: #398637;
    text-align: center;
    font-size: 3rem;
}

p{
    margin-bottom: 20px;
}

ul{
    list-style-position: outside;
    padding: 0px 15px;
}

li{
    list-style-type: none;
}

section{
    display: flex;
    flex-direction: row;
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

  </style>
</head>
<body>
    <div id="acknowledgmentScreen">
        <h1 >Consumer Registration Successful</h1>
        <p>Thank you for registering. Below are your details:</p>
        <section>
            <ul>
                <li >User ID: </li>
                <li >Name:     </li>
                <li >Email:    </li>
            </ul>
            <ul>
                <li ><span id="ackUserId">${userId}</span></li>
                <li ><span id="ackCustomerName">${customerName}</span></li>
                <li ><span id="ackEmail">${email}</span></li>
            </ul>
        </section>
        <button onclick="window.location.href='login.jsp'" >Proceed To Login</button>
    </div>
   
</body>
</html>