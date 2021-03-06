package com.rp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class DBUtil {
    public static Connection getConnection() {
        //DB연결
        Connection conn = null;
        //STEP 2: Register JDBC driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
         
            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection("jdbc:mysql://192.168.102.23/jspdb","test","1111");
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }
     
    public static void closeConnection(Connection conn){
        if (conn != null) { try { conn.close(); } catch  (SQLException e) { e.printStackTrace();}}
    }
    public static void closeConnection(Connection conn, PreparedStatement pstmt){
        if (pstmt != null) { try { pstmt.close(); } catch  (SQLException e) { e.printStackTrace();}}
        if (conn != null) { try { conn.close(); } catch  (SQLException e) { e.printStackTrace();}}
    }
}