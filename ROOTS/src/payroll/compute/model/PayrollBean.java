package payroll.compute.model;

import javax.persistence.*;

@Entity (name="PayrollRecords")
public class PayrollBean {

	@Id
	@GeneratedValue
	private int id;
	
	private String name;
	private double hoursWorked;
	private double payRate;
	
	//computed values
	private double basicPay;
	private double overtimePay;
	private double grossPay;
	private double tax;
	private double netPay;
	
	public void process() {
		computeBasicPay();
		computeOverTimePay();
		computeGrossPay();
		computeTax();
		computeNetPay();
	}
	
	public void computeBasicPay() {
		basicPay = (hoursWorked > 40)
			? 40 * payRate
			: hoursWorked * payRate;		
	}
	
	public void computeOverTimePay() {
		overtimePay = (hoursWorked > 40)
			? (hoursWorked - 40) * payRate * 1.5
			: 0;
	}
	
	public void computeGrossPay() {
		grossPay = basicPay + overtimePay;
	}
	
	public void computeTax() {
		tax = grossPay * 0.1;
	}
	
	public void computeNetPay() {
		netPay = grossPay - tax;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getHoursWorked() {
		return hoursWorked;
	}

	public void setHoursWorked(double hoursWorked) {
		this.hoursWorked = hoursWorked;
	}

	public double getPayRate() {
		return payRate;
	}

	public void setPayRate(double payRate) {
		this.payRate = payRate;
	}

	public double getBasicPay() {
		return basicPay;
	}

	public void setBasicPay(double basicPay) {
		this.basicPay = basicPay;
	}

	public double getOvertimePay() {
		return overtimePay;
	}

	public void setOvertimePay(double overtimePay) {
		this.overtimePay = overtimePay;
	}

	public double getGrossPay() {
		return grossPay;
	}

	public void setGrossPay(double grossPay) {
		this.grossPay = grossPay;
	}

	public double getTax() {
		return tax;
	}

	public void setTax(double tax) {
		this.tax = tax;
	}

	public double getNetPay() {
		return netPay;
	}

	public void setNetPay(double netPay) {
		this.netPay = netPay;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
