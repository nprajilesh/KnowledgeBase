package com.kbase.app.server;


import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@SuppressWarnings("serial")
@PersistenceCapable
public class Presentation implements Serializable 
{
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private Long course_id;
	
	@Persistent 
	private String present_id;
	
	@Persistent 
	private String present_name;
	
	@Persistent 
	private Long tchr_id;
	
	@Persistent 
	private Long teach_course_id;
	
	public Presentation(String present_name,String present_id,Long course_id,Long tchr_id,Long teach_course_id)
	{
			this.present_name = present_name;
			this.present_id = present_id;
			this.course_id = course_id;
			this.tchr_id = tchr_id;
			this.teach_course_id = teach_course_id;
	}
	public String getPresentId()
	{
		return this.present_id;
	}
	public Long getCourse()
	{
		return this.course_id;
	}
	public Long getTeacher()
	{
		return this.tchr_id;
	}
	public Long TeachCourseId()
	{
		return this.teach_course_id;
	}
	public String getPresentname()
	{
		return this.present_name;
	}
	public Long getId()
	{
		return this.id;
	}
}