package action.customer;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.customer.AddOrderBean;

public class SelectItemIDAction extends ActionSupport implements ModelDriven<AddOrderBean>{
	
	private static final long serialVersionUID = 1L;
	
	private AddOrderBean orderObj = new AddOrderBean();
	
	public String execute() {		
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("Product ID: " + orderObj.getProdID());
		System.out.println("///SELECTED///");
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		return SUCCESS;
	}

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
