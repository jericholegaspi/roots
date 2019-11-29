package roots.admin.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import roots.register.model.RegisterBean;


@SuppressWarnings("serial")
public class AdminInsertUserAction extends ActionSupport implements ModelDriven<RegisterBean> {


	//create an instance of the Registration using Has-A (composition)
	private RegisterBean adminObj = new RegisterBean();
	
	public String execute() {
	
		adminObj.insertUserAdmin();
		
		//TO DISPLAY DATA IN CONSOLE
		System.out.println("First Name: " + adminObj.getFirstName());
		System.out.println("Middle Name: " + adminObj.getMiddleName());
		System.out.println("Last Name: " + adminObj.getLastName());
		System.out.println("Gender: " + adminObj.getGender());
		System.out.println("Password: " + adminObj.getPassword());
		System.out.println("Mobile No.:" + adminObj.getMobileNo());
		System.out.println("E-mail Address:" + adminObj.getEmail());
		System.out.println("Date of Birth: " + adminObj.getDateOfBirth());
	
		return SUCCESS;		
	}
	

	public RegisterBean getRegisterObj() {
		return adminObj;
	}

	public void setRegisterObj(RegisterBean adminObj) {
		this.adminObj = adminObj;
	}

	@Override
	public RegisterBean getModel() {
		return adminObj;
	}
}
