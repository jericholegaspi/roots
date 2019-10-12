package model.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.*;
import javax.sql.DataSource;

import model.admin.RootsInventoryBean;

public class AddOrderBean {
	
	private RootsInventoryBean productObj = new RootsInventoryBean();

	//inputs
	private int userID;
	private int prodID;
	private int catID;
	private int paymentStatusID;
	private int deliveryStatusID;
	private int orderStatusID;
	private int deliveryAddressID;
	
	//computed values	
	private int orderPrice;
	
	//values for computation
	private int prodPrice;
	private int orderQuantity;
	private int prodQty;
	
	
	
	public void process() {
		computeOrderPrice();
	}
	
	public void computeOrderPrice() {
		orderPrice = prodPrice * orderQuantity;
	}
	
	public int getPaymentStatusID() {
		return paymentStatusID;
	}

	public void setPaymentStatusID(int paymentStatusID) {
		this.paymentStatusID = paymentStatusID;
	}

	public int getDeliveryStatusID() {
		return deliveryStatusID;
	}

	public void setDeliveryStatusID(int deliveryStatusID) {
		this.deliveryStatusID = deliveryStatusID;
	}

	public int getOrderStatusID() {
		return orderStatusID;
	}

	public void setOrderStatusID(int orderStatusID) {
		this.orderStatusID = orderStatusID;
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
	
	private Connection getDBConnection() {
		Connection connection = null;
		
		try {
		/*Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/ProgAp3-TI001");
		connection = ds.getConnection();*/
		
		connection = ((DataSource) InitialContext.doLookup("java:/comp/env/jdbc/rootsdb")).getConnection();

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
			String sql = "INSERT INTO orderstable (userID, prodID, catID, paymentStatusID, "
					+ "deliveryStatusID, orderStatusID, orderQuantity, orderPrice) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, 1);
				pstmnt.setInt(2, productObj.getProdID());
				pstmnt.setInt(3, productObj.getCategoryID());
				pstmnt.setInt(4, 1);
				pstmnt.setInt(5, 1);
				pstmnt.setInt(6, 1);
				pstmnt.setInt(7, this.orderQuantity);
				pstmnt.setInt(8, this.orderPrice);
				
				
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
