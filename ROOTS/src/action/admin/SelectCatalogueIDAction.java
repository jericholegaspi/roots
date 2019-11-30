package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.admin.CatalogueManagementBean;

public class SelectCatalogueIDAction extends ActionSupport implements ModelDriven<CatalogueManagementBean>{
	
	private static final long serialVersionUID = 1L;
	
	private CatalogueManagementBean catalogueObj = new CatalogueManagementBean();
	
	public String execute(){
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("Catalogue ID: " + catalogueObj.getCatalogueID());
		System.out.println("///SELECTED///");
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		return SUCCESS;
	}

	public CatalogueManagementBean getCatalogueObj() {
		return catalogueObj;
	}

	public void setCatalogueObj(CatalogueManagementBean catalogueObj) {
		this.catalogueObj = catalogueObj;
	}

	@Override
	public CatalogueManagementBean getModel() {
		return catalogueObj;
	}
}
