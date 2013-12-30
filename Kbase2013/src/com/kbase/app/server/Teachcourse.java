package com.kbase.app.server;


import javax.jdo.annotations.IdGeneratorStrategy;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;



@PersistenceCapable
public class Teachcourse
{

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private Long teacher_id;
	
	@Persistent
	private Long uty_id;
	
	@Persistent 
	private Long course_id;
	
	@Persistent
	private int approved;
	
	public Teachcourse(Long teacher_id,Long course_id,Long uty_id,int appr)
	{
			this.teacher_id = teacher_id;
			this.course_id = course_id;
			this.uty_id = uty_id;
			this.approved = appr;
	}

	public Long getCourse()
	{
		return this.course_id;
	}
	

	public Long getUty()
	{
		return this.uty_id;
	}
	
	public Long getId()
	{
		return this.id;
	}
	public void setApprove(int appr)
	{
		this.approved = appr;
	}
	public int getApprove()
	{
		return this.approved;
	}
	public Long getTeacher()
	{
		return this.teacher_id;
	}
	public String getKey()
	{
		return this.getKey();
	}
}



