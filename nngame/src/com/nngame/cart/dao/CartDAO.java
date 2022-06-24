package com.nngame.cart.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;	
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;

public class CartDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public CartDAO() {
		sqlsession = factory.openSession(true);
	}
	
	// cart 담은 게시판 정보
	public List<CartDTO> getCartGamelist(int user_num){
		List<CartDTO> cartgamelist = sqlsession.selectList("Cart.getCartGamelist", user_num);
		
		return cartgamelist;
	}

	// 장바구니 삭제
	public boolean deleteCart(int cart_num) {
		boolean result = false;
		
		if(sqlsession.delete("Cart.deleteCart", cart_num) != 0) {
			result = true;
		}
		
		return result;
	}

	// 장바구니에 insert
	public boolean insertCart(int game_num, int user_num) {
		boolean result = false;
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("game_num", game_num);
		map.put("user_num", user_num);
		
		if(sqlsession.insert("Cart.insertCart", map) != 0) {
			result = true;
		}
		
		return result;
	}
	
	// 장바구니 중복 방지를 위해 현재 장바구니에 있는 게임을 받아옴
	public List<Integer> getGameNum(int user_num) {
		List<Integer> list = sqlsession.selectList("Cart.getGameNum", user_num);
		
		return list;
	}
	
}






