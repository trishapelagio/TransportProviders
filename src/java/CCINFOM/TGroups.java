/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CCINFOM;
import java.sql.*;
import java.util.*;

public class TGroups {
    
    public String groupid;
    public String start_date;
    public String end_date;
    public String rep_email;
    
    public String search_id;
    public int group_status;
    
    public void addGroup(){
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection c;
            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?" + "user=root&password=p@ssword");
            
            // 2. Prepare the SQL Statement
            PreparedStatement ps = c.prepareStatement("INSERT INTO TGROUPS (groupid,start_date,end_date,rep_email) VALUES (?,?,?,?)");
            
                ps.setInt(1, Integer.parseInt(groupid));
                ps.setString(2, start_date);
                ps.setString(3, end_date);
                ps.setString(4, rep_email);
                
                // 3. Execute the SQL Statement
                ps.executeUpdate();
            
            // 4. Process the results
            group_status = 1;
            
            // 5. Disconnect
            ps.close();
            c.close();
        }
        catch(Exception e) {
            group_status = 0;
            System.out.println("Oops! Something went wrong. " + e.getMessage());
        }
    }
    
    public void updateGroup() {
        try {
            // 1. Connect
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection c;
            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?" + "user=root&password=p@ssword");
            
            // 2. Prepare
            PreparedStatement ps = c.prepareStatement("UPDATE TGROUPS SET start_date=?,end_date=?,rep_email=? WHERE groupid = ?");
                
                ps.setString(1, start_date);
                ps.setString(2, end_date);
                ps.setString(3, rep_email);
                ps.setInt(4, Integer.parseInt(groupid));
                
                // 3. Execute
                ps.executeUpdate();
            
            // 4. Process
            group_status = 1;
            
            // 5. Disconnect
            ps.close();
            c.close();
        }
        catch(Exception e) {
            group_status = 0;
            System.out.println("Oops! Something went wrong. " + e.getMessage());
        }
    }
    
    public void displayGroup() {
        try {
            // 1. Connect
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection c;
            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?" + "user=root&password=p@ssword");
            
            // 2. Prepare
            PreparedStatement ps = c.prepareStatement("SELECT * FROM tgroups WHERE groupid = " + search_id);
            
            // 3. Execute
            ResultSet rs = ps.executeQuery();
            rs.next();
            
            // 4. Process
            groupid = rs.getString("groupid");
            start_date = rs.getString("start_date");
            end_date = rs.getString("end_date");
            rep_email = rs.getString("rep_email");
            
            // 5. Disconnect
            ps.close();
            c.close();
        }
        catch(Exception e) {
            System.out.println("Oops! Something went wrong. " + e.getMessage());
        }
    }
    
    public void deleteGroup() {
        try {
            // 1. Connect
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection c;
            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?" + "user=root&password=p@ssword");
            
            // 2. Prepare and Execute
            PreparedStatement ps = c.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
              
            // 3. Execute                

            ps.executeUpdate();
            ps.close();
            ps = c.prepareStatement("DELETE FROM tgroups WHERE groupid = ?");
            ps.setInt(1, Integer.parseInt(groupid));
            ps.executeUpdate();
            ps.close();
            ps = c.prepareStatement("SET FOREIGN_KEY_CHECKS=1");
            ps.executeUpdate();
            ps.close();

            // 4.Process
            group_status = 1;
            
            // 5. Disconnect
            c.close();
        }
        catch(Exception e) {
            group_status = 0;
            System.out.println("Oops! Something went wrong. " + e.getMessage());
        }
    }
}
