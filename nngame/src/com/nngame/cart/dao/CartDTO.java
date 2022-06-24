package com.nngame.cart.dao;

import java.sql.Date;

import com.nngame.game.dto.ImageDTO;
import com.nngame.game.dto.GameDTO;
import com.nngame.user.dao.UserDTO;


public class CartDTO {
	private String cart_num;	// 장바구니 번호
	private String cart_in;		// 장바구니 담은 날짜
	private int game_num;		// 게임 번호
	private int user_num;		// 유저 정보
	private GameDTO gameDTO;	// 게임 번호, 가격 가져오기
	private ImageDTO imageDTO;	// 게임 이미지 파일 가져오기
	
	public String getCart_num() {
		return cart_num;
	}
	public void setCart_num(String cart_num) {
		this.cart_num = cart_num;
	}
	public String getCart_in() {
		return cart_in;
	}
	public void setCart_in(String cart_in) {
		this.cart_in = cart_in;
	}
	public int getGame_num() {
		return game_num;
	}
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public GameDTO getGameDTO() {
		return gameDTO;
	}
	public void setGameDTO(GameDTO gameDTO) {
		this.gameDTO = gameDTO;
	}
	public ImageDTO getImageDTO() {
		return imageDTO;
	}
	public void setImageDTO(ImageDTO imageDTO) {
		this.imageDTO = imageDTO;
	}
	
	

	
	
	
	

	
	
}
