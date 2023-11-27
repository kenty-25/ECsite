package jp.co.internous.ecsite.model.domain;

public class MstUser {
	
	private int id;
	
	private String userName;
	
	private String password;
	
	private String fullName;
	
	private int isAdmin;
	
	
	//id
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	//userName
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	//password
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	//fullName
	public String getFullName() {
		return fullName;
	}
	
	public void setFullName(String fullname) {
		this.fullName = fullname;
	}
	
	
	//isAdmin
	public int getIsAdmin() {
		return isAdmin;
	}
	
	public void setIsAdomin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

}
