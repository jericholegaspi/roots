package roots.login.action;
 
import roots.register.model.RegisterBean;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
 
public class UsersDao {
    public boolean find(String email, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        password = getSHA(password);
        //session.beginTransaction();
        String sql = " from users where email=:email and password=:pass";
        Query query = session.createQuery(sql);
        query.setParameter("email", email);
        query.setParameter("pass", password);
        List<RegisterBean> list = query.list();
        if (list.size() > 0) {
            session.close();
            return true;
        }
        session.close();
        return false;
    }
    
    
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