package model.customer;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.*;
import javax.sql.DataSource;

public class CatalogueBean {

	private String nameF;
	private String nameE;
	private String scientificName;
	private String recommendedF;
	private String recommendedE;
	private String benefitF;
	private String benefitE;
	private String traditionalF;
	private String traditionalE;
	private String popularUseF;
	private String popularE;
	private String cautionF;
	private String cautionE;
	private String foodUseF;
	private String foodUseE;
	private String otherInfoF;
	private String otherInfoE;
	private String location;
	private String addedInfoF;
	private String addedInfoE;
	private String source;
	
	public String getNameF() {
		return nameF;
	}
	public void setNameF(String nameF) {
		this.nameF = nameF;
	}
	public String getNameE() {
		return nameE;
	}
	public void setNameE(String nameE) {
		this.nameE = nameE;
	}
	public String getScientificName() {
		return scientificName;
	}
	public void setScientificName(String scientificName) {
		this.scientificName = scientificName;
	}
	public String getRecommendedF() {
		return recommendedF;
	}
	public void setRecommendedF(String recommendedF) {
		this.recommendedF = recommendedF;
	}
	public String getRecommendedE() {
		return recommendedE;
	}
	public void setRecommendedE(String recommendedE) {
		this.recommendedE = recommendedE;
	}
	public String getBenefitF() {
		return benefitF;
	}
	public void setBenefitF(String benefitF) {
		this.benefitF = benefitF;
	}
	public String getBenefitE() {
		return benefitE;
	}
	public void setBenefitE(String benefitE) {
		this.benefitE = benefitE;
	}
	public String getTraditionalF() {
		return traditionalF;
	}
	public void setTraditionalF(String traditionalF) {
		this.traditionalF = traditionalF;
	}
	public String getTraditionalE() {
		return traditionalE;
	}
	public void setTraditionalE(String traditionalE) {
		this.traditionalE = traditionalE;
	}
	public String getPopularUseF() {
		return popularUseF;
	}
	public void setPopularUseF(String popularUseF) {
		this.popularUseF = popularUseF;
	}
	public String getPopularE() {
		return popularE;
	}
	public void setPopularE(String popularE) {
		this.popularE = popularE;
	}
	public String getCautionF() {
		return cautionF;
	}
	public void setCautionF(String cautionF) {
		this.cautionF = cautionF;
	}
	public String getCautionE() {
		return cautionE;
	}
	public void setCautionE(String cautionE) {
		this.cautionE = cautionE;
	}
	public String getFoodUseF() {
		return foodUseF;
	}
	public void setFoodUseF(String foodUseF) {
		this.foodUseF = foodUseF;
	}
	public String getFoodUseE() {
		return foodUseE;
	}
	public void setFoodUseE(String foodUseE) {
		this.foodUseE = foodUseE;
	}
	public String getOtherInfoF() {
		return otherInfoF;
	}
	public void setOtherInfoF(String otherInfoF) {
		this.otherInfoF = otherInfoF;
	}
	public String getOtherInfoE() {
		return otherInfoE;
	}
	public void setOtherInfoE(String otherInfoE) {
		this.otherInfoE = otherInfoE;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAddedInfoF() {
		return addedInfoF;
	}
	public void setAddedInfoF(String addedInfoF) {
		this.addedInfoF = addedInfoF;
	}
	public String getAddedInfoE() {
		return addedInfoE;
	}
	public void setAddedInfoE(String addedInfoE) {
		this.addedInfoE = addedInfoE;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}	
	
	private Connection getDBConnection() {
		Connection connection = null;
		
		try {
			/*Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/ProgAp3-TI001");
			connection = ds.getConnection();*/
			
			connection = ((DataSource) InitialContext.doLookup("java:/comp/env/jdbc/ProgAp3-TI001")).getConnection();

		} catch (NamingException ne) {
			System.err.println("Error on getDBConnection: " + ne.getMessage());
		} catch (SQLException sqle) {
			System.err.println("Error on getDBConnection: " + sqle.getMessage());
		}
		return connection;
	}
	
}
