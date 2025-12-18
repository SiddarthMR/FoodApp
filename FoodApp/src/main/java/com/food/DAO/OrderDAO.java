package com.food.DAO;

import java.util.ArrayList;
import com.food.model.orderTable;

public interface OrderDAO {

    int addOrder(orderTable o);

    int addOrderAndReturnId(orderTable o);

    ArrayList<orderTable> getAllOrders();

    orderTable getOrder(int orderId);

    int updateOrder(orderTable o);

    int deleteOrder(int orderId);
    
    orderTable getOrderWithNames(int orderId);

}
