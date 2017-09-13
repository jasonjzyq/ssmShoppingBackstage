package org.lanqiao.service;

import java.util.List;

import org.lanqiao.entity.Order;

public interface OrderManageService {
	public List<Order> getAllOrder();
	
	public void changeOrder(Order order);
}
