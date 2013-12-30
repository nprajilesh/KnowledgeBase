package com.kbase.app.server;


import javax.jdo.annotations.IdGeneratorStrategy;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;



@PersistenceCapable
public class Student
{

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private String student_name;
	
	@Persistent 
	private String student_email;
	
	@Persistent
	private Long student_uty;
	
	@Persistent
	private Long student_dept;
	
	@Persistent
	private String student_addr;
	
	//@Persistent
	//private String student_pass;
	
	@Persistent
	private String student_phone;
	
	@Persistent
	private String admn_no;
	
	public Student(String student_name,String student_email,String admn_no,String student_addr,String student_phone,Long student_uty,Long student_dept)
	{
			this.student_name = student_name;
			this.student_email = student_email;
			this.student_uty = student_uty;
			this.student_addr = student_addr;
			this.student_phone = student_phone;
			this.student_dept = student_dept;
			this.admn_no = admn_no;
	}

	public String getname()
	{
		return this.student_name;
	}
	
	public Long getId()
	{
		return this.id;
	}
	public String getemail()
	{
		return this.student_email;
	}

	public String getAdmn()
	{
		return this.admn_no;
	}
	public void setDept(Long dept)
	{
		this.student_dept = dept;
		
	}
	public String getaddr()
	{
		return this.student_addr;
	}

	public Long getDept()
	{
		return this.student_dept;
	}
	public String getphone()
	{
		return this.student_phone;
	}
	public Long getuty()
	{
		return this.student_uty;
	}
	public String getKey()
	{
		return this.getKey();
	}
}



