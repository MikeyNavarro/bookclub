package com.mnav.bookclub.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
	
	@NotEmpty(message = "please enter your email")
	@Email(message = "please enter a valid email")
	private String email;
	
	@NotEmpty(message = "please enter your password")
	@Size(min = 2 , max =255, message = "please enter a valid password")
	private String password;
	
	public LoginUser() {}
	
	public LoginUser(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	}
	