package roots.login.action;


import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import roots.login.dao.LoginDao;
import roots.register.model.RegisterBean;

public class LoginAction extends ActionSupport implements SessionAware, ServletRequestAware{
	 private static final long serialVersionUID = 1L;
	 //PAKYU PHIL
	 private String email,password,msg;
	 private int userId;
	 private String returnResult = "";
	 private HttpServletRequest request;
	 private SessionMap<String, Object> sessionMap;

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
		 HttpSession session = ServletActionContext.getRequest().getSession(true);
		 RegisterBean loginBean = new RegisterBean();
		 loginBean.setEmail(email);
		 loginBean.setPassword(password);
		 LoginDao loginDao = new LoginDao();
		 
		 try {
			 String userValidate = loginDao.authenticateUser(loginBean);
			 userId = loginDao.retrieveUserId(loginBean);
			 if(userValidate.equals("login"))
			 {			 
			 System.out.println("User's Home");
			 sessionMap.put("email", email);		 
			 sessionMap.put("uid", userId);
			 returnResult = "success"; 
			 }
			 else
			 {
			 System.out.println("Error message = "+userValidate);
			 request.setAttribute("errMessage", userValidate);			 
			 returnResult = "error"; 
			 }
		 }

		 catch (Exception e2) {
				 e2.printStackTrace();
		 }
		 return returnResult;
		 
	 }

	 
	 //GETTERS AND SETTERS OF UID AND PWD
		public String getPassword() {
			return password;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public void setPassword(String password) {
			this.password = password;
		}


		
	 
	}