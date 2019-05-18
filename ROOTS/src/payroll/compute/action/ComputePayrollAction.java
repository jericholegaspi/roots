package payroll.compute.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import payroll.compute.model.PayrollBean;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


@SuppressWarnings("serial")
public class ComputePayrollAction extends ActionSupport implements ModelDriven<PayrollBean> {

	//create an instance of the Payroll using Has-A (composition)
	private PayrollBean payrollObj = new PayrollBean();
	
	public String execute() {
	
		payrollObj.process();
		
		
		System.out.println("Employee Name: " + payrollObj.getName());
		System.out.println("Hours Worked: " + payrollObj.getHoursWorked());
		System.out.println("Payrate: " + payrollObj.getPayRate());
		System.out.println("Basic pay: Php" + payrollObj.getBasicPay());
		System.out.println("Overtime Pay: Php" + payrollObj.getOvertimePay());
		System.out.println("Gross Pay: Php" + payrollObj.getGrossPay());
		System.out.println("Tax: Php" + payrollObj.getTax());
		System.out.println("Net Pay: Php" + payrollObj.getNetPay());
		
		SessionFactory sessionFactory = 
				new Configuration().configure().buildSessionFactory();
				
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(payrollObj);
			session.getTransaction().commit();
		
		return SUCCESS;		
	}
	
	@Override
	public void validate() {	
		
		System.out.println();
		
		if (payrollObj.getName().trim().length() == 0) {
			addFieldError("name", "Missing input.");
		}
			
		if (payrollObj.getHoursWorked() <= 0) {
			addFieldError("hoursWorked", "Must be positive.");
		}
		
		if (payrollObj.getPayRate() <= 0) {
			addFieldError("payRate", "Must be positive.");
		}	
    }

	public PayrollBean getPayrollObj() {
		return payrollObj;
	}

	public void setPayrollObj(PayrollBean payrollObj) {
		this.payrollObj = payrollObj;
	}

	@Override
	public PayrollBean getModel() {
		return payrollObj;
	}
}
