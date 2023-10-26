package com.kh.okkh.milestone.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Milestone {

	private String title;
	private String creator;
	private String state;        
	private String number;
	//private String[] issues;
	private String content;
	private String milestoneId;
	private String createdAt;    
	private String updatedAt;    
	private String closedAt;     
	private String profile;      
	private String dueOn;
	private int openedIssues;
	private int closedIssues;
	private double finPercent;
	
	
	public Milestone(String milestoneId, String title,  String number, String state) {
		super();
		this.milestoneId = milestoneId;
		this.title = title;
		this.number = number;
		this.state = state;
	}


	public Milestone(String title, String creator, String state, String number, String milestoneId,
			String createdAt, String updatedAt, String closedAt, String profile, String dueOn, int openedIssue,
			int closedIssues, double finPercent) {
		
		this.title = title;
	    this.creator = creator;
	    this.state = state;
	    this.number = number;
	    this.milestoneId = milestoneId;
	    this.createdAt = createdAt;
	    this.updatedAt = updatedAt;
	    this.closedAt = closedAt;
	    this.profile = profile;
	    this.dueOn = dueOn;
	    this.openedIssues = openedIssue;
	    this.closedIssues = closedIssues;
	    this.finPercent = finPercent;
	}
    
    
    
    
    
    
}
