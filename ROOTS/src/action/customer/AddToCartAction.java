package action.customer;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.customer.AddOrderBean;

public class AddToCartAction extends ActionSupport implements ModelDriven<AddOrderBean>{
	
	private static final long serialVersionUID = 1L;
	
	private AddOrderBean orderObj = new AddOrderBean();
	
	public String execute() {
		
		orderObj.process();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("User ID: " + orderObj.getUserID());
		System.out.println("Product ID: " + orderObj.getProdID());
		System.out.println("Quantity: " + orderObj.getOrderItemQty());
		System.out.println("Price: " + orderObj.getInitialPrice());
		System.out.println("SubTotal: " + orderObj.getOrderItemSubTotal());
		
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost/";
		String dbName = "isproj2_roots";
		String userId = "isproj2_roots";
		String password = "^qp&6Afnsd7S^jRf";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Connection connection = null;
		Statement statement = null;
		Statement statement2 = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		
		
		
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			PreparedStatement checkOrderRecordExists = connection.prepareStatement("SELECT 1 FROM orders WHERE userID = ? AND cartStatus = ?");
			checkOrderRecordExists.setInt(1, orderObj.getUserID());
			checkOrderRecordExists.setString(2, "Idle");
		    try (ResultSet rs = checkOrderRecordExists.executeQuery()) {
		        if (rs.next()) { //There is already a record	
		        	statement = connection.createStatement();
					String sqlproduct = "SELECT * FROM orders";
					resultSet = statement.executeQuery(sqlproduct); 
					while (resultSet.next()) {
							if(resultSet.getString("cartStatus").equals("Idle") && resultSet.getInt("userID") == orderObj.getUserID()){	 
								PreparedStatement checkItemExists = connection.prepareStatement("SELECT 1 FROM orderItems WHERE userID = ? AND prodID = ? AND cartState = ?");
								checkItemExists.setInt(1, orderObj.getUserID());
								checkItemExists.setInt(2, orderObj.getProdID());
								checkItemExists.setString(3, "Idle");
								try (ResultSet rs2 = checkItemExists.executeQuery()){
									if(rs2.next()) {
										orderObj.addQtyToExistingCartItemRecord();
										System.out.println("~~~UPDATE ORDER ITEM~~~");							
									}else {
										orderObj.insertOrderItemRecord();
										System.out.println("~~~ADD ORDER ITEM~~~");	
									}
								}catch (Exception e) {
							    	e.printStackTrace();
								}
							}else{
							/*
							 * orderObj.startOrderFlow();
							 * System.out.println("~~~START FOLLOWING ORDER FLOW~~~");
							 */
								System.out.println("~~~ELSE~~~");
							}
					}
		        }else {
		            try {
		            	orderObj.startOrderFlow();
		            	System.out.println("~~~START ORDER FLOW~~~");
		            }catch (Exception e) {
		    			e.printStackTrace();
		    			System.out.println("~~~CATCH 1~~~");
		            }	
		        } 
	    	} catch (Exception e) {
	    	e.printStackTrace();
	    	System.out.println("~~~CATCH 2~~~");
	    	}
		}catch (Exception e) {
	    	e.printStackTrace();
	    	System.out.println("~~~CATCH 3~~~");
		}
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		return SUCCESS;
	}
	
	//Reference: https://stackoverflow.com/questions/42454582/check-if-value-accountnumber-exist-in-a-java-database

	public AddOrderBean getOrderObj() {
		return orderObj;
	}

	public void setOrderObj(AddOrderBean orderObj) {
		this.orderObj = orderObj;
	}

	@Override
	public AddOrderBean getModel() {
		return orderObj;
	}

}
