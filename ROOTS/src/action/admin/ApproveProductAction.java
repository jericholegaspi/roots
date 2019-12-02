package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.admin.RootsInventoryBean;

public class ApproveProductAction extends ActionSupport implements ModelDriven<RootsInventoryBean>{
	
	private static final long serialVersionUID = 1L;
	
	private RootsInventoryBean prodObj = new RootsInventoryBean();
	
	public String execute() {
		System.out.println("ProductID: " + prodObj.getProdID());
		prodObj.approveNewProductRecord();
		return SUCCESS;
	}

	public RootsInventoryBean getProdObj() {
		return prodObj;
	}

	public void setProdObj(RootsInventoryBean prodObj) {
		this.prodObj = prodObj;
	}

	@Override
	public RootsInventoryBean getModel() {
		return prodObj;
	}

}
