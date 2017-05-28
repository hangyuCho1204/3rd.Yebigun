package com.dto;



public class CustomerLoginDto {
	private String email;
	private String passwd;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
       // Encryption encryption = new Encryption();
		
		//encryption.encryption(passwd);
		this.passwd = passwd;
	}
	
}
