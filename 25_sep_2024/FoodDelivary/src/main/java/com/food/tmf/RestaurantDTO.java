package com.food.tmf;

import java.util.List;

public class RestaurantDTO {

	public String resName; 
	public String resRating; 
	public String costForTwo; 
	public List<String> cusinsList;
	
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResRating() {
		return resRating;
	}
	public void setResRating(String resRating) {
		this.resRating = resRating;
	}
	public String getCostForTwo() {
		return costForTwo;
	}
	public void setCostForTwo(String costForTwo) {
		this.costForTwo = costForTwo;
	}
	public List<String> getCusinsList() {
		return cusinsList;
	}
	public void setCusinsList(List<String> cusinsList) {
		this.cusinsList = cusinsList;
	}
	public RestaurantDTO(String resName, String resRating, String costForTwo, List<String> cusinsList) {
		super();
		this.resName = resName;
		this.resRating = resRating;
		this.costForTwo = costForTwo;
		this.cusinsList = cusinsList;
	}
	
	
	
	
}
