package com.food.model;

public class CartItem {

    private int itemId;
    private int restaurantId;
    private String restaurantName;
    private String name;
    private int quantity;
    private double price;

    public CartItem(int itemId, int restaurantId, String restaurantName, String name, int quantity, double price) {
        this.itemId = itemId;
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters
    public int getItemId() { return itemId; }
    public int getRestaurantId() { return restaurantId; }
    public String getRestaurantName() { return restaurantName; }
    public String getName() { return name; }
    public int getQuantity() { return quantity; }
    public double getPrice() { return price; }

    // ✅ Setter for quantity
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Calculate subtotal
    public double getSubtotal() {
        return price * quantity;
    }
}
