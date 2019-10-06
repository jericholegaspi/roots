package roots.register.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import roots.register.model.RegisterBean;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport implements ModelDriven<RegisterBean> {


	//create an instance of the Registration using Has-A (composition)
	private RegisterBean registerObj = new RegisterBean();
	
	public String execute() {
	
		registerObj.process();
		
		//TO DISPLAY DATA IN CONSOLE
		System.out.println("First Name: " + registerObj.getFirstName());
		System.out.println("Middle Name: " + registerObj.getMiddleName());
		System.out.println("Last Name: " + registerObj.getLastName());
		System.out.println("Gender: " + registerObj.getGender());
		System.out.println("Password: " + registerObj.getPassword());
		System.out.println("Mobile No.:" + registerObj.getMobileNo());
		System.out.println("E-mail Address:" + registerObj.getEmail());
		System.out.println("Date of Birth: " + registerObj.getDateOfBirth());
	
		return SUCCESS;		
	}
	

	public RegisterBean getRegisterObj() {
		return registerObj;
	}

	public void setRegisterObj(RegisterBean registerObj) {
		this.registerObj = registerObj;
	}

	@Override
	public RegisterBean getModel() {
		return registerObj;
	}
}
