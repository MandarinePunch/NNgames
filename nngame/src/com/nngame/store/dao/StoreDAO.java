package com.nngame.store.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;

public class StoreDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	
	public StoreDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}
	
	// 모든 게임리스트 받기
	public List<StoreDTO> getStoreGameList() {
		
		List<StoreDTO> storegamelist = sqlsession.selectList("Store.getStoreGameList");
		
		return storegamelist;
	}
	
	// 모든 게임수 받기
	public int getStoreGameCnt() {
		return sqlsession.selectOne("Store.getStoreGameCnt");
	}

	// 장르별 게임리스트 받기
	public List<StoreDTO> getGenreList(int genre) {
		List<StoreDTO> genrelist = sqlsession.selectList("Store.getGenreList", genre );
		
		return genrelist;
	}
	
	// 장르별 게임수 받기
	public int getGenreCnt(int genre) {
		return sqlsession.selectOne("Store.getGenreCnt", genre);
	}
	
	
	

}
