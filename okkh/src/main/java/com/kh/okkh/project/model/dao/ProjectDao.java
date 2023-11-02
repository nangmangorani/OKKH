package com.kh.okkh.project.model.dao;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.kh.okkh.common.model.vo.Bookmark;
import com.kh.okkh.common.model.vo.PageInfo;
import com.kh.okkh.common.model.vo.Reply;
import com.kh.okkh.common.model.vo.Stack;

import com.kh.okkh.member.model.vo.Member;
import com.kh.okkh.project.model.vo.Project;


@Repository
public class ProjectDao {

	/**
	 * leftBar에서 recruit 누르자마자 프로젝트 전체조회하는 메소드
	 * @return
	 */
//	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession){
//		
//		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList");
//	}
	
	
	/**
	 * 프로젝터 전체 개수 구하는 메소드
	 * @param sqlSession
	 * @return
	 */
	public int selectProjectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.selectProjectListCount");
	}

	
	/**
	 * 프로젝트 전체 조회하는 메소드
	 * @return
	 */
	public ArrayList<Project> selectProjectList(PageInfo pi, SqlSessionTemplate sqlSession){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 게시글 몇 개 건너뛸건지
		int limit = pi.getBoardLimit();
				
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList) sqlSession.selectList("projectMapper.selectProjectList", pi, rowBounds);
		
		
	}
	
	
	
	/**
	 * 프로젝트 조회수 증가시키는 메소드
	 * @return
	 */
	public int increaseCount( int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.increaseCount", pno);
	}
	
	
	
	
	/**
	 * 프로젝트 찐으로 상세조회하는 메소드
	 * @return
	 */
	public Project selectDetailPro(int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("projectMapper.selectDetailPro", pno);
	}
	
	
	/**
	 * 프로젝트 모집 완료하는 메소드
	 * @return
	 */
	public int recruitDonePro(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.recruitDonePro", pno);
	}
	
	
	/** 프로젝트 재 모집하는 메소드
	 * @return
	 */
	public int recruitReplayPro(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.recruitReplayPro", pno);
	}
	
	
	
	
	/**
	 * 프로젝트 작성폼으로 가기전 기술스택 리스트 조회하는 메소드
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Stack> selectStackList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectStackList");
	}
	
	
	
	/**
	 * 찐으로 프로젝트 작성하는 메소드
	 * @return
	 */
	public int insertProject(Project p, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	
	
	/**
	 * 찐으로 프로젝트 수정하는 메소드
	 * @return
	 */
	public int updateProject(Project p, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.updateProject", p);
	}
	
	
	
	
	/**
	 * 프로젝트 삭제하는 메소드
	 * @return
	 */
	public int deleteProject(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.deleteProject", pno);
	}
	
	
	
	/**
	 * 프로젝트 삭제할 때 작성자의 team번호도 0으로 업뎃
	 * @return
	 */
	public int updateTeamNo(int memNo,SqlSessionTemplate sqlSession) {
		return sqlSession.update("projectMapper.updateTeamNo", memNo);
	}
	
	
	/**
	 * 댓글 작성하는 메소드
	 * @return
	 */
	public int insertReplyProject(Reply r, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("projectMapper.insertReplyProject", r);
		
	}
	
	
	
	/**
	 * 프로젝트 댓글 리스트 조회용 메소드
	 * @return
	 */
	public ArrayList<Reply> selectProjectReplyList(int pno,SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectReplyList", pno);
		
	}
	
	
	
	/**
	 * 프로젝트 댓글 삭제용 메소드
	 * @return
	 */
	public int deleteReplyProject(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.deleteReplyProject", pno);
	}
	
	
	
	
	/**
	 * 프로젝트 북마크 목록조회하는 메소드
	 * @param memNo
	 * @param sqlSession
	 * @return
	 */
	public Bookmark selectProBookmart(Bookmark b,SqlSessionTemplate sqlSession){
		
		return sqlSession.selectOne("projectMapper.selectProBookmark", b);
	}
	
	
	/**
	 * 해당 게시글의 북마크 개수 조회하는 메소드
	 * @return
	 */
	public int selectBookCount(int pno,SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("projectMapper.selectBookCount", pno);
	}
	
	
	
	/**
	 * 해당 게시글에 사용자가 북마크를 했는지 개수세는 메소드
	 * @return
	 */
	public int selectBookCountPersonal(Bookmark b,SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("projectMapper.selectBookCountPersonal", b);
	}
	
	
	/**
	 * 북마크 삽입하러 가기
	 * @return
	 */
	public int insertProBookmark(Bookmark b,SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("projectMapper.insertProBookmark", b);
	}
	
	
	/**
	 * 북마크 삭제하는 메소드
	 * @return
	 */
	public int deleteProBookmark(Bookmark b, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("projectMapper.deleteProBookmark", b);
	}
	
	
	/**
	 * 프로젝트 참여버튼을 눌렀을때 team테이블을 업데이트 하는 메소드
	 * @return
	 */
	public int participateProject(Member m, SqlSessionTemplate sqlSession) {
		
		
		//System.out.println(m.getTeam() + " : 팀 번호!!!");
		
		
		
		
		return sqlSession.update("projectMapper.participateProject", m);
	}
	
	
	/**
	 *  프로젝트 참여 취소용 메소드
	 * @param memNo
	 * @param sqlSession
	 * @return
	 */
	public int deleteEnrollProject(int memNo,SqlSessionTemplate sqlSession) {
		return sqlSession.update("projectMapper.deleteEnrollProject", memNo);
	}
	
	
	
	/**
	 * 멤버 상세내용 조회하는 메소드
	 * @return
	 */
	public Member selectMember(int memNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("projectMapper.selectMember", memNo);
		
	}
	
	
	
	/**
	 * 프로젝트 작성자가 프로젝트 모집 작성 후 팀번호 입력하는 메소드
	 * @return
	 */
	public int insertTeam(Member m,SqlSessionTemplate sqlSession) {
		return sqlSession.update("projectMapper.insertTeam", m);
	}
	
	
	
	/**
	 * 작성자가 모집 완료하면 member테이블의 team컬럼 상태 변경하는 메소드
	 * @return
	 */
	public int updateMemberTeam(int pno, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.updateMemberTeam", pno);
	}
	
	
	/**
	 * 작성자가 재모집하면 member테이블에 team_status도 다시 변경해주는 메소드
	 * @return
	 */
	public int reUpdateMemberTeam(int pno, SqlSessionTemplate sqlSession) {
		return sqlSession.update("projectMapper.reUpdateMemberTeam", pno);
	}
	
	
	/**
	 * 프로젝트 상세페이지에서 오른쪽에 팀원 추가하기 card에서 필요한 참여희망을 신청하는 회원 목록 조회하는 메소드
	 * @return
	 */
	public ArrayList<Member> selectProjectTeamMateList(int pno,SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectTeamMateList", pno);
	}
	
	
	
	
	/**
	 * 프로젝트에 팀원 추가하는 메소드
	 */
	public  int enrollTeamMate(List<Integer>memNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("projectMapper.enrollTeamMate", memNo);
	}

	
	
	/**
	 * 프로젝트에 팀원 해제하는 메소드
	 * @return
	 */
	public int deleteTeamMate(List<Integer> memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("projectMapper.deleteTeamMate", memNo);
	}

	
	/**
	 * mainpage top 4
	 */
	public ArrayList<Project> selectProjectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("projectMapper.selectProjectTopList");
	}
	
	
	
	
}
