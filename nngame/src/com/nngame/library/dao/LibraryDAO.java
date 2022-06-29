package com.nngame.library.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession; 
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;

public class LibraryDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public LibraryDAO() {
		sqlsession = factory.openSession(true);
	}
	
	// 라이브러리 리스트
	public List<LibraryDTO> getLibraryList(int user_num) {
		System.out.println("getLibraryList도착");		// 에러 추적 과정
		List<LibraryDTO> LibraryList = sqlsession.selectList("Library.getLibraryList", user_num);
		
		return LibraryList;
	}
	
	// 라이브러리 개수
	public int getTotalCnt(int user_num) {
		int result = sqlsession.selectOne("Library.getTotalCnt", user_num);
		
		return result;
	}
	
	// 게임 번호 가져옴
	public List<Integer> getGameNum(int user_num){
		List<Integer> list = sqlsession.selectList("Library.getGameNum", user_num);
		
		return list;
	}
	
	// 라이브러리 내에 게임 검색
	public List<LibraryDTO> getLibSearchList(int user_num, String keyword) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_num", user_num);
		map.put("keyword", keyword);
		
		List<LibraryDTO> LibraryList = sqlsession.selectList("Library.getLibSearchList", map);
		
		return LibraryList;
	}
	
	// 라이브러리 내 검색된 게임 수
	public int getLibSearchCnt(int user_num, String keyword) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_num", user_num);
		map.put("keyword", keyword);
		
		int result = sqlsession.selectOne("Library.getLibSearchCnt", map);
		
		return result;
	}
}








