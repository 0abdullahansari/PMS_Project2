package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import db.DatabaseConnection;
import model.User;

public class UserProfile {

    private static Connection conn=DatabaseConnection.getConnection();

    

   
    public static boolean registerUser(String name, String email, String phone, String address, String password,String role) {
        String query = "INSERT INTO tbl_UserProfile (FullName, email, mobilenumber, rec_address, role, password) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
          
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, role);
            stmt.setString(6, password);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public static boolean loginUser(String username, String password) {
        String query = "SELECT * FROM tbl_UserProfile WHERE Email = ? AND password = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

   
    public static User getUserDetails(String username) {
        String query = "SELECT * FROM tbl_UserProfile WHERE Email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
           try(ResultSet rs = stmt.executeQuery() ){
        	   if(rs.next()){
        	   String name = rs.getString("fullname");
        		String email = rs.getString("email");
        	    String mobile = rs.getString("mobilenumber");
        	    int userId = rs.getInt("userid");
        	    String password = rs.getString("password");
        	    String address = rs.getString("rec_address");
        	    String role = rs.getString("role");
        	    
        	    User userdata = new User(name,email,mobile,address,userId,password,role);
        	    return userdata;
        	   }
        	   else return null;
           }
           
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
   

    
    public boolean updateUserProfile(int userID, String Name, String email, String phone, String address) {
        String query = "UPDATE tbl_UserProfile SET FullName = ?, email = ?, phone = ?, address = ? WHERE userID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, Name);
            
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setInt(5, userID);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

 
    public String getUserRole(String username) {
        String query = "SELECT role FROM tbl_UserProfile WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("role");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

   
    public void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}