package roots.address.model;

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
public class AddressBean {
	
	private int userID;
	private int deliveryAddressID;
	
	//database inputs
	private String addressType;
	private String houseNumber;
	private String street;
	private String barangay;
	private String city;
	private String province;
	private int postalCode;
	
	//Design-Facade
	public void insertHome() {
		insertHomeAddress();
	}
	
	public void updateHome() {
		updateHomeAddress();
	}
	
	public void deleteHome() {
		deleteHomeAddress();
	}
	
	public void insertWork() {
		insertWorkAddress();
	}
	
	public void updateWork() {
		updateWorkAddress();
	}
	
	public void deleteWork() {
		deleteWorkAddress();
	}
	

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getDeliveryAddressID() {
		return deliveryAddressID;
	}

	public void setDeliveryAddressID(int deliveryAddressID) {
		this.deliveryAddressID = deliveryAddressID;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getBarangay() {
		return barangay;
	}

	public void setBarangay(String barangay) {
		this.barangay = barangay;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public int getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
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
	
	public boolean insertHomeAddress() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO deliveryaddress (userID, addressType, houseNumber, street, "
					+ "barangay, city, province, postalCode, "
					+ "addressDateAdded) "
					+ " VALUES (?,?,?,?,?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				pstmnt.setString(2, "home");
				pstmnt.setString(3, this.houseNumber);
				pstmnt.setString(4, this.street);
				pstmnt.setString(5, this.barangay);
				pstmnt.setString(6, this.city);
				pstmnt.setString(7, this.province);
				pstmnt.setInt(8, this.postalCode);
				pstmnt.setDate(9, java.sql.Date.valueOf(java.time.LocalDate.now()));

				
				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on insertRecordAddress: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	
	public boolean updateHomeAddress() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE deliveryaddress "
	                + "SET houseNumber = ?, street = ?, barangay = ?, city = ?, province = ?, postalCode = ? "
	                + "WHERE deliveryAddressID = ?";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.houseNumber);
				pstmnt.setString(2, this.street);
				pstmnt.setString(3, this.barangay);
				pstmnt.setString(4, this.city);
				pstmnt.setString(5, this.province);
				pstmnt.setInt(6, this.postalCode);
				pstmnt.setInt(7, this.deliveryAddressID);
				
				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on UpdateRecordAddress: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	
	public boolean deleteHomeAddress() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "DELETE FROM deliveryaddress "
	                   + "WHERE userID = ? AND addressType = 'home'";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				
				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on DeleteRecordAddress: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	
	public boolean insertWorkAddress() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO deliveryaddress (userID, addressType, houseNumber, street, "
					+ "barangay, city, province, postalCode, "
					+ "addressDateAdded) "
					+ " VALUES (?,?,?,?,?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				pstmnt.setString(2, "work");
				pstmnt.setString(3, this.houseNumber);
				pstmnt.setString(4, this.street);
				pstmnt.setString(5, this.barangay);
				pstmnt.setString(6, this.city);
				pstmnt.setString(7, this.province);
				pstmnt.setInt(8, this.postalCode);
				pstmnt.setDate(9, java.sql.Date.valueOf(java.time.LocalDate.now()));

				
				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on insertRecordAddress: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	
	public boolean updateWorkAddress() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE deliveryaddress "
	                + "SET houseNumber = ?, street = ?, barangay = ?, city = ?, province = ?, postalCode = ? "
	                + "WHERE deliveryAddressID = ?";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.houseNumber);
				pstmnt.setString(2, this.street);
				pstmnt.setString(3, this.barangay);
				pstmnt.setString(4, this.city);
				pstmnt.setString(5, this.province);
				pstmnt.setInt(6, this.postalCode);
				pstmnt.setInt(7, this.deliveryAddressID);
				
				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on UpdateRecordAddress: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean deleteWorkAddress() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "DELETE FROM deliveryaddress "
	                   + "WHERE userID = ? AND addressType = 'work'";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				
				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on DeleteRecordAddress: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	 

}



