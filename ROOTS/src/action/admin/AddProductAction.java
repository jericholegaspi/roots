package action.admin;

//File Upload Packages
import java.io.File;
import javax.servlet.http.HttpServletRequest;
/*import org.apache.commons.io.FileUtils;*/
import org.apache.struts2.interceptor.ServletRequestAware;

//Action Support * ModelDriven 
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

//JavaBean Packages
import model.admin.RootsInventoryBean;

public class AddProductAction extends ActionSupport implements ModelDriven<RootsInventoryBean>, ServletRequestAware{

	private static final long serialVersionUID = 1L;
	
	private File imageFile;
	private String imageContentType; 
	private String imageName;
	
	private HttpServletRequest servletRequest;
	File fp;
	
	private RootsInventoryBean productObj = new RootsInventoryBean();
	
	public String execute() {
		productObj.process();
		
		
		System.out.println("Product Name: " + productObj.getProdName());
		System.out.println("Category: " + productObj.getCategoryID());
		System.out.println("Price: " + productObj.getInitialPrice());
		System.out.println("Quantity: " + productObj.getProdQty());
		System.out.println("Unit: " + productObj.getUnitID());
		System.out.println("Description: " + productObj.getDescription());
		System.out.println("Image: " + productObj.getImage() + ".jpg");
		System.out.println("Availability: " + productObj.getAvailability());
		System.out.println("Image Name: " + getImageName());
		System.out.println("Critical Level: " + productObj.getCritLevel());
		/* System.out.println("Expiration Date: " + productObj.getExpDate()); */
		
		/*
		 * try { String filePath =
		 * servletRequest.getSession().getServletContext().getRealPath("/") ; File
		 * fileToCreate = new File(filePath, this.imageName);
		 * FileUtils.copyFile(this.imageFile, fileToCreate); } catch (Exception e) {
		 * e.printStackTrace(); addActionError(e.getMessage()); return INPUT; }
		 */
		
		productObj.insertProductRecord();
		return SUCCESS;
	}
	
	@Override
	public void validate() {

		System.out.println();

		if (productObj.getProdName().trim().length() == 0) {
			addFieldError("prodName", "Missing input.");
		}
		
		/*if (productObj.getCategory().trim().length() == 0) {
			addFieldError("category", "Missing input.");
		}*/

		if (productObj.getInitialPrice() <= 0) {
			addFieldError("initialPrice", "Must be positive.");
		}

		if (productObj.getProdQty() <= 0) {
			addFieldError("prodQty", "Must be positive.");
		}
		
		
	}

	public RootsInventoryBean getProductObj() {
		return productObj;
	}

	public void setProductObj(RootsInventoryBean productObj) {
		this.productObj = productObj;
	}
	
	public File getImageFile() {
		return imageFile;
	}

	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	@Override
	public RootsInventoryBean getModel() {
		return productObj;
	}
}
