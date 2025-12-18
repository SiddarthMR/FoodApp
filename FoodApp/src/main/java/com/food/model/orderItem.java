package com.food.model;

public class orderItem {
    private int orderId;
    private int menuId;
    private int restaurantId;
    private String menuName;
    private String restaurantName;
    private int quantity;
    private double subTotal;

    // Constructor used for inserting into DB
    public orderItem(int orderId, int menuId, int restaurantId, String menuName, String restaurantName, int quantity, double subTotal) {
        this.orderId = orderId;
        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.menuName = menuName;
        this.restaurantName = restaurantName;
        this.quantity = quantity;
        this.subTotal = subTotal;
    }

    // Getters
    public int getOrderId() {
        return orderId;
    }

    public int getMenuId() {
        return menuId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public String getMenuName() {
        return menuName;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getSubTotal() {
        return subTotal;
    }
}
