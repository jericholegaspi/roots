package roots.admin.model;

import java.util.Date;

//SHA-256 Libraries
import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import java.sql.*;
import javax.sql.*;



//Database Table Name
public class AdminBean {

	
	private int userId;
	private int userTypeId;
	
	//database inputs
	private String firstName;
	private String middleName; //nullable
	private String lastName;
	private String password;
	
	
	//Design-Facade
	public void process() {
		password = getSHA(this.password); //Hash Algorithm Method
		updateAdmin();
	}

	//Getters & Setters	
	public String getFirstName() {
		return firstName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	

	public int getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
	//Get Database Connection
	private Connection getDBConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
				"jdbc:mysql://localhost/isproj2_roots", 
				"isproj2_roots", "^qp&6Afnsd7S^jRf");
		} catch (ClassNotFoundException cfne) {
			System.err.println(cfne.getMessage());
		} catch (SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return connection;
	}
	
	
	public boolean updateAdmin() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "UPDATE users "
	                + "SET firstName = ?, middleName = ?, lastName = ?, password = ?, dateModified = ? "
	                + "WHERE userId = ? AND userTypeId = 1";
		
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.firstName);
				pstmnt.setString(2, this.middleName);
				pstmnt.setString(3, this.lastName);
				pstmnt.setString(4, this.password);
				pstmnt.setDate(5, java.sql.Date.valueOf(java.time.LocalDate.now()));
				pstmnt.setInt(6, this.userId);
				
				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on UpdateRecordAdmin: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	

	//HASH ALGORITHM Method
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
	
	
	//Email Method
	private void sendGMail(String to) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        String from = "roots.monlight@gmail.com";
        String pass = "monlightalms";
        String subject = "ROOTS Gmail Test";
        String body = "Hi, "+ this.firstName + " " + this.lastName + "!" + "\n\n\t Thank you for registering. Welcome to the ROOTS Community.";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        //Send HTML Template via Email 
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
        	
        	protected PasswordAuthentication getPasswordAuthentication() {
        		return new PasswordAuthentication(from,password);
        	}
        });
        
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));            
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
	 
	 

}



