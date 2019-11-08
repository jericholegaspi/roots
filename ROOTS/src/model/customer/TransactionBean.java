package model.customer;

import java.util.Date;

//SHA-256 Libraries
import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import java.sql.*;
import javax.sql.*;



//Database Table Name
public class TransactionBean {

	
	private int userID;
	
	//database inputs
	private int deliveryAddressID;
	private float orderTotalPrice;
	private int orderReferenceID ;
	
	//Design-Facade
	public void paypalprocess() {
		updateOrdersPaypal();
		updateOrdersReference();
		updateOrderItems();
	}
	
	public void codprocess() {
		updateOrdersCOD();
		updateOrdersReference();
		updateOrderItems();
	}
	
	//Getters & Setters
	public int getDeliveryAddressID() {
		return deliveryAddressID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public void setDeliveryAddressID(int deliveryAddressID) {
		this.deliveryAddressID = deliveryAddressID;
	}

	public float getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(float orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public int getOrderReferenceID() {
		return orderReferenceID;
	}

	public void setOrderReferenceID(int orderReferenceID) {
		this.orderReferenceID = orderReferenceID;
	}
	
	//Get Database Connection
	private Connection getDBConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
				"jdbc:mysql://localhost/isproj2_roots", 
				"isproj2_roots", "^qp&6Afnsd7S^jRf");
		} catch (ClassNotFoundException cfne) {
			System.err.println(cfne.getMessage());
		} catch (SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return connection;
	}
			
	public boolean updateOrdersPaypal() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orders "
	                + "SET paymentStatus = ?, deliveryAddressID = ?, cartStatus = ?, orderTotalPrice = ?, orderReferenceID = ? "
	                + "WHERE userID = ? AND cartStatus = ?";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, "Paid");
				pstmnt.setInt(2, this.deliveryAddressID);
				pstmnt.setString(3, "CheckOut");
				pstmnt.setFloat(4, this.orderTotalPrice);
				pstmnt.setInt(5, this.orderReferenceID);
				pstmnt.setInt(6, this.userID);
				pstmnt.setString(7, "Idle");


				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on PayPalTransaction: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	
	public boolean updateOrdersCOD() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orders "
	                + "SET paymentStatus = ?, deliveryAddressID = ?, cartStatus = ?, orderTotalPrice = ?, orderReferenceID = ? "
	                + "WHERE userID = ? AND cartStatus = ?";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, "COD");
				pstmnt.setInt(2, this.deliveryAddressID);
				pstmnt.setString(3, "CheckOut");
				pstmnt.setFloat(4, this.orderTotalPrice);
				pstmnt.setInt(5, this.orderReferenceID);
				pstmnt.setInt(6, this.userID);
				pstmnt.setString(7, "Idle");


				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on PayPalTransaction: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
		 
	
	public boolean updateOrdersReference() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orderreference  "
	                + "SET cartCondition = ? "
	                + "WHERE userID = ? AND cartCondition = ?";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, "CheckOut");
				pstmnt.setInt(2, this.userID);
				pstmnt.setString(3, "Idle");


				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on PayPalTransaction: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean updateOrderItems() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orderitems "
	                + "SET cartState = ? "
	                + "WHERE userID = ? AND cartState = ?";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, "CheckOut");
				pstmnt.setInt(2, this.userID);
				pstmnt.setString(3, "Idle");

				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on PayPalTransaction: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}

}



