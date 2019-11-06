package roots.user.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import roots.register.model.RegisterBean;

@SuppressWarnings("serial")
public class UpdateUserAction extends ActionSupport implements ModelDriven<RegisterBean> {


	//create an instance of the Registration using Has-A (composition)
	private RegisterBean userObj = new RegisterBean();
	
	public String execute() {
	
		userObj.updateUser();
		
		//TO DISPLAY DATA IN CONSOLE
		System.out.println("First Name: " + userObj.getFirstName());
		System.out.println("Middle Name: " + userObj.getMiddleName());
		System.out.println("Last Name: " + userObj.getLastName());
		System.out.println("Gender: " + userObj.getGender());
		System.out.println("Mobile No.:" + userObj.getMobileNo());
		System.out.println("User ID:" + userObj.getUserId());


	
		return SUCCESS;		
	}
	

	public RegisterBean getUserObj() {
		return userObj;
	}

	public void setUserObj(RegisterBean userObj) {
		this.userObj = userObj;
	}

	@Override
	public RegisterBean getModel() {
		return userObj;
	}
}
