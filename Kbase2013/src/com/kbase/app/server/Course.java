package com.kbase.app.server;


import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;


import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@SuppressWarnings("serial")
@PersistenceCapable
public class Course implements Serializable 
{
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private Long dept_id;
	
	@Persistent 
	private Long uty_id;
	
	@Persistent 
	private String course_name;
	
	public Course(String course_name,Long dept_id,Long admin_id)
	{
			this.course_name = course_name;
			this.uty_id = admin_id;
			this.dept_id = dept_id;
	}
	public Long getUty()
	{
		return this.uty_id;
	}
	public Long getDept()
	{
		return this.dept_id;
	}
	public String getName()
	{
		return this.course_name;
	}
	public Long getId()
	{
		return this.id;
	}
}