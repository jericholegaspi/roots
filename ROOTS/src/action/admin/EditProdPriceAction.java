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

public class EditProdPriceAction extends ActionSupport implements ModelDriven<RootsInventoryBean>, ServletRequestAware{

	private static final long serialVersionUID = 1L;
	
	private File imageFile;
	private String imageContentType; 
	private String imageName;
	
	private HttpServletRequest servletRequest;
	File fp;
	
	private RootsInventoryBean qtyObj = new RootsInventoryBean();
	
	public String execute() {
		qtyObj.process();
		
		
		System.out.println("Product ID: " + qtyObj.getProdID());
		System.out.println("Price Change: " + qtyObj.getPriceChange());
		
		qtyObj.updatePrice();
		return SUCCESS;
	}

	public RootsInventoryBean getQtyObj() {
		return qtyObj;
	}

	public void setQtyObj(RootsInventoryBean qtyObj) {
		this.qtyObj = qtyObj;
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
		return qtyObj;
	}
}
