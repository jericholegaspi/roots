package action.customer;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.customer.AddOrderBean;

public class SelectItemIDAction extends ActionSupport implements ModelDriven<AddOrderBean>{
	
	private static final long serialVersionUID = 1L;
	
	private AddOrderBean orderObj = new AddOrderBean();
	
	public String execute() {		
		System.out.println("Product ID: " + orderObj.getProdID());
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