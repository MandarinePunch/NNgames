package com.nngame.library.dao;

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
	
}








