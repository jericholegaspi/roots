package action.customer;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.customer.AddOrderBean;

public class AddToCartAction extends ActionSupport implements ModelDriven<AddOrderBean>{
	
	private static final long serialVersionUID = 1L;
	
	private AddOrderBean orderObj = new AddOrderBean();
	
	public String execute() {
		orderObj.process();
		
		System.out.println("User ID: " + orderObj.getUserID());
		System.out.println("Product ID: " + orderObj.getProdID());
		System.out.println("Category: " + orderObj.getCatID());
		System.out.println("Payment Status:" + orderObj.getPaymentStatusID());
		System.out.println("Delivery Status: " + orderObj.getDeliveryStatusID());
		System.out.println("Order Status: " + orderObj.getOrderStatusID());
		System.out.println("Order Quantity: " + orderObj.getOrderQuantity());
		System.out.println("Order Price: " + orderObj.getOrderPrice());
		
		orderObj.insertRecordOrder();
		
		return SUCCESS;
	}

	@Override
	public AddOrderBean getModel() {
		return null;
	}

}
