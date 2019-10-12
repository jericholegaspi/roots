package action.customer;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.admin.RootsInventoryBean;

public class ViewProductsAction extends ActionSupport implements ModelDriven<RootsInventoryBean>{

	private static final long serialVersionUID = 1L;
	
	private RootsInventoryBean productObj = new RootsInventoryBean();
	
	public String execute() {
		productObj.process();
		return SUCCESS;
	}

	@Override
	public RootsInventoryBean getModel() {
		return null;
	}
}
