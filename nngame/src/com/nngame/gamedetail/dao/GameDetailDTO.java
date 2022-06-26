package com.nngame.gamedetail.dao;

import com.nngame.game.dto.CategoryDTO;
import com.nngame.game.dto.GameDTO;
import com.nngame.game.dto.ImageDTO;

public class GameDetailDTO {
	private GameDTO gameDTO;
	private ImageDTO imageDTO;
	private CategoryDTO cateDTO;
	
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
	public CategoryDTO getCateDTO() {
		return cateDTO;
	}
	public void setCateDTO(CategoryDTO cateDTO) {
		this.cateDTO = cateDTO;
	}
}
