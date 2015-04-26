package com.housing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class HomeDb {
	/* Global variables */
	   static  Connection con = null;
	   static  Statement stmt = null;
	   static  ResultSet rs = null;

	   // JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost/housing";

	   //  Database credentials
	   static final String USER = "";
	   static final String PASS = "";
	   
	   public void Connect() 
	   {
	      try
	      {
			//STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			//STEP 3: Open a connection
			System.out.println("Connecting to database...");
			con = DriverManager.getConnection(DB_URL,"root","");
			
			System.out.println("DB connected");
	      }
	      catch(SQLException se)
	      {
			//Handle errors for JDBC
			se.printStackTrace();
	      }
	      catch(Exception e)
	      {
			//Handle errors for Class.forName
			e.printStackTrace();
	      }

	   }//end connect
	   
	   /* Disconnect Database */
	   public void DisConnect() 
	   {
		      try
		      {
					if(rs != null)
						rs.close();
					if(stmt != null)
						stmt.close();
					if(con != null)
						con.close();
		    	  
		      }
		      catch(SQLException se)
		      {
				//Handle errors for JDBC
				se.printStackTrace();
		      }
		      catch(Exception e)
		      {
				//Handle errors for Class.forName
				e.printStackTrace();
		      }
	   }
	   /* Select Land Population */
	   public List<Properties> SelectLandPopu(String city, String location, String area, String price, String popu, String religion)
	   {
		   List<Properties> result = new ArrayList<Properties>();
	      try
	      {
	         Connect();
	         stmt = con.createStatement();
			 
	         String selectq="select * from land_master as l, "
			 	 		+ "aminities as a, "
			 	 		+ "owner_master as o, "
			 	 		+ "housing_rating as h, "
			 	 		+ "broker_master as b where "
			 	 				+ "a.land_id=l.land_id and "
			 	 				+ "o.owner_id=l.owner_id and "
			 	 				+ "h.land_id=l.land_id and "
			 	 				+ "b.broker_id=l.broker_id";
				
	         if('<' == area.charAt(0))  // area <30000
	         {
	 	 		selectq = selectq + " and l.area "+area;
	         }
	         else if ('>' == area.charAt(0))  // area >1000
	         {
	 	 		selectq = selectq + " and l.area "+area;
	         }
	         else // area 2500-30000
	         {
	        	 String arr[] = area.split("-");
	        	 System.out.println("arr[0]="+arr[0]);
	        	 System.out.println("arr[1]="+arr[1]);
	 	 		 selectq = selectq + " and l.area >= "+arr[0]+" and l.area <= "+arr[1];
	         } 	 		
	         selectq = selectq + " and l.city="+ "COALESCE('"+ city +"')";
		 
	         if('<' == price.charAt(0))  // price <30000
	         {
	        	System.out.println("price="+price);
	 	 		selectq = selectq + " and l.price "+price;
	         }
	         else if ('>' == price.charAt(0))  // price >3000
	         {
	 	 		selectq = selectq + " and l.price "+price;
	         }
	         else // price 2500-30000
	         {
	        	 String arr2[] = price.split("-");
	        	 System.out.println("arr2[0]="+arr2[0]);
	        	 System.out.println("arr2[0]="+arr2[1]);
	 	 		 selectq = selectq + " and l.price >= "+arr2[0]+" and l.price <= "+arr2[1];
	         }
	         selectq = selectq + " and l.location="+ "COALESCE('"+ location + "')";
	         
	         if('<' == popu.charAt(0))  // total_population <4
	         {
	 	 		selectq = selectq + " and h.existing_population "+popu;
	         }
	         else if ('>' == popu.charAt(0))  // total_population >1
	         {
	 	 		selectq = selectq + " and h.existing_population "+popu;
	         }
	         else // total_population 2-4
	         {
	        	 String arr[] = popu.split("-");
	        	 System.out.println("arr[0]="+arr[0]);
	        	 System.out.println("arr[1]="+arr[1]);
	 	 		 selectq = selectq + " and h.existing_population >= "+arr[0]+" and h.existing_population <= "+arr[1];
	         }
	         selectq = selectq + " and h.religion="+ "COALESCE('"+ religion + "')";
	         System.out.println(selectq);
		 	 rs = stmt.executeQuery(selectq);
		 	 while(rs.next()) 
		 	 {
			 		Properties property = new Properties();
			 		property.land_id = Integer.parseInt(rs.getString(1));
			 		property.city = rs.getString(2);
			 		property.location = rs.getString(3);
			 		property.owner_id = Integer.parseInt(rs.getString(4));
			 		property.area = Double.parseDouble(rs.getString(5));
			 		property.price = Double.parseDouble(rs.getString(6));
			 		property.broker_id = Integer.parseInt(rs.getString(7));
			 		property.latlng = rs.getString(8);
			 		property.video_url = rs.getString(9);
			 		property.Bus = Double.parseDouble(rs.getString(11));
			 		property.Railway = Double.parseDouble(rs.getString(12));
			 		property.Airport = Double.parseDouble(rs.getString(13));
			 		property.School = Double.parseDouble(rs.getString(14));
			 		property.Hospital = Double.parseDouble(rs.getString(15));
			 		property.Bus_Station_Name = rs.getString(16);
			 		property.Railway_Station_Name = rs.getString(17);
			 		property.Airport_Name = rs.getString(18);
			 		property.School_Name = rs.getString(19);
			 		property.Hospital_Name = rs.getString(20);
			 		property.oName = rs.getString(22);
			 		property.oContact = rs.getString(23);
			 		property.Existing_Population = Double.parseDouble(rs.getString(25));
			 		property.Cultural_Population = Double.parseDouble(rs.getString(26));
			 		property.Religion = rs.getString(27);
			 		property.bLocation = rs.getString(29);
			 		property.bName = rs.getString(30);
			 		property.bContact = rs.getString(31);
			 		result.add(property);
		 	 }
	      }
	      catch(Exception e) { e.printStackTrace(); }
	      finally
	      {
	    	 System.out.println("Done");
	         DisConnect();
	      }
	      return result;
	   }

	  
	   public List<Properties> SelectLand(String city, String location, String area, String price) 
	   {
		  List<Properties> result = new ArrayList<Properties>();
	      try
	      {
	         Connect();
			 stmt = con.createStatement();
			 String selectq="select * from land_master as l, "
			 	 		+ "aminities as a, "
			 	 		+ "owner_master as o, "
			 	 		+ "housing_rating as h, "
			 	 		+ "broker_master as b where "
			 	 				+ "a.land_id=l.land_id and "
			 	 				+ "o.owner_id=l.owner_id and "
			 	 				+ "h.land_id=l.land_id and "
			 	 				+ "b.broker_id=l.broker_id";
				
	         if('<' == area.charAt(0))  // area <30000
	         {
	 	 		selectq = selectq + " and l.area "+area;
	         }
	         else if ('>' == area.charAt(0))  // area >1000
	         {
	 	 		selectq = selectq + " and l.area "+area;
	         }
	         else // area 2500-30000
	         {
	        	 String arr[] = area.split("-");
	        	 System.out.println("arr[0]="+arr[0]);
	        	 System.out.println("arr[1]="+arr[1]);
	 	 		 selectq = selectq + " and l.area >= "+arr[0]+" and l.area <= "+arr[1];
	         } 	 		
	         selectq = selectq + " and l.city="+ "COALESCE('"+ city +"')";
	         selectq = selectq + " and l.location="+ "COALESCE('"+ location + "')";
		 
	         if('<' == price.charAt(0))  // price <30000
	         {
	        	System.out.println("price="+price);
	 	 		selectq = selectq + " and l.price "+price;
	         }
	         else if ('>' == price.charAt(0))  // price >3000
	         {
	 	 		selectq = selectq + " and l.price "+price;
	         }
	         else // price 2500-30000
	         {
	        	 String arr2[] = price.split("-");
	        	 System.out.println("arr2[0]="+arr2[0]);
	        	 System.out.println("arr2[0]="+arr2[1]);
	 	 		 selectq = selectq + " and l.price >= "+arr2[0]+" and l.price <= "+arr2[1];
	         }

	         System.out.println(selectq);
		 	 rs = stmt.executeQuery(selectq);
		 	 while(rs.next())
		 	 {
		 		Properties property = new Properties();
		 		property.land_id = Integer.parseInt(rs.getString(1));
		 		property.city = rs.getString(2);
		 		property.location = rs.getString(3);
		 		property.owner_id = Integer.parseInt(rs.getString(4));
		 		property.area = Double.parseDouble(rs.getString(5));
		 		property.price = Double.parseDouble(rs.getString(6));
		 		property.broker_id = Integer.parseInt(rs.getString(7));
		 		property.latlng = rs.getString(8);
		 		property.video_url = rs.getString(9);
		 		property.Bus = Double.parseDouble(rs.getString(11));
		 		property.Railway = Double.parseDouble(rs.getString(12));
		 		property.Airport = Double.parseDouble(rs.getString(13));
		 		property.School = Double.parseDouble(rs.getString(14));
		 		property.Hospital = Double.parseDouble(rs.getString(15));
		 		property.Bus_Station_Name = rs.getString(16);
		 		property.Railway_Station_Name = rs.getString(17);
		 		property.Airport_Name = rs.getString(18);
		 		property.School_Name = rs.getString(19);
		 		property.Hospital_Name = rs.getString(20);
		 		property.oName = rs.getString(22);
		 		property.oContact = rs.getString(23);
		 		property.Existing_Population = Double.parseDouble(rs.getString(25));
		 		property.Cultural_Population = Double.parseDouble(rs.getString(26));
		 		property.Religion = rs.getString(27);
		 		property.bLocation = rs.getString(29);
		 		property.bName = rs.getString(30);
		 		property.bContact = rs.getString(31);
		 		result.add(property);
		 	 }
		 	 
	      }
	      catch(Exception e)
	      {

			 	 e.printStackTrace();
	      }
	      finally
	      {
			 System.out.println("Done");
	         DisConnect();
	      }
	      return result;
	   }

	
	   
}