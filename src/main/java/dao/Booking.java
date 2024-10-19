package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.DatabaseConnection;
import model.BookingData;
public class Booking {
    
    private Connection conn;

    public Booking() {
      
        this.conn = DatabaseConnection.getConnection();
    }


    public boolean createBooking(int userID, String recName, String recAddress, String recPin, String recMobile,
                                 int parWeightGram, String parContentsDescription, String parDeliveryType,
                                 String parPackingPreference, java.sql.Timestamp pickupTime, 
                                 java.sql.Timestamp dropoffTime,Double cost) {
        String query = "INSERT INTO tbl_Booking (User_ID, Rec_Name, Rec_Address, Rec_Pin, Rec_Mobile, " +
                "Par_Weight_Gram, Par_Contents_Description, Par_Delivery_Type, Par_Packing_Preference, " +
                "Par_PickupTime, Par_DropoffTime, Par_PaymentTime, Par_Status, Par_ServiceCost) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Booked', ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userID);
            stmt.setString(2, recName);
            stmt.setString(3, recAddress);
            stmt.setString(4, recPin);
            stmt.setString(5, recMobile);
            stmt.setDouble(6, parWeightGram);
            stmt.setString(7, parContentsDescription);
            stmt.setString(8, parDeliveryType);
            stmt.setString(9, parPackingPreference);
            stmt.setTimestamp(10, pickupTime);
            stmt.setTimestamp(11, dropoffTime);
            stmt.setTimestamp(12, new java.sql.Timestamp(System.currentTimeMillis())); 
            stmt.setDouble(14,cost);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

   
    public BookingData getBookingDetails(int bookingID) {
        String query = "SELECT Booking_id, user_Id,rec_name, rec_address,rec_pin,rec_mobile,par_weight_gram,par_contents_description,par_delivery_type,par_packing_preference,par_pickuptime,par_dropofftime,par_servicecost,par_paymenttime,par_status FROM tbl_Booking WHERE Booking_ID = ?";
        BookingData bookingDetail = null;
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                     bookingDetail = new BookingData(rs.getInt("Booking_id"),rs.getInt("user_id"),rs.getString("rec_name"),rs.getString("rec_address"),rs.getString("rec_pin"),rs.getString("rec_mobile"),rs.getInt("par_weight_gram"),rs.getString("par_contents_description"),rs.getString("par_delivery_type"),rs.getString("par_packing_preference"),rs.getTimestamp("par_pickuptime"),rs.getTimestamp("par_dropofftime"),rs.getDouble("par_servicecost"),rs.getTimestamp("par_paymenttime"),rs.getString("par_status"));
                    		
                    		
                    
                }}
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
            return bookingDetail;
        
    }
    public  BookingData getBookingDetails(int bookingID,int userid) {
    	 String query = "SELECT Booking_id, user_Id,rec_name, rec_address,rec_pin,rec_mobile,par_weight_gram,par_contents_description,par_delivery_type,par_packing_preference,par_pickuptime,par_dropofftime,par_servicecost,par_paymenttime,par_status FROM tbl_Booking WHERE Booking_ID = ? and User_Id = ?";
    	 BookingData   bookingDetail = null;
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            stmt.setInt(2, userid);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                	bookingDetail = new BookingData(rs.getInt("Booking_id"),rs.getInt("user_id"),rs.getString("rec_name"),rs.getString("rec_address"),rs.getString("rec_pin"),rs.getString("rec_mobile"),rs.getInt("par_weight_gram"),rs.getString("par_contents_description"),rs.getString("par_delivery_type"),rs.getString("par_packing_preference"),rs.getTimestamp("par_pickuptime"),rs.getTimestamp("par_dropofftime"),rs.getDouble("par_servicecost"),rs.getTimestamp("par_paymenttime"),rs.getString("par_status"));
            		
                }}
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return bookingDetail;
    }
    public String getSchedulingDetails(int bookingID) {
        String query = "SELECT b.Booking_ID, u.FullName,u.Rec_Address Address, b.Rec_Name,b.Rec_Address,DATE(b.par_paymentTime) Booking_Date, b.Par_Status, b.Par_Pickuptime, b.Par_Dropofftime FROM tbl_Booking b JOIN tbl_UserProfile u ON b.User_ID = u.UserID WHERE b.Booking_ID = ?";
        String bookingDetail = null;
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                     bookingDetail = "  " + rs.getInt("Booking_ID") +
                    		          " | " + rs.getString("fullName") +
                    		          " | " + rs.getString("Address") +
                                     " | " + rs.getString("Rec_Name") +
                                     " | " + rs.getString("Rec_Address") +
                                     " | " + rs.getTimestamp("Booking_Date") +
                                     " | " + rs.getString("Par_Status")+
                                     " | " + rs.getTimestamp("par_PickupTime") +
                                     " | " + rs.getTimestamp("par_DropOfftime");
                    
                }}        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return bookingDetail;
    }


    public boolean updateBookingStatus(int bookingID, String status) {
        String query = "UPDATE tbl_Booking SET Par_Status = ? WHERE Booking_ID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, bookingID);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

 
    public ArrayList<BookingData> getUserBookingHistory(int userID) {
        String query = "SELECT * FROM tbl_Booking WHERE User_ID = ? ORDER BY Par_PaymentTime desc";
        ArrayList<BookingData> bookingHistory = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	BookingData details = new BookingData(rs.getInt("Booking_id"),rs.getInt("user_id"),rs.getString("rec_name"),rs.getString("rec_address"),rs.getString("rec_pin"),rs.getString("rec_mobile"),rs.getInt("par_weight_gram"),rs.getString("par_contents_description"),rs.getString("par_delivery_type"),rs.getString("par_packing_preference"),rs.getTimestamp("par_pickuptime"),rs.getTimestamp("par_dropofftime"),rs.getDouble("par_servicecost"),rs.getTimestamp("par_paymenttime"),rs.getString("par_status"));
                    bookingHistory.add(details);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingHistory;
    }
    
    
    public BookingData getLatestUserBookingHistory(int userID) {
        String query = "SELECT * FROM tbl_Booking WHERE User_ID = ? ORDER BY Par_PaymentTime DESC FETCH FIRST 1 ROWS ONLY";
        BookingData details = null;
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	details = new BookingData(rs.getInt("Booking_id"),rs.getInt("user_id"),rs.getString("rec_name"),rs.getString("rec_address"),rs.getString("rec_pin"),rs.getString("rec_mobile"),rs.getInt("par_weight_gram"),rs.getString("par_contents_description"),rs.getString("par_delivery_type"),rs.getString("par_packing_preference"),rs.getTimestamp("par_pickuptime"),rs.getTimestamp("par_dropofftime"),rs.getDouble("par_servicecost"),rs.getTimestamp("par_paymenttime"),rs.getString("par_status"));
                   
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }
    
    
    public ArrayList<BookingData> getAllUserBookingHistory() {
    	String query = "SELECT * FROM tbl_Booking ORDER BY Par_PaymentTime desc";
        ArrayList<BookingData> bookingHistory = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	BookingData details = new BookingData(rs.getInt("Booking_id"),rs.getInt("user_id"),rs.getString("rec_name"),rs.getString("rec_address"),rs.getString("rec_pin"),rs.getString("rec_mobile"),rs.getInt("par_weight_gram"),rs.getString("par_contents_description"),rs.getString("par_delivery_type"),rs.getString("par_packing_preference"),rs.getTimestamp("par_pickuptime"),rs.getTimestamp("par_dropofftime"),rs.getDouble("par_servicecost"),rs.getTimestamp("par_paymenttime"),rs.getString("par_status"));
                    bookingHistory.add(details);
                  
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingHistory;
    }

  
    public boolean updatePickupAndDropoffTimes(int bookingID, java.sql.Timestamp pickupTime, java.sql.Timestamp dropoffTime) {
        String query = "UPDATE tbl_Booking SET Par_PickupTime = ?, Par_DropoffTime = ? WHERE Booking_ID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setTimestamp(1, pickupTime);
            stmt.setTimestamp(2, dropoffTime);
            stmt.setInt(3, bookingID);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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
    public static double calculateServiceCost(double weight, String deliveryType) {
        double baseCost = 10.0; 
        double weightCost = (weight / 1000) * 5.0; 
        double deliveryCost;

        
        switch (deliveryType.toLowerCase()) {
            case "standard":
                deliveryCost = 5.0;
                break;
            case "express":
                deliveryCost = 15.0;
                break;
            case "same day":
                deliveryCost = 25.0;
                break;
            default:
                deliveryCost = 0;
                System.out.println("Invalid delivery type. No additional cost applied.");
                break;
        }

        return baseCost + weightCost + deliveryCost;
    }
}