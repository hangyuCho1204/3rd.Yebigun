package com.dto;

public class CustomerDto {
	private String email;
	private String passwd;
	private String name;
	private String phone;
	private String post;
	private String address1;
	private String address2;
	private int mpoint;
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
		this.passwd = passwd;
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
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	@Override
	public String toString() {
		return "Customer [email=" + email + ", passwd=" + passwd + ", name="
				+ name + ", phone=" + phone + ", address1=" + address1
				+ ", address2=" + address2 + ", mpoint=" + mpoint + "]";
	}
}
