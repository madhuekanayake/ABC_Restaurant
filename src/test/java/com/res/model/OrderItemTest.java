package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class OrderItemTest {
	
	private OrderItem orderItem;

    @BeforeEach
    public void setUp() {
        orderItem = new OrderItem(1, 101, 201, "Pizza", 2, 12.50);
    }

    @Test
    public void testOrderItemConstructor() {
        assertEquals(1, orderItem.getId());
        assertEquals(101, orderItem.getOrderId());
        assertEquals(201, orderItem.getProductId());
        assertEquals("Pizza", orderItem.getProductName());
        assertEquals(2, orderItem.getQuantity());
        assertEquals(12.50, orderItem.getPrice(), 0.001);
    }

    @Test
    public void testSettersAndGetters() {
        orderItem.setId(2);
        assertEquals(2, orderItem.getId());

        orderItem.setOrderId(102);
        assertEquals(102, orderItem.getOrderId());

        orderItem.setProductId(202);
        assertEquals(202, orderItem.getProductId());

        orderItem.setProductName("Burger");
        assertEquals("Burger", orderItem.getProductName());

        orderItem.setQuantity(3);
        assertEquals(3, orderItem.getQuantity());

        orderItem.setPrice(10.00);
        assertEquals(10.00, orderItem.getPrice(), 0.001);
    }

    @Test
    public void testGetSubtotal() {
        // Subtotal for 2 items, each priced at 12.50
        assertEquals(2 * 12.50, orderItem.getSubtotal(), 0.001);

        // Update quantity and price
        orderItem.setQuantity(4);
        orderItem.setPrice(15.00);
        
        // Subtotal for 4 items, each priced at 15.00
        assertEquals(4 * 15.00, orderItem.getSubtotal(), 0.001);
    }

}
