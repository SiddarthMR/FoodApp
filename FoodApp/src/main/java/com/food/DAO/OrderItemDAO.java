package com.food.DAO;

import com.food.model.orderItem;
import java.util.ArrayList;

public interface OrderItemDAO {

    int addOrderItem(orderItem oi);

    ArrayList<orderItem> getOrderItemsByOrderId(int orderId);

    orderItem getOrderItem(int orderItemId);

    int deleteOrderItem(int orderItemId);
}
