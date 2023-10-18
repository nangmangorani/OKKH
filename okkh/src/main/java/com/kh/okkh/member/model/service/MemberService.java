package com.kh.okkh.member.model.service;

import com.kh.okkh.member.model.vo.Member;


public interface MemberService {
	
	int idCheck(String id);
	
	int insertMember(Member m);
	
	Member selectMember(Member m);
	
	int enrollToken(Member m);

}
