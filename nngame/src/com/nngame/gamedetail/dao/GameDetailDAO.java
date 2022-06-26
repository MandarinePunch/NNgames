package com.nngame.gamedetail.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;
import com.nngame.review.dto.ReviewDTO;

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

	// 게임 리뷰 작성
	public void insertReview(int gameNum, int userNum, String reviewContent, int starRate) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("game_num", gameNum);
		map.put("user_num", userNum);
		map.put("review_content", reviewContent);
		map.put("review_rate", starRate);
		
		sqlsession.insert("GameDetail.insertReview", map);
	}
	
	// 게임 리뷰 출력
	public List<ReviewDTO> getReviewList(int gameNum){
		List<ReviewDTO> list = sqlsession.selectList("GameDetail.getReviewList", gameNum);
		
		return list;
	}

	// 리뷰 삭제
	public void deleteReview(int reviewNum) {
		sqlsession.delete("GameDetail.deleteReview", reviewNum);
	}

}












