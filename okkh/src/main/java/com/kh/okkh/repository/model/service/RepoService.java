package com.kh.okkh.repository.model.service;

import java.util.ArrayList;

import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.vo.MyProject;
import com.kh.okkh.repository.model.vo.Repo;

public interface RepoService {
	
	public ArrayList<MyProject> selectMyProjectList(Member loginMember);
	
}
