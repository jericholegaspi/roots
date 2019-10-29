package model.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AddOrderBean {

	//inputs
	private int userID;
	private int prodID;
	private int catID;
	private String paymentStatus;
	private String deliveryStatus;
	private String orderStatus;
	private int deliveryAddressID;
	private String cartStatus;
	
	//computed values
	private int orderPrice;
	
	//values for computation
	private int prodPrice;
	private int orderQuantity;
	private int prodQty;
	
	/*
	 	Payment Statuses
		1. Not Yet paid
		2. Paid
		3. Cancelled
		
	 	Delivery Statuses
		1. Processing
		2. Ready for Pickup
		3. Ready for Delivery
		4. In Transit
		5. Delivered
		6. Cancelled

		Order Statuses
		1. Incomplete
		2. Complete
		3. Cancelled
		
		Order Reference Status
		1. Pending
		2. Set
		3. Cancelled

		Cart Statuses
		1. Pending
		2. CheckOut
	 */

	
	public void process() {
		computeOrderPrice();
	}
	
	public void computeOrderPrice() {
		orderPrice = prodPrice * orderQuantity;
	}
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getProdID() {
		return prodID;
	}
	public void setProdID(int prodID) {
		this.prodID = prodID;
	}
	public int getCatID() {
		return catID;
	}
	public void setCatID(int catID) {
		this.catID = catID;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getDeliveryAddressID() {
		return deliveryAddressID;
	}
	public void setDeliveryAddressID(int deliveryAddressID) {
		this.deliveryAddressID = deliveryAddressID;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public double getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQty(int orderQty) {
		this.orderQuantity = orderQty;
	}
	public double getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public double getProdQty() {
		return prodQty;
	}

	public void setProdQty(int prodQty) {
		this.prodQty = prodQty;
	}

	public double getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	
	public String getCartStatus() {
		return cartStatus;
	}

	public void setCartStatus(String cartStatus) {
		this.cartStatus = cartStatus;
	}

	private Connection getDBConnection() {
		Connection connection = null;
		
		try {
			connection = ((DataSource) InitialContext.doLookup("java:/comp/env/jdbc/isproj2_roots")).getConnection();

		} catch (NamingException ne) {
			System.err.println("Error on getDBConnection: " + ne.getMessage());
		} catch (SQLException sqle) {
			System.err.println("Error on getDBConnection: " + sqle.getMessage());
		}
		return connection;
	}
	
	public boolean insertRecordOrder() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO orderstable (userID, prodID, catID,"
					+ " paymentStatus, deliveryStatus, orderStatus, cartStatus) "
					+ " VALUES (?,?,?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				pstmnt.setInt(2, this.prodID);
				pstmnt.setInt(3, this.catID);
				pstmnt.setString(4, "Not yet paid");
				pstmnt.setString(5, "Processing");
				pstmnt.setString(6, "Incomplete");
				pstmnt.setString(7, "Pending");
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertRecordOrder: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
}
