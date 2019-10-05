package roots.register.model;

import javax.persistence.*;
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
public class RegisterBean {

	
	private int userId;
	private int userTypeId;
	
	//database inputs
	private String firstName;
	private String middleName; //nullable
	private String lastName;
	private String gender;
	private String password;
	private double mobileNo;
	private double telephone;
	private String email;	
	
	//dates
	private java.sql.Date dateOfBirth;	
	
	//address
	private String houseNumber; //nullable
	private String street; //nullable
	private String city; //nullable
	private String province; //nullable
	private String postalCode;//nullable
	
	
	//Email Activation
	

	
	//Design-Facade
	public void process() {
		password = getSHA(this.password); //Hash Algorithm Method
		sendGMail(this.email); //Email Method
		userTypeId = 2; //set user type as Customer
		insertUser();
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
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(double mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(java.sql.Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public double getTelephone() {
		return telephone;
	}

	public void setTelephone(double telephone) {
		this.telephone = telephone;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	
	
	//Get Database Connection
	private Connection getDBConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/rootsdb", 
				"root", "");
		} catch (ClassNotFoundException cfne) {
			System.err.println(cfne.getMessage());
		} catch (SQLException sqle) {
			System.err.println(sqle.getMessage());
		}
		return connection;
	}
	
	
	public boolean insertUser() {		
		Connection connection = getDBConnection();
		
		if (connection != null) { //means a valid connection
			String sql = "INSERT INTO users (firstName, middleName, lastName, gender, "
					+ "password, mobileNo, telephone, email, "
					+ "dateOfBirth, dateAdded, dateModified) "
					+ "userTypeId "
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			
			try {
				PreparedStatement pstmnt = connection.prepareStatement(sql);
				
				pstmnt.setString(1, this.firstName);
				pstmnt.setString(2, this.middleName);
				pstmnt.setString(3, this.lastName);
				pstmnt.setString(4, this.gender);
				pstmnt.setString(5, this.password);
				pstmnt.setDouble(6, this.mobileNo);
				pstmnt.setDouble(7, this.telephone);
				pstmnt.setString(8, this.email);
				pstmnt.setDate(9, this.dateOfBirth);
				pstmnt.setDate(10, java.sql.Date.valueOf(java.time.LocalDate.now()));
				pstmnt.setDate(11, java.sql.Date.valueOf(java.time.LocalDate.now()));
				pstmnt.setInt(12, this.userTypeId);
				

				pstmnt.executeUpdate();
				return true;
			
			} catch (SQLException sqle) {
				System.err.println("Error on insertRecordOrder: " + sqle.getMessage());
			}			
		} else {
			System.err.println("Missing on invalid connection.");
		}
		return false;
	}
	
	
	
	
	
	
	
	//Check if email already exists 
//	public boolean exists(String email) throws SQLException {
//		
//		String driverName = "com.mysql.jdbc.Driver";
//		String connectionUrl = "jdbc:mysql://localhost:3306/";
//		String dbName = "rootsdb";
//		String userId = "root";
//		String password = "";
//
//		try {
//				Class.forName(driverName);
//			} catch (ClassNotFoundException e) {
//				e.printStackTrace();
//			}
//
//		Connection connection = null;
//		connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
//		Statement statement = null;
//		statement = connection.createStatement();
//		ResultSet resultSet = null;
//	    // ... Declare, etc.
//		
//	    statement = connection.prepareStatement("SELECT id FROM user WHERE email = ?");
//	    statement.setString(1, email);
//	    resultSet = statement.executeQuery();
//	    return resultSet.next();
//		
//	    // ... Close, etc (in finally!)
//	}

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



