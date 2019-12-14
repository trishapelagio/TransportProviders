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
            
        }
        catch(Exception e) {
            group_status = 0;
            System.out.println("Oops! Something went ");
        }
    }
    
    public void deleteGroup() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection c;
            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?" + "user=root&password=p@ssword");
            
            // 2. Prepare the SQL Statement
            PreparedStatement ps = c.prepareStatement("DELETE FROM tgroups WHERE groupid=?");
            
                ps.setInt(1, Integer.parseInt(groupid));
                
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
    
}
