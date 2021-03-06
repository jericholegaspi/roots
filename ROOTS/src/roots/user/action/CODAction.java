package roots.user.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import model.customer.TransactionBean;

@SuppressWarnings("serial")
public class CODAction extends ActionSupport implements ModelDriven<TransactionBean> {

	//create an instance of the Registration using Has-A (composition)
	private TransactionBean transObj = new TransactionBean();
	
	public String execute() {
	
		transObj.codprocess();
		System.out.println("User ID: " + transObj.getUserID());
		System.out.println("Delivery Address ID: " + transObj.getDeliveryAddressID());
		System.out.println("Order Reference ID: " + transObj.getOrderReferenceID());
		System.out.println("VAT: " + transObj.getOrderVAT());
		System.out.println("PayPal: " + transObj.getOrderPayPalFee());
		System.out.println("Delivery Fee: " + transObj.getOrderDeliveryFee());
		System.out.println("Total Price: " + transObj.getOrderTotalPrice());

		return SUCCESS;		
	}
	

	public TransactionBean getTransObj() {
		return transObj;
	}

	public void setTransObj(TransactionBean transObj) {
		this.transObj = transObj;
	}

	@Override
	public TransactionBean getModel() {
		return transObj;
	}
}