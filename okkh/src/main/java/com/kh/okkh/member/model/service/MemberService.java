package com.kh.okkh.member.model.service;

import com.kh.okkh.member.model.vo.Member;


public interface MemberService {
	
	Member selectMember(Member m);
	
	int insertMember(Member m);

	int updateMember(Member m);

}
