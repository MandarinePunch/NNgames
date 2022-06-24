package com.nngame.payment.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nngame.mybatis.SqlMapConfig;

public class PaymentDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public PaymentDAO() {
		sqlsession = factory.openSession(true);
	}
	
	// pay기록에 저장
	public void insertPayLog(int game_num, int user_num, String pay_method) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("game_num", game_num);
		map.put("user_num", user_num);
		map.put("pay_method", pay_method);
		
		sqlsession.insert("Payment.insertPayLog", map);
	}
	
	// lib에 저장
	public void insertLibrary(int game_num, int user_num) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("game_num", game_num);
		map.put("user_num", user_num);
		
		sqlsession.insert("Payment.insertLibrary", map);
	}
	
	
}












