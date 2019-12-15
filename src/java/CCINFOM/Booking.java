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
    public ArrayList <String> years = new ArrayList<String>();
    public ArrayList <String> months = new ArrayList<String>();
    
    public String booking_no;
    public String booked_date;
    public String numhours;
    public String totalcost;
    public String numpeople;
    public String groupno;
    public String offerid;
    
    public String saved_date;
    public String confirmed_date;
    public String cancelled_date;
    
    public String status;
    
    public String searchno;
    
    public String y;

    public int booking_status;
    
    
    public void addBooking() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?"+"user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO BOOKINGS (booking_no,booked_date,num_hours,totalcost,num_people,status,isGroup,group_no,offerid) VALUES (?,?,?,?,?,?,?,?,?)");
           
            
                stmt.setInt(1,Integer.parseInt(booking_no));
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
            conn.close();
            
        }
        
        catch(Exception e) {
            booking_status=0;
            System.out.println("something went wrong " + e.getMessage());
        }
    }
    
    public void getYears() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT DISTINCT(YEAR(booked_date)) AS y FROM bookings WHERE status='D' ORDER BY YEAR(booked_date)");
            // 3. Execute the SQL Statement
            ResultSet rs = stmt.executeQuery();
            // 4. Process the results
            years.clear();
            while (rs.next()) {
                years.add(rs.getString("y"));
            }
            // 5. Disconnect
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("something went wrong" + e.getMessage());
        }    
    } 
    
    public void getMonths() {
      try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT DISTINCT(MONTH(booked_date)) AS y FROM bookings WHERE status='D' AND YEAR(booked_date) = ? ORDER BY MONTH(booked_date);");
            // 3. Execute the SQL Statement
            stmt.setInt(1, Integer.parseInt(y));
            ResultSet rs = stmt.executeQuery();
            // 4. Process the results
            months.clear();
            while (rs.next()) {
                months.add(rs.getString("y"));
            }
            // 5. Disconnect
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("something went wrong" + e.getMessage());
        }           
    }  
    
    public void getMonths2() {
      try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT	DISTINCT MONTH(cb.booked_date) AS y\n" +
                                                            "	FROM	CLIENT_USERS CU JOIN CLIENT_BOOKINGS CB \n" +
                                                            "	ON	 CU.EMAIL = CB.EMAIL JOIN BOOKINGS B ON\n" +
                                                            "    b.booking_no = cb.booking_no\n" +
                                                            "	WHERE	YEAR(cb.booked_date) =  ? AND \n" +
                                                            "	B.STATUS = 'D' ORDER BY MONTH(cb.booked_date)");
            // 3. Execute the SQL Statement
            stmt.setInt(1, Integer.parseInt(y));
            ResultSet rs = stmt.executeQuery();
            // 4. Process the results
            months.clear();
            while (rs.next()) {
                months.add(rs.getString("y"));
            }
            // 5. Disconnect
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("something went wrong" + e.getMessage());
        }           
    }  
    public void getYears2() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT	DISTINCT YEAR(cb.booked_date) AS y\n" +
                                                            "	FROM	CLIENT_USERS CU JOIN CLIENT_BOOKINGS CB \n" +
                                                            "	ON	 CU.EMAIL = CB.EMAIL JOIN BOOKINGS B ON\n" +
                                                            "    b.booking_no = cb.booking_no\n" +
                                                            "	WHERE	B.STATUS = 'D' ORDER BY YEAR(cb.booked_date)");
            // 3. Execute the SQL Statement
            ResultSet rs = stmt.executeQuery();
            // 4. Process the results
            years.clear();
            while (rs.next()) {
                years.add(rs.getString("y"));
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
    
    public void updateBooking() {
        try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?"+"user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("UPDATE BOOKINGS SET booked_date=?,num_hours=?,totalcost=?,num_people=?,status=?,isGroup=?,group_no=?,offerid=?, saved_date=?, confirmed_date=?, cancelled_date=?, status=? WHERE booking_no=?");
                
                stmt.setString(1,booked_date);
                stmt.setInt(2,Integer.parseInt(numhours));
                stmt.setFloat(3,Float.parseFloat(totalcost));
                stmt.setInt(4,Integer.parseInt(numpeople));
                stmt.setString(5,"P");
                if(Integer.parseInt(numpeople)>1)
                    stmt.setString(6,"Y");
                else
                    stmt.setString(6,"N");
                stmt.setInt(7,Integer.parseInt(groupno));
                stmt.setInt(8,Integer.parseInt(offerid));
                stmt.setString(9,saved_date);
                stmt.setString(10,confirmed_date);
                stmt.setString(11,cancelled_date);
                stmt.setString(12,status);
                stmt.setInt(13,Integer.parseInt(booking_no));
                
                // 3. Execute the SQL Statement
                stmt.executeUpdate();
            
            // 4. Process the results
            booking_status = 1;
            
            // 5. Disconnect
            stmt.close();
            conn.close();
            
        }
        
        catch(Exception e) {
            booking_status=0;
            System.out.println("something went wrong " + e.getMessage());
        }
    }
    
    public void displayBooking() {
      try {
            // 1. Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM bookings WHERE booking_no = "+searchno);
            // 3. Execute the SQL Statement
            ResultSet rs = stmt.executeQuery();
            rs.next();
            // 4. Process the results
            booking_no = rs.getString("booking_no");
            booked_date = rs.getString("booked_date");
            numhours = rs.getString("num_hours");
            saved_date = rs.getString("saved_date");
            if(saved_date.equals("9999-12-31"))
                saved_date = "N/A";
            confirmed_date = rs.getString("confirmed_date");
            if(confirmed_date.equals("9999-12-31"))
                confirmed_date = "N/A";
            cancelled_date = rs.getString("cancelled_date");
            if(cancelled_date.equals("9999-12-31"))
                cancelled_date = "N/A";
            totalcost = rs.getString("totalcost");
            numpeople = rs.getString("num_people");
            status = rs.getString("status");
            groupno = rs.getString("group_no");
            offerid = rs.getString("offerid");
            
            
            // 5. Disconnect
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("something went wrong " + e.getMessage());
        }  
    }
    

    
    
}
