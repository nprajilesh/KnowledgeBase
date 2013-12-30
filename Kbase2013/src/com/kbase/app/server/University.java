package com.kbase.app.server;


import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@SuppressWarnings("serial")
@PersistenceCapable
public class University implements Serializable 
{
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private String uty_name;
	
	@Persistent 
	private String admin_email;
	
	@Persistent
	private String uty_addr;
	
	@Persistent
	private String pass;
	
	@Persistent
	private String uty_phone;
	
	public University(String uty_name,String admin_email,String uty_addr,String pass,String phone)
	{
			this.admin_email = admin_email;
			this.pass = pass;
			this.uty_phone = phone;
			this.uty_addr = uty_addr;
			this.uty_name = uty_name;
	}
	//Retrieve data 
	public String getEmail()
	{
		return this.admin_email;
	}
	public String getPhone()
	{
		return this.uty_phone;
	}
	public String getAddr()
	{
		return this.uty_addr;
	}
	public String getPass()
	{
		return this.pass;
	}
	public String getUty_name()
	{
		return this.uty_name;
	}
	//Update data
	public void setPhone(String uty_phone)
	{
		this.uty_phone = uty_phone;
	}
	public void setAddr(String uty_addr)
	{
		this.uty_addr = uty_addr;
	}
	public void setPass(String pass)
	{
		this.pass= pass;
	}
	
	// Get key
	public Long getId()
	{
		return this.id;
	}
}