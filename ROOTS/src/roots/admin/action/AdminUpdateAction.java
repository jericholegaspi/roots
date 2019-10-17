package roots.admin.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import roots.admin.model.AdminBean;

@SuppressWarnings("serial")
public class AdminUpdateAction extends ActionSupport implements ModelDriven<AdminBean> {


	//create an instance of the Registration using Has-A (composition)
	private AdminBean adminObj = new AdminBean();
	
	public String execute() {
	
		adminObj.process();
		
		//TO DISPLAY DATA IN CONSOLE
		System.out.println("First Name: " + adminObj.getFirstName());
		System.out.println("Middle Name: " + adminObj.getMiddleName());
		System.out.println("Last Name: " + adminObj.getLastName());
		System.out.println("Password: " + adminObj.getPassword());
	
		return SUCCESS;		
	}
	

	public AdminBean getRegisterObj() {
		return adminObj;
	}

	public void setRegisterObj(AdminBean adminObj) {
		this.adminObj = adminObj;
	}

	@Override
	public AdminBean getModel() {
		return adminObj;
	}
}
