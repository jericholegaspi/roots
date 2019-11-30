package model.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.*;
import javax.sql.*;
import java.sql.Date;
import java.sql.DriverManager;

public class RootsInventoryBean {
	
	// inputs
	private int prodID;
	private String prodName;
	private int catID;
	private String category;
	private int initialPrice;
	private int prodQty;
	private int unitID;
	private String description;
	private String availability;
	private int critLevel;
	private Date expDate;
	private int prodQtyChange;
	private String qtyChangeDesc;
	private int prodPriceChange;
	private int prodPriceChangeRefNoID;
	private String prodQtyChangeRef;
	private String productImageName;
	private String productImageType;
	
	public void process() {
	}
	
	public void updateQty() {
		updateQtyRecord();
		insertQtyRecord();
	}
	
	public void updatePrice() {
		updatePriceRecord();
		insertPriceRefRecord();
		insertPriceRecord();
	}
	
	public int getProdID() {
		return prodID;
	}

	public void setProdID(int prodID) {
		this.prodID = prodID;
	}

	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getCatID() {
		return catID;
	}
	public void setCatID(int catID) {
		this.catID = catID;
	}
	public int getInitialPrice() {
		return initialPrice;
	}
	public void setInitialPrice(int initialPrice) {
		this.initialPrice = initialPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	public String getAvailability() {
		return availability;
	}
	public int getCritLevel() {
		return critLevel;
	}

	public void setCritLevel(int critLevel) {
		this.critLevel = critLevel;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public int getProdQty() {
		return prodQty;
	}
	public void setProdQty(int prodQty) {
		this.prodQty = prodQty;
	}
	public int getUnitID() {
		return unitID;
	}

	public void setUnitID(int unitID) {
		this.unitID = unitID;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}	

	public int getProdQtyChange() {
		return prodQtyChange;
	}

	public void setProdQtyChange(int prodQtyChange) {
		this.prodQtyChange = prodQtyChange;
	}

	public String getQtyChangeDesc() {
		return qtyChangeDesc;
	}

	public void setQtyChangeDesc(String qtyChangeDesc) {
		this.qtyChangeDesc = qtyChangeDesc;
	}

	public int getProdPriceChange() {
		return prodPriceChange;
	}

	public void setProdPriceChange(int prodPriceChange) {
		this.prodPriceChange = prodPriceChange;
	}

	public int getProdPriceChangeRefNoID() {
		return prodPriceChangeRefNoID;
	}

	public void setProdPriceChangeRefNoID(int prodPriceChangeRefNoID) {
		this.prodPriceChangeRefNoID = prodPriceChangeRefNoID;
	}

	public String getProdQtyChangeRef() {
		return prodQtyChangeRef;
	}

	public void setProdQtyChangeRef(String prodQtyChangeRef) {
		this.prodQtyChangeRef = prodQtyChangeRef;
	}

	public String getProductImageName() {
		return productImageName;
	}

	public void setProductImageName(String productImageName) {
		this.productImageName = productImageName;
	}

	public String getProductImageType() {
		return productImageType;
	}

	public void setProductImageType(String productImageType) {
		this.productImageType = productImageType;
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
	
	public boolean insertProductRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO products (prodName, catID, initialPrice,"
					+ " prodQty, unitID, description, availability, critLevel)"
					+ " VALUES (?,?,?,?,?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.prodName);
				pstmnt.setInt(2, this.catID);
				pstmnt.setInt(3, this.initialPrice);
				pstmnt.setInt(4, this.prodQty);
				pstmnt.setInt(5, this.unitID);
				pstmnt.setString(6, this.description);
				pstmnt.setString(7, this.availability);
				pstmnt.setInt(8, this.critLevel);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertProductRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean updateProductRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE products SET prodName=?, catID=?,"
					+ " unitID=?, description=?"
					+ " WHERE prodID = ?";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.prodName);
				pstmnt.setInt(2, this.catID);
				pstmnt.setInt(3, this.unitID);
				pstmnt.setString(4, this.description);
				pstmnt.setInt(5, this.prodID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on editProductRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}

	public boolean outOfStockRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE products SET prodName=?, catID=?,"
					+ " initialPrice=?, prodQty=?, unitID=?, description=?"
					+ " WHERE prodID = ?";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.prodName);
				pstmnt.setInt(2, this.catID);
				pstmnt.setInt(3, this.initialPrice);
				pstmnt.setInt(4, this.prodQty);
				pstmnt.setInt(5, this.unitID);
				pstmnt.setString(6, this.description);
				pstmnt.setInt(7, this.prodID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertCategoryRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO category (category) VALUES (?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.category);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertCategoryRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean updateQtyRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE products SET prodQty=? WHERE prodID = ?";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.prodQty + this.prodQtyChange);
				pstmnt.setInt(2, this.prodID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on updateQtyRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertQtyRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO inventory (prodID, prodQtyChange, qtyChangeDesc, prodQtyChangRef)"
					+ " VALUES (?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.prodID);
				pstmnt.setInt(2, this.prodQtyChange);
				pstmnt.setString(3, "In");
				pstmnt.setString(4, this.prodQtyChangeRef);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertQtyRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean updatePriceRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE products SET initialPrice=? WHERE prodID = ?";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.prodPriceChange);
				pstmnt.setInt(2, this.prodID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on updatePriceRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertPriceRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO prodPrice (prodID, prodPriceChange, prodPriceChangeRefNoID)"
					+ " VALUES (?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.prodID);
				pstmnt.setInt(2, this.prodPriceChange);
				pstmnt.setInt(3, this.prodPriceChangeRefNoID);
				
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertPriceRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean insertPriceRefRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO prodPriceChangeRef (prodPriceID)"
					+ " VALUES (?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setInt(1, this.prodID);
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on insertPriceRefRecord: " + sqle.getMessage());
			}
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	public boolean archiveProductRecord() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE products SET availability = ? WHERE prodID = ?";
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, "Archived");	
				pstmnt.setInt(2, this.prodID);	
				
				pstmnt.executeUpdate();
				return true;
			} catch (SQLException sqle) {
				System.err.println("Error on archiveProductRecord: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
}
