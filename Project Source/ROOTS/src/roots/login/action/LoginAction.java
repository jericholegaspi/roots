package roots.login.action;
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import com.opensymphony.xwork2.ActionSupport;

import roots.register.model.RegisterBean;

public class LoginAction extends ActionSupport {
	 private static final long serialVersionUID = 1L;
	 
	 private int userId;
	 private String email,password;
	 Session session =null;
	 String returnResult = "";
	 
	 public String execute()
	 {
	 RegisterBean loginUser = null;
	 try {
	 StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder()
	 .configure( "hibernate.cfg.xml" )
	 .build();
	 
	 Metadata metadata = new MetadataSources( standardRegistry )
	 .addAnnotatedClass( RegisterBean.class )
	 .addResource( "roots/login/action/Mapping.hbm.xml" )
	 .getMetadataBuilder()
	 .applyImplicitNamingStrategy(ImplicitNamingStrategyJpaCompliantImpl.INSTANCE )
	 .build();
	 
	 SessionFactory sessionFactory = metadata.getSessionFactoryBuilder().build();
	 session = sessionFactory.openSession();
	 if(session.isConnected())
	 {
	 System.out.println("Connection success");
	 }
	 else 
	 {
	 System.out.println("Connection failed");
	 }
	 
	 try
	 {
	 //Get data from mysql database
	 loginUser = (RegisterBean)session.get(RegisterBean.class,userId);
	 if(!loginUser.equals(null))
	 {
	 if(password.equals(loginUser.getPassword()))
	 {
	 returnResult = "success"; 
	 }
	 }
	 else
	 {
	 returnResult = "error"; 
	 }
	 }
	 catch(Exception exception)
	 {
	 returnResult = "error"; 
	 exception.printStackTrace(); 
	 }
	 
	 
	 }
	 catch (Exception e)
	 {
	 e.printStackTrace();
	 }
	 
	 return returnResult;
	 }

	
	 
	 //GETTERS AND SETTERS OF UID AND PWD
	 
		public String getPassword() {
			return password;
		}
	
		

		public int getUserId() {
			return userId;
		}



		public void setUserId(int userId) {
			this.userId = userId;
		}



		public void setPassword(String password) {
			this.password = password;
		}
	 
	}