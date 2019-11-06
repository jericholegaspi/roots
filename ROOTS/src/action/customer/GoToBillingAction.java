package action.customer;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.customer.AddOrderBean;

public class GoToBillingAction extends ActionSupport implements ModelDriven<AddOrderBean>{
	
	private static final long serialVersionUID = 1L;
	
	private AddOrderBean orderObj = new AddOrderBean();
	
	public String execute() {
		orderObj.process();
		System.out.println("Order ID: " + orderObj.getOrderID());
		System.out.println("User ID: " + orderObj.getUserID());
		System.out.println("Total Cart Items: " + orderObj.getCartItemTotalCount());
		System.out.println("Total Cart Price: " + orderObj.getOrderTotalPrice());
		orderObj.proceedToBilling();
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
