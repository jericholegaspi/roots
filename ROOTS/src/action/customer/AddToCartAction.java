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
		
		System.out.println("User ID: " + orderObj.getUserID());
		System.out.println("Product ID: " + orderObj.getProdID());
		
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
		ResultSet resultSet = null;
		
		
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			PreparedStatement checkOrderRecordExists = connection.prepareStatement("SELECT 1 FROM orders WHERE userID = ?");
			checkOrderRecordExists.setInt(1, orderObj.getUserID());
			/* checkOrderRecordExists.setString(2, "CheckOut"); */
		    try (ResultSet rs = checkOrderRecordExists.executeQuery()) {
		        if (rs.next()) {
		        	statement = connection.createStatement();
					String sqlproduct = "SELECT * FROM orders";
					resultSet = statement.executeQuery(sqlproduct);
					while (resultSet.next()) {
						if(resultSet.getString("cartStatus").equals("Idle")){	 
							orderObj.insertOrderItemRecord();
							System.out.println("~~~ADD ITEM ORDER~~~");
						}else{
							/* orderObj.startOrderFlow(); */
							System.out.println("~~~ELSE~~~");
						}
					}
		        } else {
		            try {
		            	orderObj.startOrderFlow();
		            	System.out.println("~~~START ORDER FLOW~~~");
		            }catch (Exception e) {
		    			e.printStackTrace();
		            	}	
		        	} 
		    	} catch (Exception e) {
		    	e.printStackTrace();
		    }
		}catch (Exception e) {
	    	e.printStackTrace();
		}
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
