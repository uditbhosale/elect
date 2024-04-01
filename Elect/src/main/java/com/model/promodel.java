package com.model;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Response;

import com.entity.orders_address;
import com.entity.product_entity;
import com.entity.signup_entity;
import com.mysql.cj.protocol.Resultset;

public class promodel {
	
	Connection conn;
	
	public promodel(Connection conn) {
		
		super();
		
		this.conn=conn;
		
	}

	public boolean user_signup(signup_entity s) throws SQLException {
		// TODO Auto-generated method stub
		boolean b=false;
		
		String sql="insert into user(firstname,lastname,email,password) values(?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1,s.getFirstname());
		ps.setString(2,s.getLastname());
		ps.setString(3,s.getEmail());
		ps.setString(4,s.getPassword());
		
		
		int i=ps.executeUpdate();
		
		if(i==1) {
			
			System.out.println("Inserted");
			b=true;
		}
		
		
		return b;
	}

	public signup_entity user_login(String email, String password) throws SQLException {
		// TODO Auto-generated method stub
		signup_entity b=null;
		String sql="select * from user where email=? and password=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1,email);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()) {
			 b=new signup_entity();
			b.setId(rs.getInt(1));
			b.setFirstname(rs.getString(2));
			b.setLastname(rs.getString(3));
			b.setEmail(rs.getString(4));
			b.setPassword(rs.getString(5));
			System.out.println("logged in ");
			
		} 
		else {
			
			System.out.println("Incorrect user or password");
		}
		return b;
	}

	public int insert_product(int id,String name,String description,InputStream file,String price,double price2) throws SQLException {
		// TODO Auto-generated method stub
		
		
		
		String sql="insert into products(id,product_name,product_description,product_image,price,price_num) values(?,?,?,?,?,?)";
		int row=0;
		
		PreparedStatement preparedstatement;
		
		try {
			preparedstatement=conn.prepareStatement(sql);
			
			preparedstatement.setInt(1,id);		
			preparedstatement.setString(2,name);
			preparedstatement.setString(3,description);
			
			if(file!=null) {
				preparedstatement.setBlob(4,file);
				
			}
			preparedstatement.setString(5,price);
			preparedstatement.setDouble(6,price2);
			
			row=preparedstatement.executeUpdate();
		}
		catch (SQLException e) {
			// TODO: handle exception
			
			System.out.println(e.getMessage());
		}
		
		
		
		return row;
	}
	
	public List<product_entity> fetch_product() throws SQLException{
		
		ArrayList<product_entity> al=new ArrayList<product_entity>();
		String sql="select id,product_name,product_description,price from products";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			product_entity p=new product_entity();
			p.setId(rs.getInt(1));
			p.setProduct_namel(rs.getString(2));
			p.setDescription(rs.getString(3));
			p.setPrice(rs.getString(4));
			
			al.add(p);
		}
		
		
		
		return al;
		
	}
	
	public List<product_entity> display_items() throws SQLException{
		
		ArrayList<product_entity> al=new ArrayList<product_entity>();
		String sql="select product_name,product_description,price,id,product_image from products";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			product_entity p1=new product_entity();
			
			p1.setProduct_namel(rs.getString(1));
			p1.setDescription(rs.getString(2));
			p1.setPrice(rs.getString(3));
			p1.setId(rs.getInt(4));
			
			
			p1.setImage(rs.getBytes(5));;
			
			
			al.add(p1);
		}
		return al;
		
	}
	
	public List<product_entity> addtocart(int productid) throws SQLException{
		ArrayList<product_entity> al=new ArrayList<product_entity>();
		String sql="select * from products where id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,productid);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			
			product_entity p=new product_entity();
			p.setId(rs.getInt(1));
			p.setProduct_namel(rs.getString(2));
			p.setDescription(rs.getString(3));
			//p.setImage(rs.getBlob(4));
			p.setPrice(rs.getString(5));
			Blob blob= rs.getBlob(4);
			if(blob!=null) {
				
				byte[] imageData=blob.getBytes(1,(int)blob.length());
				p.setImage(imageData);
			}
			
			
			al.add(p);
		}
		return al;
		
		
		
		
		
	}
	public ArrayList<product_entity> displaycart(ArrayList<product_entity> cart_list) throws SQLException{
		
		ArrayList<product_entity> al=new ArrayList<>();
		if(cart_list.size()>0) {
			
			for(product_entity e:cart_list) {
		String sql="select * from products where id=?";
		
		
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setInt(1,e.getId());
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			product_entity p=new product_entity();
			
			p.setId(rs.getInt(1));
			p.setProduct_namel(rs.getString(2));
			p.setDescription(rs.getString(3));
			//p.setImage(rs.getBlob(4));
			p.setPrice(rs.getString(5));
			p.setPrice2(rs.getDouble(6));
			Blob blob= rs.getBlob(4);
			if(blob!=null) {
				
				byte[] imageData=blob.getBytes(1,(int)blob.length());
				p.setImage(imageData);
			}
			al.add(p);
			
		}}}
		return al;
		
		
	}
	
	
	public double getTotalCartPrice(ArrayList<product_entity> cart_list) {
		
		
		double sum=0;
		
		try {
			
			if(cart_list.size()>0) {
				
				for(product_entity item:cart_list) {
					String sql="select * from products where id=?";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setInt(1,item.getId());
					ResultSet rs=ps.executeQuery();
					
					while(rs.next()) {
						sum+=rs.getDouble("price_num")*item.getQuantity();
						
					}
				}
			}
			
			
			
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return sum;
		
		
	}

	public boolean order_address(String fullname, long contact, String address, String city, long zip, String country) throws SQLException {
		// TODO Auto-generated method stub
		boolean b=false;
		String sql="insert into order_address(fullname,contact,address,city,zipcode,country) values(?,?,?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,fullname);
		ps.setLong(2,contact);
		ps.setString(3,address);
		ps.setString(4,city);
		ps.setLong(5,zip);
		ps.setString(6,country);
		
		int i=ps.executeUpdate();
		
		if(i==1) {
			
			System.out.println("Inserted");
			b=true;
			
		}
		return b;
	}
	public List<orders_address> display_details() throws SQLException{
		
		ArrayList<orders_address> al=new ArrayList<orders_address>();
		
		String sql="select * from order_address";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			orders_address o=new orders_address();
			o.setId(rs.getInt(1));
			o.setFullname(rs.getString(2));
			o.setContact(rs.getLong(3));
			o.setAddress(rs.getString(4));
			o.setCity(rs.getString(5));
			o.setZip(rs.getLong(6));
			o.setCountry(rs.getString(7));
			al.add(o);
			
		}
		System.out.println(al);
		return al;
		
	}
	
	public List<product_entity> search_items(String product_description, String product_name) throws SQLException {
	    ArrayList<product_entity> al = new ArrayList<product_entity>();
	    String sql = "SELECT product_name, product_description, price, id, product_image FROM products WHERE product_name LIKE ? OR product_description LIKE ?";
	    PreparedStatement ps = conn.prepareStatement(sql);

	    // Adding '%' wildcard characters to the parameters for LIKE comparison
	    ps.setString(1, "%" + product_name + "%");
	    ps.setString(2, "%" + product_description + "%");

	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
	        product_entity p = new product_entity();
	        p.setId(rs.getInt("id"));
	        p.setProduct_namel(rs.getString("product_name"));
	        p.setDescription(rs.getString("product_description"));
	        p.setPrice(rs.getString("price"));

	        Blob blob = rs.getBlob("product_image");
	        if (blob != null) {
	            byte[] imageData = blob.getBytes(1, (int) blob.length());
	            p.setImage(imageData);
	        }
	        
	        
	        al.add(p);
	    }
	   
	    
	    return al;
	}

	public boolean deleteaddress(int id) throws SQLException {
		// TODO Auto-generated method stub
		boolean b=false;
		String sql="delete from order_address where id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		
		int i=ps.executeUpdate();
		
		if(i==1) {
			System.out.println("Deleted");
			b=true;
			
			
		}
		
		return b;
	}

	public boolean placeOrder(ArrayList<product_entity> cartList, int userId, String date,double price) throws SQLException {
	    boolean b = false;

	    String sql = "INSERT INTO pre_order (u_id, p_id, o_price, o_date) VALUES (?, ?, ?, ?)";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        conn.setAutoCommit(false); // 

	       
	        for (product_entity product : cartList) {
	            ps.setInt(1, userId);
	            ps.setInt(2, product.getId());
	            ps.setDouble(3,price);
	            ps.setString(4, date);
	            ps.addBatch();
	           
	        }

	        // Execute batch update
	        
	        int[] result = ps.executeBatch();

	        // Check if all statements were executed successfully
	        for (int i : result) {
	            if (i <= 0) {
	                b = false;
	                return b; // Return false if any statement failed
	            }
	        }

	        // If all statements were executed successfully
	        b = true;
	        conn.commit(); // Commit transaction
	    } catch (SQLException e) {
	        // Handle SQLException
	        conn.rollback(); // Rollback transaction
	        throw e; // Rethrow exception
	    } finally {
	        conn.setAutoCommit(true); // Enable autocommit
	    }

	    return b;
	}

	public boolean totalprice(double totalprice) throws SQLException {
		// TODO Auto-generated method stub
		boolean b=false;
		
		String sql="insert into order_total(totalprice) values(?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setDouble(1, totalprice);
		
		int i=ps.executeUpdate();
		if(i==1) {
			
			System.out.println("Inserted in totalorders");
			b=true;
		}
		
		
		return b;
	}


}
