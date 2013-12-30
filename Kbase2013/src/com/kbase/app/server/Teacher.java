package com.kbase.app.server;


import javax.jdo.annotations.IdGeneratorStrategy;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;



@PersistenceCapable
public class Teacher
{

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private String teacher_name;
	
	@Persistent 
	private String teacher_email;
	
	@Persistent
	private Long teacher_uty;
	
	@Persistent
	private Long teacher_dept;
	
	@Persistent
	private String teacher_addr;
	
	//@Persistent
	//private String student_pass;
	
	@Persistent
	private String teacher_phone;
	
	
	public Teacher(String teacher_name,String teacher_email,String teacher_addr,String teacher_phone,Long teacher_uty,Long teacher_dept)
	{
			this.teacher_name = teacher_name;
			this.teacher_email = teacher_email;
			this.teacher_uty = teacher_uty;
			this.teacher_addr = teacher_addr;
			//this.teacher_pass = teacher_pass;
			this.teacher_phone = teacher_phone;
			this.teacher_dept = teacher_dept;
	}

	public String getname()
	{
		return this.teacher_name;
	}
	
	public Long getId()
	{
		return this.id;
	}
	public String getemail()
	{
		return this.teacher_email;
	}
	public void setDept(Long dept)
	{
		this.teacher_dept = dept;
		
	}
	public String getaddr()
	{
		return this.teacher_addr;
	}

	public Long getDept()
	{
		return this.teacher_dept;
	}
	public String getphone()
	{
		return this.teacher_phone;
	}
	public Long getuty()
	{
		return this.teacher_uty;
	}
	public String getKey()
	{
		return this.getKey();
	}
}



