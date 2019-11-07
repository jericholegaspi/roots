package model.customer;

import java.sql.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AddOrderBean {

	//inputs
	private int userID;
	private int prodID;
	private int catID;
	private int orderID;
	private String prodName;
	private int deliveryAddressID;
	private int initialPrice;

	//values for computation
	private int cartItemTotalCount;
	private int orderItemQty;
	private int orderItemSubTotal;
	
	//computed values
	private int orderTotalPrice;
	private String paymentStatus;
	private String deliveryStatus;
	private String orderStatus;
	private String cartStatus;
	private String cartState;
	
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
		computeCartTotalAmount();
	}
	
	public void startOrderFlow() {
		insertOrderRecord();
		insertOrderItemRecord();
		insertOrderReferenceRecord();
	}
	
	public void proceedToBilling(){
		goToBillingRecord();
		insertReferenceOrderIDRecord();
		insertCartTotalPriceRecord();
	}
	public void computeCartTotalAmount() {
		orderItemSubTotal = this.initialPrice * this.orderItemQty;
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

	public int getOrderID() {
		return orderID;
	}
	
	public int getInitialPrice() {
		return initialPrice;
	}

	public void setInitialPrice(int initialPrice) {
		this.initialPrice = initialPrice;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
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
	public double getOrderTotalPrice() {
		return orderTotalPrice;
	}
	
	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public double getCartItemTotalCount() {
		return cartItemTotalCount;
	}

	public void setCartItemTotalCount(int cartItemTotalCount) {
		this.cartItemTotalCount = cartItemTotalCount;
	}

	public double getOrderItemSubTotal() {
		return orderItemSubTotal;
	}

	public void setOrderItemSubTotal(int orderItemSubTotal) {
		this.orderItemSubTotal = orderItemSubTotal;
	}
	
	public String getCartStatus() {
		return cartStatus;
	}

	public void setCartStatus(String cartStatus) {
		this.cartStatus = cartStatus;
	}

	public String getCartState() {
		return cartState;
	}

	public void setCartState(String cartState) {
		this.cartState = cartState;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getOrderItemQty() {
		return orderItemQty;
	}

	public void setOrderItemQty(int orderItemQty) {
		this.orderItemQty = orderItemQty;
	}

	private Connection getDBConnection() {
		Connection connection = null;
		/*try {
			connection = ((DataSource) InitialContext.doLookup("java:/comp/env/jdbc/isproj2_roots")).getConnection();

		} catch (NamingException ne) {
			System.err.println("Error on getDBConnection: " + ne.getMessage());
		} catch (SQLException sqle) {
			System.err.println("Error on getDBConnection: " + sqle.getMessage());
		}
		return connection;*/
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
	
	public boolean insertOrderRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO orders (userID, paymentStatus, deliveryStatus,"
					+ " orderStatus, cartStatus) VALUES (?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				pstmnt.setString(2, "Not yet paid");
				pstmnt.setString(3, "Processing");
				pstmnt.setString(4, "Incomplete");
				pstmnt.setString(5, "Idle");
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertOrderRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertOrderItemRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO orderItems (userID, prodID, cartState, orderItemQty, orderItemSubTotal)"
					+ " VALUES (?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				pstmnt.setInt(2, this.prodID);
				pstmnt.setString(3, "Idle");
				pstmnt.setInt(4, this.orderItemQty);
				pstmnt.setInt(5, this.orderItemSubTotal);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertOrderItemRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertOrderItemSubTotalRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orderItems SET orderItemSubTotal = ?  WHERE userID = ? AND cartState = ? AND prodID = ?";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.orderItemSubTotal);
				pstmnt.setInt(2, this.userID);
				pstmnt.setString(3, "Idle");
				pstmnt.setInt(4, this.prodID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertOrderItemSubTotalRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertOrderReferenceRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO orderReference (userID, cartCondition)"
					+ " VALUES (?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.userID);
				pstmnt.setString(2, "Idle");
				
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertOrderReferenceRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean removeCartItemRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orderItems SET cartState = ? WHERE prodID = ?";
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, "Removed");	
				pstmnt.setInt(2, this.prodID);	
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on removeCartItemRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean goToBillingRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orderItems SET orderID = ? WHERE cartState = ? AND userID = ?";
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.orderID);	
				pstmnt.setString(2, "Idle");
				pstmnt.setInt(3, this.userID);
				
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on goToBillingRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertReferenceOrderIDRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orderReference SET orderID = ? WHERE cartCondition = ? AND userID = ?";
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.orderID);	
				pstmnt.setString(2, "Idle");	
				pstmnt.setInt(3, this.userID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertReferenceOrderIDRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertCartTotalPriceRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orders SET orderTotalPrice = ?, cartItemTotalCount = ? WHERE cartStatus = ? AND userID = ?";
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.orderTotalPrice);	
				pstmnt.setInt(2, this.cartItemTotalCount);	
				pstmnt.setString(3, "Idle");	
				pstmnt.setInt(4, this.userID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertCartTotalPriceRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean editCartItemQuantityRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE orderItems SET orderItemQty = ?, orderItemSubTotal = ? WHERE cartState = ? AND userID = ? AND prodID = ?";
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.orderItemQty);
				pstmnt.setInt(2, this.orderItemSubTotal);
				pstmnt.setString(3, "Idle");	
				pstmnt.setInt(4, this.userID);
				pstmnt.setInt(5, this.prodID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on editCartItemQuantityRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean addQtyToExistingCartItemRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			try {
				Statement statement = null;
				ResultSet resultSet = null;
				statement = connection.createStatement();
				String sqlproduct = "SELECT * FROM orderItems"
						+ " WHERE userID = " + this.userID + " AND"
						+ " orderItems.cartState = 'Idle' AND prodID = " + this.prodID;
				resultSet = statement.executeQuery(sqlproduct);
				resultSet.first();
				
				String sql = "UPDATE orderItems SET orderItemQty = ?, orderItemSubTotal = ? WHERE cartState = ? AND userID = ? AND prodID = ?";
				try {
					PreparedStatement pstmnt = connection.prepareStatement(sql);
					
					pstmnt.setInt(1, resultSet.getInt("orderItemQty") + this.orderItemQty);
					pstmnt.setInt(2, resultSet.getInt("orderItemSubTotal") + this.orderItemSubTotal);
					pstmnt.setString(3, "Idle");	
					pstmnt.setInt(4, this.userID);
					pstmnt.setInt(5, this.prodID);
					
					pstmnt.executeUpdate();
					return true;
				} catch (SQLException sqle) {
					System.err.println("Error on addQtyOnExistingCartItemRecord: " + sqle.getMessage());
				}			
			}
			catch (Exception e) {
			e.printStackTrace();
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
}

/*
Payment Statuses CASHLESS
1. Not Yet paid
2. Paid
3. Cancelled

Payment Status COD
1.
2.
3.

Delivery Statuses
1. Processing (While waiting for PayPal Payment)
2. Ready for Pickup (Admin)
3. Ready for Delivery (Admim)
4. In Transit (Admin)
5. Delivered (Admin)
6. Cancelled (If cancelled by user)

Order Statuses
1. Incomplete (If Payment Status = Not yet Paid & Delivery Status = Processing)
2. Complete (If Payments Status = Paid & Delivery Status = Delivered)
3. Cancelled (If cancelled by user)

Order Reference Status
1. Pending
2. Set
3. Cancelled

Cart Statuses in orders table
1. Idle
2. Processing
3. CheckOut
4. Cancelled
*/
