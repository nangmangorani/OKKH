package com.kh.okkh.repository.model.service;

import java.util.ArrayList;

import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.repository.model.vo.MyProject;
import com.kh.okkh.repository.model.vo.Repo;

/**
 * 마이 프로젝트, 완료된 프로젝트, 레파지토리 서비스 인터페이스
 * 
 * @author 윤관현
 *
 */
public interface RepoService {
	
	// 내 프로젝트 전체 조회용 서비스
	public ArrayList<MyProject> selectMyProjectList(Member loginMember);
	
	// 내 팀원 조회용 서비스
	public ArrayList<Member> selectTeamMateList(int memNo);
	
	// 내 프로젝트 추가용 서비스
	public int insertMyProject(MyProject p);
	
}
