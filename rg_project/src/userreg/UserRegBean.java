package userreg;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserRegBean implements Serializable {
	private int custid,purchased,deptid,desid;
	private String deptname,desig;
	private String username;
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getDesig() {
		return desig;
	}
	public void setDesig(String desig) {
		this.desig = desig;
	}
	private String password;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String city;
	private String country;
	private String gender;
	private Timestamp lastlogin;
	public int getCustid() {
		return custid;
	}
	public void setCustid(int custid) {
		this.custid = custid;
	}
	public int getPurchased() {
		return purchased;
	}
	public void setPurchased(int purchased) {
		this.purchased = purchased;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(Timestamp lastlogin) {
		this.lastlogin = lastlogin;
	}
	public int getDeptid() {
		return deptid;
	}
	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}
	public int getDesid() {
		return desid;
	}
	public void setDesid(int desid) {
		this.desid = desid;
	}
	
	
}
