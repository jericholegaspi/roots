package roots.user.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import roots.register.model.RegisterBean;

@SuppressWarnings("serial")
public class UpdatePasswordAction extends ActionSupport implements ModelDriven<RegisterBean> {


	//create an instance of the Registration using Has-A (composition)
	private RegisterBean passwordObj = new RegisterBean();
	
	public String execute() {
	
		passwordObj.updatePassword();
		
		//TO DISPLAY DATA IN CONSOLE
		System.out.println("Password: " + passwordObj.getPassword());
		return SUCCESS;		
	}
	

	public RegisterBean getPasswordObj() {
		return passwordObj;
	}

	public void setPasswordObj(RegisterBean passwordObj) {
		this.passwordObj = passwordObj;
	}

	@Override
	public RegisterBean getModel() {
		return passwordObj;
	}
}
