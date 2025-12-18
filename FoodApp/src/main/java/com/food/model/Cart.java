package com.food.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items = new LinkedHashMap<>();

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    // ✅ MULTI-RESTAURANT ALLOWED
    public void addItem(CartItem item) {
        if (items.containsKey(item.getItemId())) {
            CartItem existing = items.get(item.getItemId());
            existing.setQuantity(existing.getQuantity() + item.getQuantity());
        } else {
            items.put(item.getItemId(), item);
        }
    }

    public void updateItem(int itemId, int quantity) {
        if (items.containsKey(itemId)) {
            items.get(itemId).setQuantity(quantity);
        }
    }

    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    public void clear() {
        items.clear();
    }

    public double getTotal() {
        return items.values().stream()
                .mapToDouble(CartItem::getSubtotal)
                .sum();
    }
}
