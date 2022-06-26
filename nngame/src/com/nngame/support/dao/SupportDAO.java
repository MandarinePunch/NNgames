package com.nngame.support.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;

public class SupportDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public SupportDAO() {
		//autocommit
		sqlsession = factory.openSession(true);
	}
	
	// support 게시판 모든 리스트 받아오기
	public List<SupportDTO> getBoardList(int startRow, int endRow){
		HashMap<String, Integer> data = new HashMap<>();
		data.put("startRow", startRow);
		data.put("endRow", endRow);
		
		List<SupportDTO> list = sqlsession.selectList("Support.getBoardList", data);
		
		return list;
	}
	
	// support 게시판 모든 리스트 개수 받아오기
	public int getSupportCount() {
		return sqlsession.selectOne("Support.getSupportCount");
	}
	
	// support 게시판 특정 글 가져오기(support_num이용)
	public SupportDTO getOneWriting(String support_num) {
		SupportDTO bean = sqlsession.selectOne("Support.getOneWriting", support_num);
		
		return bean;
	}
	
	// support 글 삽입
	public void insertBoard(SupportDTO sdto) {
		sqlsession.insert("Support.insertBoard", sdto);
	}
	
	// support 글 삭제
	public void deleteBoard(String support_num) {
		sqlsession.delete("Support.deleteBoard", support_num);
	}
	
	// support 글 업데이트
	public void updateBoard(SupportDTO sdto) {
		sqlsession.update("Support.updateBoard", sdto);
	}

	// 글 상세 번호 가져오기
	public int getDetailNum() {
		return sqlsession.selectOne("Support.getDetailNum");
	}	
	
	public void updateUserName(String user_nickname, int user_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_nickname", user_nickname);
		map.put("user_num", user_num);
		
		sqlsession.update("Support.updateUserName", map);
	}
}
























