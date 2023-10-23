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
    
    
    
    
    
    
}
