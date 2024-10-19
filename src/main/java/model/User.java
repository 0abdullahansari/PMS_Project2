package model;

public class User {
	String name;
	String email;
    String mobile;
    int userId;
    String password;
    String address;
    String role;

    public User(String a,String b,String c, String d, int e,String f,String g){
   	 
   	 this.name = a;
   	 this.email = b;
   	 this.mobile = c;
   	 this.address = d;
   	 this.userId = e;
   	 this.password = f;
   	 this.role = g;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
    
}