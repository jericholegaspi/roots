package roots.login.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;


 
import roots.register.model.RegisterBean;
 
public class LoginDao {
	
	//DATABASE VARIABLES
	 Connection con = null;
	 Statement statement = null;
	 ResultSet resultSet = null;
	 
	 String emailDB = "";
	 String passwordDB = "";

public static Connection getDBConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
				"jdbc:mysql://localhost/isproj2_roots", 
				"isproj2_roots", "^qp&6Afnsd7S^jRf");
		} catch (ClassNotFoundException cfne) {
			System.err.println(cfne.getMessage());
		} catch (SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return con;
}
	
//Authenticate User (Customer)
public String authenticateUser(RegisterBean loginBean)
{
	 String email = loginBean.getEmail();
	 String password = loginBean.getPassword();
	 password = getSHA(password);
	 
	 
	 //Select From DB Users
	 try
	 {
	 con = getDBConnection();
	 statement = con.createStatement();
	 resultSet = statement.executeQuery("select email,password from users");
	 
	 while(resultSet.next())
	 {
	 emailDB = resultSet.getString("email");
	 passwordDB = resultSet.getString("password");
	 
	 if(email.equals(emailDB) && password.equals(passwordDB))
	 return "login";
	 }
	 }
	 catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	 return "Invalid user credentials";
}


//Authenticate User (Admin)
public String authenticateAdmin(RegisterBean loginBean)
{
	 String email = loginBean.getEmail();
	 String password = loginBean.getPassword();
	 password = getSHA(password);
	 	 
	 //Select From DB Users
	 try
	 {
	 con = getDBConnection();
	 statement = con.createStatement();
	 resultSet = statement.executeQuery("select email,password from users WHERE userTypeId = 1 ");
	 
	 while(resultSet.next())
	 {
	 emailDB = resultSet.getString("email");
	 passwordDB = resultSet.getString("password");
	 if(email.equals(emailDB) && password.equals(passwordDB))
	 return "login";
	 }
	 }
	 catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	 return "Invalid user credentials";
}


//Retrieve User ID
public int retrieveUserId(RegisterBean loginBean)
{
	 String email = loginBean.getEmail();
	 String password = loginBean.getPassword();
	 int userId = 0;
	 password = getSHA(password);
	 
	 //Connection con = null;
	 	 
	  try
	 {
	 con = getDBConnection();
	 String sql = "SELECT userId from users WHERE  email = ? AND password = ?";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, email);
	 ps.setString(2, password);
	 ResultSet rs = ps.executeQuery();
	 
	 while(rs.next())
	 {
	 userId = rs.getInt("userId");
	 }
	 
	 }
	 catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	  return userId;

}

//Hash Function
public static String getSHA(String input) { 
	  
    try { 

        // Static getInstance method is called with hashing SHA 
        MessageDigest md = MessageDigest.getInstance("SHA-256"); 

        // digest() method called 
        // to calculate message digest of an input 
        // and return array of byte 
        byte[] messageDigest = md.digest(input.getBytes()); 

        // Convert byte array into signum representation 
        BigInteger no = new BigInteger(1, messageDigest); 

        // Convert message digest into hex value 
        String hashtext = no.toString(16); 

        while (hashtext.length() < 32) { 
            hashtext = "0" + hashtext; 
        } 

        return hashtext; 
    } 

    // For specifying wrong message digest algorithms 
    catch (NoSuchAlgorithmException e) { 
        System.out.println("Exception thrown"
                           + " for incorrect algorithm: " + e); 

        return null; 
    } 
}

}