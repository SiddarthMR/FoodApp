package com.food.model;

public class Menu {
    private int menuId;
    private int restaurantId;
    private String name;
    private double price;
    private String description;
    private boolean isAvailable;
    private String imgPath;
   

    public Menu(int menuId, int restaurantId, String name, double price,
                String description, boolean isAvailable, String imgPath) {
        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.name = name;
        this.price = price;
        this.description = description;
        this.isAvailable = isAvailable;
        this.imgPath = imgPath;
        
    }

    // getters and setters
    public int getMenuId() { return menuId; }
    public void setMenuId(int menuId) { this.menuId = menuId; }

    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public boolean getIsAvailable() { return isAvailable; }
    public void setIsAvailable(boolean isAvailable) { this.isAvailable = isAvailable; }

    public String getImgPath() { return imgPath; }
    public void setImgPath(String imgPath) { this.imgPath = imgPath; }

    
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", restaurantId=" + restaurantId + ", name=" + name + ", price=" + price
				+ ", description=" + description + ", isAvailable=" + isAvailable + ", imgPath=" + imgPath
				+ "]";
	}

}
