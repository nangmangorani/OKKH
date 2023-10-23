package com.kh.okkh.milestone.model.service;

import javax.servlet.http.HttpSession;

import com.kh.okkh.milestone.model.vo.Milestone;

public interface MilestoneService {

	Milestone getMilestoneByMno(String repository, HttpSession session, int mno);
}
