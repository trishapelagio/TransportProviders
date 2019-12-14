/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CCINFOM;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ASUS-dm691t
 */
public class Offerings {
    
    public String offerid;
    public String date;
    public String confirmed_date;
    public String cancelled_date;
    public String status;
    public String email_tp;
    public String substituted_by;
    public String hour_rate;
    public String base_rate;

    public int offering_status;
    
    public int searchno;
    
    public void addOfferings() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?"+"user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO OFFERINGS (offerid, date, email_tp, hour_rate, base_rate,status) VALUES (?,?,?,?,?,?)");
           
            
                stmt.setInt(1,Integer.parseInt(offerid));
                stmt.setString(2, date);
                stmt.setString(3, email_tp);
                stmt.setFloat(4,Float.parseFloat(hour_rate));
                stmt.setFloat(5,Float.parseFloat(base_rate));
                stmt.setString(6,"A");

                // 3. Execute the SQL Statement
                stmt.executeUpdate();
            
            // 4. Process the results
            offering_status = 1;
            
            // 5. Disconnect
            stmt.close();
            conn.close();
            
        }
        
        catch(Exception e) {
            offering_status=0;
            System.out.println("something went wrong " + e.getMessage());
        }
    }
    
    
    public void updateOffering() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?"+"user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("UPDATE OFFERINGS SET date=?,email_tp=?,hour_rate=? WHERE offerid=?");
                
                stmt.setString(1, date);
                stmt.setString(2, email_tp);
                stmt.setFloat(3,Float.parseFloat(hour_rate));
                stmt.setFloat(4,Float.parseFloat(base_rate));
                
                // 3. Execute the SQL Statement
                stmt.executeUpdate();
            
            // 4. Process the results
            offering_status = 1;
            
            // 5. Disconnect
            stmt.close();
            conn.close();
            
        }
        
        catch(Exception e) {
            offering_status=0;
            System.out.println("something went wrong " + e.getMessage());
        }
    }
    
    public void displayOffering() {
      try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Offerings WHERE offerid = "+searchno);
            // 3. Execute the SQL Statement
            ResultSet rs = stmt.executeQuery();
            rs.next();
            // 4. Process the results
            offerid = rs.getString("offerid");
            date = rs.getString("date");
            email_tp = rs.getString("email_tp");
            hour_rate = rs.getString("hour_rate");
            substituted_by = rs.getString("substituted_by");
            confirmed_date = rs.getString("confirmed_date");
            if(confirmed_date.equals("9999-12-31"))
                confirmed_date = "N/A";
            cancelled_date = rs.getString("cancelled_date");
            if(cancelled_date.equals("9999-12-31"))
                cancelled_date = "N/A";

            status = rs.getString("status");
            
            
            // 5. Disconnect
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("something went wrong " + e.getMessage());
        }  
    }
    
      public void deleteGroup() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection c;
            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?" + "user=root&password=p@ssword");
            
            // 2. Prepare the SQL Statement
            PreparedStatement ps = c.prepareStatement("DELETE FROM OFFERINGS WHERE offerid=?");
            
                ps.setInt(1, Integer.parseInt(offerid));
                
                // 3. Execute the SQL Statement
                ps.executeUpdate();
            
            // 4. Process the results
            offering_status = 1;
            
            // 5. Disconnect
            ps.close();
            c.close();
        }
        catch(Exception e) {
            offering_status = 0;
            System.out.println("Oops! Something went wrong. " + e.getMessage());
        }  
    }
    
}
