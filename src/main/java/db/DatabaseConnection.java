package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String DB_URL = "jdbc:derby:D:\\Users\\2727348\\Desktop\\New folder\\ParcelManagement\\MyDB;create=true;create=true"; 
    private static Connection connection = null;

    
    public static Connection getConnection() {
        if (connection == null) {
            try {
               
                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
         
                connection = DriverManager.getConnection(DB_URL);
                System.out.println("Database connection established.");
            } catch (ClassNotFoundException e) {
                System.err.println("Derby Driver not found: " + e.getMessage());
            } catch (SQLException e) {
                System.err.println("Database connection error: " + e.getMessage());
            }
        }
        return connection;
    }

 
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.err.println("Error closing the database connection: " + e.getMessage());
            }
        }
    }
}
