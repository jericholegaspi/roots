package action.admin;

//File Upload Packages
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
/*import org.apache.commons.io.FileUtils;*/
import org.apache.struts2.interceptor.ServletRequestAware;

//Action Support * ModelDriven 
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

//JavaBean Packages
import model.admin.OrderManagementBean;

public class UpdateDeliveryStatusAction extends ActionSupport implements ModelDriven<OrderManagementBean>, ServletRequestAware{

	private static final long serialVersionUID = 1L;
	
	private File imageFile;
	private String imageContentType; 
	private String imageName;
	
	private HttpServletRequest servletRequest;
	File fp;
	
	private OrderManagementBean orderObj = new OrderManagementBean();
	
	public String execute() {
		orderObj.process();
		
		System.out.println("Product ID: " + orderObj.getOrderID());
		System.out.println("Status Change: " + orderObj.getDeliveryStatus());
		
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
			statement = connection.createStatement();
			String sqlproduct = "SELECT * FROM orders";
			resultSet = statement.executeQuery(sqlproduct);
			while (resultSet.next()) {
				if(resultSet.getString("paymentStatus").equals("Paid") && resultSet.getString("orderStatus").equals("Incomplete")){
					if(!resultSet.getString("deliveryStatus").equals("Delivered")){
						orderObj.updateDeliveryStatusRecord();
						System.out.println("Delivery Status Updated!");
						System.out.println("~~~1st~~~");
						if(resultSet.getString("deliveryStatus").equals("In Transit")){
							orderObj.updateDeliveryStatusRecord();
							orderObj.updateOrderStatusRecord();
							System.out.println("Order Status Updated!");
							System.out.println("~~~2nd~~~");
						} else {
							System.out.println("~~~Else 1~~~");
						}
					}else {
						System.out.println("~~~Else 2~~~");
					}
				} else if(resultSet.getString("paymentStatus").equals("COD") && resultSet.getString("orderStatus").equals("Incomplete")) {
					if(!resultSet.getString("deliveryStatus").equals("Delivered")){
						orderObj.updateDeliveryStatusRecord();
						System.out.println("Delivery Status Updated!");
						System.out.println("~~~3rd~~~");
						if(resultSet.getString("deliveryStatus").equals("In Transit")) {
							orderObj.updateDeliveryStatusRecord();
							orderObj.updateOrderStatusRecord();
							System.out.println("Order Status Updated!");
							System.out.println("~~~4th~~~");
						} else {
							System.out.println("~~~Else 3~~~");
						}
					}else {
						System.out.println("~~~Else 4~~~");
					}
				} 
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return SUCCESS;
	}

	public OrderManagementBean getOrderObj() {
		return orderObj;
	}

	public void setQtyObj(OrderManagementBean orderObj) {
		this.orderObj = orderObj;
	}
	
	public File getImageFile() {
		return imageFile;
	}

	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	@Override
	public OrderManagementBean getModel() {
		return orderObj;
	}
}
