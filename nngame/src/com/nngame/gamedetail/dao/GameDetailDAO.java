package com.nngame.gamedetail.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;

public class GameDetailDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public GameDetailDAO() {
		sqlsession = factory.openSession(true);
	}
	
	// 게임 상세 받아오기
	public GameDetailDTO getGameDetail(int game_num) {
		GameDetailDTO gddto = sqlsession.selectOne("GameDetail.getGameDetail", game_num);
				
		return gddto;
	}
	

}











