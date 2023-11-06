package com.kh.okkh.member.model.service;

import java.util.ArrayList;

import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Stack;
import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.pr.model.vo.PR;
import com.kh.okkh.project.model.vo.Project;


public interface MemberService {
	
	Member selectMember(Member m);
	
	int insertMember(Member m);
	
	ArrayList<Stack> selectStackList();

	int updateMember(Member m);
	
	ArrayList<PR> myPRList(PageInfo pi);

	ArrayList<Project> myPJList(Member m);

	ArrayList<PR> myPRList(Member m);

	
}
