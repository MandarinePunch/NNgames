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
	
	public int getTotalCnt() {
		int cnt = sqlsession.selectOne("Library.getTotalCnt");
		System.out.println("getTotalCnt :"+cnt);	// 에러 추적 과정
		return sqlsession.selectOne("Library.getTotalCnt");
	}

//	public List<LibraryDTO> getLibraryList() {
//		System.out.println("getLibraryList도착");		// 에러 추적 과정
//		List<LibraryDTO> LibraryList = sqlsession.selectList("Library.getLibraryList");
//		
//		return LibraryList;
//	}
	
	public List<LibraryDTO> getLibraryList(int user_num) {
		System.out.println("getLibraryList도착");		// 에러 추적 과정
		List<LibraryDTO> LibraryList = sqlsession.selectList("Library.getLibraryList", user_num);
		
		return LibraryList;
	}
}
