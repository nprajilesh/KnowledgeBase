package com.kbase.app.server;


import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@SuppressWarnings("serial")
@PersistenceCapable
public class Department implements Serializable 
{
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private String dept_name;
	
	@Persistent 
	private Long uty_id;
	
	public Department(String dept_name,Long uty_id)
	{
			this.uty_id = uty_id;
			this.dept_name = dept_name;
	}
	public String getName()
	{
		return this.dept_name;
	}
	public Long getId()
	{
		return this.id;
	}
}