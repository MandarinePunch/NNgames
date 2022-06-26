package com.nngame.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;

public class SearchDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	
	public SearchDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}


	public List<SearchDTO> getSearchGameList(String keyword) {
		List<SearchDTO> searchgamelist = sqlsession.selectList("Search.getSearchGameList", keyword);
		
		return searchgamelist;
	}


	public int getSearchGameCnt(String keyword) {
		return sqlsession.selectOne("Search.getSearchGameCnt", keyword);
	}


	public List<SearchDTO> getSearchListDESC(String keyword) {
		List<SearchDTO> sortDesc = sqlsession.selectList("Search.getSearchListDESC", keyword);
		return sortDesc;
	}


	public List<SearchDTO> getSearchListASC(String keyword) {
		List<SearchDTO> sortAsc = sqlsession.selectList("Search.getSearchListASC", keyword);
		return sortAsc;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
