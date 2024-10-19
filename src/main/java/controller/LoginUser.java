package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.User;
import dao.UserProfile;

import java.io.IOException;





@WebServlet("/login")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //String customerName = request.getParameter("customerName");
	   System.out.println("entered");
    String email = request.getParameter("email");
    System.out.println(email);
    //String mobileNumber = request.getParameter("mobileNumber");
    //String address = request.getParameter("address");
    //String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    System.out.println(password);
    //String confirmPassword = request.getParameter("confirmPassword");

    boolean isValid = true;

    // Error message storage
    //String customerNameError = null;
    String emailError = null;
    //String mobileNumberError = null;
    //String addressError = null;
    //String userIdError = null;
    String passwordError = null;
    //String confirmPasswordError = null;

    // Validation logic
//    if (customerName == null || customerName.length() == 0 || customerName.length() > 50) {
//        customerNameError = "Customer Name must be less than 50 characters.";
//        isValid = false;
//    }

    String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
    if (email == null || !email.matches(emailPattern)) {
        emailError = "Please enter a valid email address.";
        isValid = false;
    }

//    if (mobileNumber == null || mobileNumber.length() != 10 || !mobileNumber.matches("\\d+")) {
//        mobileNumberError = "Mobile number must be 10 digits.";
//        isValid = false;
//    }

//    if (address == null || address.length() == 0) {
//        addressError = "Address is required.";
//        isValid = false;
//    }

    /*if (userId == null || userId.length() < 5 || userId.length() > 20) {
        userIdError = "User ID must be between 5 and 20 characters.";
        isValid = false;
    }*/

    //String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{6,30}$";
    if (password == null ) {
        passwordError = "Password can NOT be Empty";
        isValid = false;
    }

//    if (password != null && !password.equals(confirmPassword)) {
//        confirmPasswordError = "Passwords do not match.";
//        isValid = false;
//    }

    // If validation fails, send back errors
    if (!isValid) {
        //request.setAttribute("customerNameError", customerNameError);
        request.setAttribute("emailError", emailError);
        //request.setAttribute("mobileNumberError", mobileNumberError);
        //request.setAttribute("addressError", addressError);
        //request.setAttribute("userIdError", userIdError);
        request.setAttribute("passwordError", passwordError);
        //request.setAttribute("confirmPasswordError", confirmPasswordError);
        //request.getRequestDispatcher("register.jsp").forward(request, response);
        return;
    }
    System.out.println("Here dont know");
    //boolean isSaved = saveUserToDatabase(customerName, email, mobileNumber, address, password);
    boolean isPresent = checkUser(email,password);
    
    if (isPresent) {
    	 int userId = UserProfile.getUserDetails(email).getUserId(); 
    	 String role = UserProfile.getUserDetails(email).getRole();
    	 System.out.println(role);
        // Set success attributes after registration
    	 System.out.println("user validated");
    	 HttpSession session = request.getSession();
        session.setAttribute("userId", userId);
        session.setAttribute("email", email);
        session.setAttribute("cName", UserProfile.getUserDetails(email).getName());
        session.setAttribute("mobile", UserProfile.getUserDetails(email).getMobile());
        session.setAttribute("address", UserProfile.getUserDetails(email).getAddress());
        
        //request.setAttribute("email", email);
        if(role.equalsIgnoreCase("Customer")){
        // Forward to success acknowledgment page
        	session.setAttribute("crole","customer");
        response.sendRedirect("customerDashboard.jsp");}
        else{
        	session.setAttribute("role","officer");
        	response.sendRedirect("officerDashboard.jsp");
        }
    } 
    else{
        // Handle the case if saving to the database fails
    	System.out.println("user not validated");
        response.sendRedirect("login.jsp?error=Invalid credentials");
    }

    // Process registration if valid
    // You can add logic here to store data in a database and show success acknowledgment
}
   
	private boolean checkUser(String email, String password) {  
		System.out.println("checking");
	    boolean isPresent =UserProfile.loginUser(email,password);
	    return isPresent;
	   
	}
//private boolean saveUserToDatabase(String customerName, String email, String mobileNumber, String address, String password) {
//    
//    boolean saved=UserProfile.registerUser(customerName,email,mobileNumber,address,password,"customer");
//    return saved;
//   
//}

   /* private boolean validateFormData(String customerName, String email, String mobileNumber, String address, String userId, String password) {
        // Implement your validation logic here (similar to what you did in JS)
        return true; // Return true if valid, false otherwise
    }*/
}