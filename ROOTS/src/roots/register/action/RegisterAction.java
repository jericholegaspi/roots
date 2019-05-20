package roots.register.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import roots.register.model.RegisterBean;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport implements ModelDriven<RegisterBean> {

	//create an instance of the Payroll using Has-A (composition)
	private RegisterBean registerObj = new RegisterBean();
	
	public String execute() {
	
		registerObj.process();
		
		
		System.out.println("First Name: " + registerObj.getFirstName());
		System.out.println("Last Name: " + registerObj.getLastName());
		System.out.println("Password: " + registerObj.getPassword());
		System.out.println("Mobile No.:" + registerObj.getMobileNo());
		System.out.println("E-mail Address:" + registerObj.getEmail());
		System.out.println("Date of Birth: Php" + registerObj.getDateOfBirth());

		
		SessionFactory sessionFactory = 
				new Configuration().configure().buildSessionFactory();
				
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(registerObj);
			session.getTransaction().commit();
		
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
