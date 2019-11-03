package roots.user.action; 

//import the Action interface here
import com.opensymphony.xwork2.ActionSupport;

import com.opensymphony.xwork2.ModelDriven;

import roots.address.model.AddressBean;

@SuppressWarnings("serial")
public class AddWorkAddressAction extends ActionSupport implements ModelDriven<AddressBean> {


	//create an instance of the Registration using Has-A (composition)
	private AddressBean addressObj = new AddressBean();
	
	public String execute() {
	
		addressObj.insertWork();
		
		//TO DISPLAY DATA IN CONSOLE
		System.out.println("House Number: " + addressObj.getHouseNumber());
		System.out.println("Street: " + addressObj.getStreet());
		System.out.println("Barangay: " + addressObj.getBarangay());
		System.out.println("City: " + addressObj.getCity());
		System.out.println("Province: " + addressObj.getProvince());
		System.out.println("Postal Code: " + addressObj.getPostalCode());

	
		return SUCCESS;		
	}
	

	public AddressBean getAddressObj() {
		return addressObj;
	}

	public void setAddressObj(AddressBean addressObj) {
		this.addressObj = addressObj;
	}

	@Override
	public AddressBean getModel() {
		return addressObj;
	}
}