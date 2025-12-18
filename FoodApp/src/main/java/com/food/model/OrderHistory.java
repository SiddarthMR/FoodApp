package com.food.model;

import java.util.Date;

public class OrderHistory {

    private int orderHistoryId;
    private int orderId;
    private int userId;
    private int restaurantId;
    private int menuId;

    private String restaurantName;
    private Date orderDate;
    private double totalAmount;
    private String status;
    private String paymentMode;
    private String menuName;

    public OrderHistory() {}

    // Constructor for SELECT (display history)
    public OrderHistory(int orderId, String restaurantName,String menuName, Date orderDate,
                        double totalAmount, String status, String paymentMode) {
        this.orderId = orderId;
        this.restaurantName = restaurantName;
        this.menuName=menuName;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.paymentMode = paymentMode;
    }

    // Constructor for INSERT (store history)
    public OrderHistory(int orderId, int userId, int restaurantId, int menuId,String restaurantName,
                       String menuName, Date orderDate, double totalAmount, String status, String paymentMode) {
        this.orderId = orderId;
        this.userId = userId;
        this.restaurantId = restaurantId;
        this.menuId = menuId;
        this.restaurantName=restaurantName;
        this.menuName=menuName;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.paymentMode = paymentMode;
    }

    public int getOrderHistoryId() {
		return orderHistoryId;
	}

	public void setOrderHistoryId(int orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }

    public int getMenuId() { return menuId; }
    public void setMenuId(int menuId) { this.menuId = menuId; }

    public String getPaymentMode() { return paymentMode; }
    public void setPaymentMode(String paymentMode) { this.paymentMode = paymentMode; }

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

    // existing getters...
}
