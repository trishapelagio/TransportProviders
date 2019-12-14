/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CCINFOM;
import java.sql.*;
import java.util.*;

public class Booking {
    public ArrayList <String> offers = new ArrayList<String>();
    public ArrayList <String> groupnos = new ArrayList<String>();
    
    public String booking_no;
    public String booked_date;
    public String numhours;
    public String totalcost;
    public String numpeople;
    public String groupno;
    public String offerid;
    

    public int booking_status;
    
    public void addBooking() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?"+"user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO BOOKINGS (booking_no,booked_date,num_hours,totalcost,num_people,status,isGroup,group_no,offerid) VALUES (?,?,?,?,?,?,?,?,?)");
            
            PreparedStatement stmt2 = conn.prepareStatement("SELECT MAX(booking_no) AS a FROM bookings");
            ResultSet rs = stmt2.executeQuery();
            int x = Integer.parseInt(rs.getString("a")) + 1;
            System.out.println("HELLOOO" + x);
            
                stmt.setInt(1,x);
                stmt.setString(2,booked_date);
                stmt.setInt(3,Integer.parseInt(numhours));
                stmt.setFloat(4,Float.parseFloat(totalcost));
                stmt.setInt(5,Integer.parseInt(numpeople));
                stmt.setString(6,"P");
                if(Integer.parseInt(numpeople)>1)
                    stmt.setString(7,"Y");
                else
                    stmt.setString(7,"N");
                stmt.setInt(8,Integer.parseInt(groupno));
                stmt.setInt(9,Integer.parseInt(offerid));
                // 3. Execute the SQL Statement
                stmt.executeUpdate();
            
            // 4. Process the results
            booking_status = 1;
            
            // 5. Disconnect
            stmt.close();
            stmt2.close();
            conn.close();
            
        }
        
        catch(Exception e) {
            booking_status=0;
            System.out.println("something went wrong " + e.getMessage());
        }
    }
    
    public void getOffers() {
      try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT offerid AS offid FROM offerings ORDER BY offerid");
            // 3. Execute the SQL Statement
            ResultSet rs = stmt.executeQuery();
            // 4. Process the results
            offers.clear();
            while (rs.next()) {
                offers.add(rs.getString("offid"));
            }
            // 5. Disconnect
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("something went wrong" + e.getMessage());
        }        
    }   
    
    public void getGroupNos() {
      try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT groupid AS gid FROM tgroups ORDER BY groupid");
            // 3. Execute the SQL Statement
            ResultSet rs = stmt.executeQuery();
            // 4. Process the results
            groupnos.clear();
            while (rs.next()) {
                groupnos.add(rs.getString("gid"));
            }
            // 5. Disconnect
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("something went wrong " + e.getMessage());
        }        
    }
}
