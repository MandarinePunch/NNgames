package com.nngame.store.dao;

import com.nngame.game.dto.CategoryDTO;
import com.nngame.game.dto.GameDTO;
import com.nngame.game.dto.ImageDTO;

public class StoreDTO {
	
	private GameDTO gameDTO;
	private CategoryDTO categoryDTO;
	private ImageDTO imageDTO;
	
	public GameDTO getGameDTO() {
		return gameDTO;
	}
	public void setGameDTO(GameDTO gameDTO) {
		this.gameDTO = gameDTO;
	}
	public CategoryDTO getCategoryDTO() {
		return categoryDTO;
	}
	public void setCategoryDTO(CategoryDTO categoryDTO) {
		this.categoryDTO = categoryDTO;
	}
	public ImageDTO getImageDTO() {
		return imageDTO;
	}
	public void setImageDTO(ImageDTO imageDTO) {
		this.imageDTO = imageDTO;
	}
	
	
	
	

}
