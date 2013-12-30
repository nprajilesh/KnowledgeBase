package com.kbase.app.server;


import javax.jdo.annotations.IdGeneratorStrategy;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;



@PersistenceCapable
public class StudCourse
{

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private Long teach_course_id;
	
	@Persistent
	private Long student_id;
	
	@Persistent
	private int approved;
	
	public StudCourse(Long teach_course_id,Long student_id,int appr)
	{
			this.teach_course_id = teach_course_id;
			this.student_id = student_id;
			this.approved = appr;
	}

	public Long getTeachCourse()
	{
		return this.teach_course_id;
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
	public Long getStudent()
	{
		return this.student_id;
	}
	public String getKey()
	{
		return this.getKey();
	}
}



