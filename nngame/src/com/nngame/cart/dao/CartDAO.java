package com.nngame.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;	
import org.apache.ibatis.session.SqlSessionFactory;
import org.omg.PortableInterceptor.USER_EXCEPTION;

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

	public boolean deleteCart(int cart_num) {
		boolean result = false;
		
		if(sqlsession.delete("Cart.deleteCart", cart_num) != 0) {
			result = true;
		}
		
		return result;
	}
	
}
