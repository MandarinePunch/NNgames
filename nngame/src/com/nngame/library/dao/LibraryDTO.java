package com.nngame.library.dao;

import com.nngame.game.dto.GameDTO;
import com.nngame.game.dto.ImageDTO;

public class LibraryDTO {
	private int lib_num;
	private int game_num;
	private int user_num;
	private String lib_playtime;
	private GameDTO gameDTO;
	private ImageDTO imageDTO;
	
	public int getLib_num() {
		return lib_num;
	}
	public void setLib_num(int lib_num) {
		this.lib_num = lib_num;
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
	public String getLib_playtime() {
		return lib_playtime;
	}
	public void setLib_playtime(String lib_playtime) {
		this.lib_playtime = lib_playtime;
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
