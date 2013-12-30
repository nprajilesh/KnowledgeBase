package com.kbase.app.server;


import java.io.Serializable;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@SuppressWarnings("serial")
@PersistenceCapable
public class Video implements Serializable 
{
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private Long course_id;
	
	@Persistent 
	private String video_id;
	
	@Persistent 
	private String video_name;
	
	@Persistent 
	private Long tchr_id;
	

	@Persistent 
	private Long teach_course_id;
	
	public Video(String video_name,String video_id,Long course_id,Long tchr_id,Long teach_course_id)
	{
			this.video_name = video_name;
			this.video_id = video_id;
			this.course_id = course_id;
			this.tchr_id = tchr_id;
			this.teach_course_id = teach_course_id;
	}
	public String getVideoId()
	{
		return this.video_id;
	}
	public Long getCourse()
	{
		return this.course_id;
	}
	public Long TeachCourseId()
	{
		return this.teach_course_id;
	}
	public Long getTeacher()
	{
		return this.tchr_id;
	}
	
	public String getVideoname()
	{
		return this.video_name;
	}
	public Long getId()
	{
		return this.id;
	}
}