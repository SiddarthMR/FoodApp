package com.food.model;

public class Restaurant {
    private int restaurantId;
    private String restaurantName;
    private String deliveryTime;
    private String cuisineType;
    private String address;
    private double rating;
    private boolean isActive;
  
    private String imagePath;

    public Restaurant() {}

    public Restaurant(int restaurantId, String restaurantName, String deliveryTime, String cuisineType,
                      String address, double rating, boolean isActive, String imagePath) {
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.deliveryTime = deliveryTime;
        this.cuisineType = cuisineType;
        this.address = address;
        this.rating = rating;
        this.isActive = isActive;
        this.imagePath = imagePath;
    }

    public Restaurant(String restaurantName, String deliveryTime, String cuisineType, String address, double rating,
			boolean isActive, String imagePath) {
		super();
		this.restaurantName = restaurantName;
		this.deliveryTime = deliveryTime;
		this.cuisineType = cuisineType;
		this.address = address;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}

	// Getters and Setters
    public int getRestaurantId() {
        return restaurantId;
    }
    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }
    public String getRestaurantName() {
        return restaurantName;
    }
    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }
    public String getDeliveryTime() {
        return deliveryTime;
    }
    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }
    public String getCuisineType() {
        return cuisineType;
    }
    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public double getRating() {
        return rating;
    }
    public void setRating(double rating) {
        this.rating = rating;
    }
    public boolean isActive() {
        return isActive;
    }
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
   
    public String getImagePath() {
        return imagePath;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", deliveryTime="
				+ deliveryTime + ", cuisineType=" + cuisineType + ", address=" + address + ", rating=" + rating
				+ ", isActive=" + isActive + ", imagePath=" + imagePath + "]";
	}

	
	
    
}
