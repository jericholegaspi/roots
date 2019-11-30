package model.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.*;
import javax.sql.*;
import java.sql.Date;
import java.sql.DriverManager;

public class CatalogueManagementBean {
	
	// inputs
	private int catalogueID;

	public int getCatalogueID() {
		return catalogueID;
	}


	public void setCatalogueID(int catalogueID) {
		this.catalogueID = catalogueID;
	}


	public void process() {
	}
	

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
	
	/*
	 * public boolean updateDliveryStatusRecord() { Connection connection =
	 * getDBConnection();
	 * 
	 * if (connection != null) { //means a valid connection String sql =
	 * "UPDATE orders SET deliveryStatus=? WHERE orderID = ?";
	 * 
	 * try { PreparedStatement pstmnt = connection.prepareStatement(sql);
	 * 
	 * pstmnt.setString(1, this.deliveryStatus); pstmnt.setInt(2, this.orderID);
	 * 
	 * pstmnt.executeUpdate(); return true; } catch (SQLException sqle) {
	 * System.err.println("Error on editProductRecord: " + sqle.getMessage()); } }
	 * else { System.err.println("Missing on invalid connection."); } return false;
	 * }
	 */
}
	
		