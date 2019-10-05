package roots.admin.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.opensymphony.xwork2.ActionSupport;

public class AdminLogoutAction extends ActionSupport implements SessionAware, ServletRequestAware{

	private static final long serialVersionUID = 1L;
	 
	
	 private String returnResult = "";
	 private String userId, userPass, msg;
	 private SessionMap<String, Object> sessionMap;
	 private HttpServletRequest request;

	 
		@Override
		public void setSession(Map<String, Object> map) {
			sessionMap = (SessionMap<String, Object>) map;
		}
	 
		public void setServletRequest(HttpServletRequest request) {
			this.request = request;
		}

		public HttpServletRequest getServletRequest() {
			return this.request;
		}
	
		
	 public String execute()
	 {
		 	sessionMap.remove("email");
			sessionMap.invalidate();
			request.setAttribute("errMessage", "You have logged out successfully");

			return "success";
	 }
	
}
